-- Migration 003: Fix rest-day toggle refund
--
-- Bug: toggle_rest_day() decremented rest_days_remaining when enabling a rest
-- day but never refunded it when disabling. The only replenish path was the
-- weekly reset buried inside daily_check_in(). So once a user toggled the rest
-- day on and off within the same week, rest_days_remaining stayed at 0 and every
-- re-enable raised "No rest days remaining for this week!".
--
-- Fix: refund the rest day when it is turned OFF, and run the same weekly reset
-- daily_check_in() uses at the top of the function so availability is no longer
-- coupled to having checked in.

CREATE OR REPLACE FUNCTION public.toggle_rest_day()
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_rest_days integer;
  v_is_on_rest boolean;
  v_last_reset timestamptz;
BEGIN
  SELECT rest_days_remaining, is_on_rest_day, rest_days_last_reset
    INTO v_rest_days, v_is_on_rest, v_last_reset
  FROM public.users WHERE id = auth.uid();

  -- Weekly reset (1 rest day per week), same rule as daily_check_in().
  IF v_last_reset IS NULL OR (now() - v_last_reset) >= interval '7 days' THEN
    UPDATE public.users
    SET rest_days_remaining = 1,
        rest_days_last_reset = now()
    WHERE id = auth.uid();
    v_rest_days := 1;
  END IF;

  IF v_is_on_rest THEN
    -- Turn OFF and refund the rest day (it was never spent protecting a streak).
    UPDATE public.users
    SET is_on_rest_day = false,
        rest_days_remaining = rest_days_remaining + 1
    WHERE id = auth.uid();
    RETURN jsonb_build_object(
      'success', true,
      'isOnRestDay', false,
      'restDaysRemaining', v_rest_days + 1
    );
  ELSE
    -- Turn ON, consuming one rest day.
    IF v_rest_days <= 0 THEN
      RAISE EXCEPTION 'No rest days remaining for this week!';
    END IF;
    UPDATE public.users
    SET is_on_rest_day = true,
        rest_days_remaining = rest_days_remaining - 1
    WHERE id = auth.uid();
    RETURN jsonb_build_object(
      'success', true,
      'isOnRestDay', true,
      'restDaysRemaining', v_rest_days - 1
    );
  END IF;
END;
$$;

-- One-time heal: users left at 0 remaining by the old toggle bug (not currently
-- on a rest day) lost their weekly day to the missing refund. Restore it.
UPDATE public.users
SET rest_days_remaining = 1
WHERE rest_days_remaining < 1
  AND is_on_rest_day = false;
