-- Seed Exercises Library Part 3

INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Landmine 180''s', 'Abdominals', 'Other', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Landmine_180s/0.jpg', ARRAY['Glutes', 'Lower back', 'Shoulders']::TEXT[], ARRAY['Position a bar into a landmine or securely anchor it in a corner. Load the bar to an appropriate weight.', 'Raise the bar from the floor, taking it to shoulder height with both hands with your arms extended in front of you. Adopt a wide stance. This will be your starting position.', 'Perform the movement by rotating the trunk and hips as you swing the weight all the way down to one side. Keep your arms extended throughout the exercise.', 'Reverse the motion to swing the weight all the way to the opposite side.', 'Continue alternating the movement until the set is complete.']::TEXT[], 'Landmine_180s', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Landmine Linear Jammer', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Landmine_Linear_Jammer/0.jpg', ARRAY['Abdominals', 'Calves', 'Chest', 'Hamstrings', 'Quadriceps', 'Triceps']::TEXT[], ARRAY['Position a bar into landmine or, lacking one, securely anchor it in a corner. Load the bar to an appropriate weight and position the handle attachment on the bar.', 'Raise the bar from the floor, taking the handles to your shoulders. This will be your starting position.', 'In an athletic stance, squat by flexing your hips and setting your hips back, keeping your arms flexed.', 'Reverse the motion by powerfully extending through the hips, knees, and ankles, while also extending the elbows to straighten the arms. This movement should be done explosively, coming out of the squat to full extension as powerfully as possible.', 'Return to the starting position.']::TEXT[], 'Landmine_Linear_Jammer', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lateral Bound', 'Adductors', 'Legs', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lateral_Bound/0.jpg', ARRAY['Abductors', 'Calves', 'Glutes', 'Hamstrings', 'Quadriceps']::TEXT[], ARRAY['Assume a half squat position facing 90 degrees from your direction of travel. This will be your starting position.', 'Allow your lead leg to do a countermovement inward as you shift your weight to the outside leg.', 'Immediately push off and extend, attempting to bound to the side as far as possible.', 'Upon landing, immediately push off in the opposite direction, returning to your original start position.', 'Continue back and forth for several repetitions.']::TEXT[], 'Lateral_Bound', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lateral Box Jump', 'Adductors', 'Legs', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lateral_Box_Jump/0.jpg', ARRAY['Abductors', 'Calves', 'Glutes', 'Hamstrings', 'Quadriceps']::TEXT[], ARRAY['Assume a comfortable standing position, with a short box positioned next to you. This will be your starting position.', 'Quickly dip into a quarter squat to initiate the stretch reflex, and immediately reverse direction to jump up and to the side.', 'Bring your knees high enough to ensure your feet have good clearance over the box.', 'Land on the center of the box, using your legs to absorb the impact.', 'Carefully jump down to the other side of the box, and continue going back and forth for several repetitions.']::TEXT[], 'Lateral_Box_Jump', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lateral Cone Hops', 'Adductors', 'Legs', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lateral_Cone_Hops/0.jpg', ARRAY['Abductors', 'Calves', 'Glutes', 'Hamstrings', 'Quadriceps']::TEXT[], ARRAY['Position a number of cones in a row several feet apart.', 'Stand next to the end of the cones, facing 90 degrees to the direction of travel. This will be your starting position.', 'Begin the jump by dipping with the knees to initiate a stretch reflex, and immediately reverse direction to push off the ground, jumping up and sideways over the cone.', 'Use your legs to absorb impact upon landing, and rebound into the next jump, continuing down the row of cones.']::TEXT[], 'Lateral_Cone_Hops', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lateral Raise - With Bands', 'Shoulders', 'Shoulders', 'Bands', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lateral_Raise_-_With_Bands/0.jpg', NULL, ARRAY['To begin, stand on an exercise band so that tension begins at arm''s length. Grasp the handles using a pronated (palms facing your thighs) grip that is slightly less than shoulder width. The handles should be resting on the sides of your thighs. Your arms should be extended with a slight bend at the elbows and your back should be straight. This will be your starting position.', 'Use your side shoulders to lift the handles to the sides as you exhale. Continue to lift the handles until they are slightly above parallel. Tip: As you lift the handles, slightly tilt the hand as if you were pouring water and keep your arms extended. Also, keep your torso stationary and pause for a second at the top of the movement.', 'Lower the handles back down slowly to the starting position. Inhale as you perform this portion of the movement.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lateral_Raise_-_With_Bands', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Latissimus Dorsi-SMR', 'Lats', 'Back', 'Foam roll', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Latissimus_Dorsi-SMR/0.jpg', NULL, ARRAY['While lying on the floor, place a foam roll under your back and to one side, just behind your arm pit. This will be your starting position.', 'Keep the arm of the side being stretched behind and to the side of you as you shift your weight onto your lats, keeping your upper body off of the ground. Hold for 10-30 seconds, and switch sides.']::TEXT[], 'Latissimus_Dorsi-SMR', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leg-Over Floor Press', 'Chest', 'Chest', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leg-Over_Floor_Press/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Lie on the floor with one kettlebell in place on your chest, holding it by the handle. Extend leg on working side over leg on non-working side.Your free arm can be extended out to your side for support.', 'Press the kettlebll into a locked out position.', 'Lower the weight until the elbow touches the ground, keeping the kettlebell above the elbow. Repeat for the desired number of repetitions.']::TEXT[], 'Leg-Over_Floor_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leg-Up Hamstring Stretch', 'Hamstrings', 'Hamstrings', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leg-Up_Hamstring_Stretch/0.jpg', NULL, ARRAY['Lie flat on your back, bend one knee, and put that foot flat on the floor to stabilize your spine.', 'Extend the other leg in the air. If you''re tight, you wont be able to straighten it. That''s okay. Extend the knee so that the sole of the lifted foot faces the ceiling (or as close as you can get it).', 'Slowly straighten the legs as much as possible and then pull the leg toward your nose. Switch sides.']::TEXT[], 'Leg-Up_Hamstring_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leg Extensions', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leg_Extensions/0.jpg', NULL, ARRAY['For this exercise you will need to use a leg extension machine. First choose your weight and sit on the machine with your legs under the pad (feet pointed forward) and the hands holding the side bars. This will be your starting position. Tip: You will need to adjust the pad so that it falls on top of your lower leg (just above your feet). Also, make sure that your legs form a 90-degree angle between the lower and upper leg. If the angle is less than 90-degrees then that means the knee is over the toes which in turn creates undue stress at the knee joint. If the machine is designed that way, either look for another machine or just make sure that when you start executing the exercise you stop going down once you hit the 90-degree angle.', 'Using your quadriceps, extend your legs to the maximum as you exhale. Ensure that the rest of the body remains stationary on the seat. Pause a second on the contracted position.', 'Slowly lower the weight back to the original position as you inhale, ensuring that you do not go past the 90-degree angle limit.', 'Repeat for the recommended amount of times.']::TEXT[], 'Leg_Extensions', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leg Lift', 'Glutes', 'Legs', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leg_Lift/0.jpg', ARRAY['Hamstrings']::TEXT[], ARRAY['While standing up straight with both feet next to each other at around shoulder width, grab a sturdy surface such as the sides of a squat rack or the top of a chair to brace yourself and keep balance.', 'With or without an ankle weight, lift one leg behind you as if performing a leg curl but standing up while keeping the other leg straight. Breathe out as you perform this movement.', 'Slowly bring the raised leg back to the floor as you breathe in.', 'Repeat for the recommended amount of repetitions.', 'Repeat the movement with the opposite leg.']::TEXT[], 'Leg_Lift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leg Press', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leg_Press/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Using a leg press machine, sit down on the machine and place your legs on the platform directly in front of you at a medium (shoulder width) foot stance. (Note: For the purposes of this discussion we will use the medium stance described above which targets overall development; however you can choose any of the three stances described in the foot positioning section).', 'Lower the safety bars holding the weighted platform in place and press the platform all the way up until your legs are fully extended in front of you. Tip: Make sure that you do not lock your knees. Your torso and the legs should make a perfect 90-degree angle. This will be your starting position.', 'As you inhale, slowly lower the platform until your upper and lower legs make a 90-degree angle.', 'Pushing mainly with the heels of your feet and using the quadriceps go back to the starting position as you exhale.', 'Repeat for the recommended amount of repetitions and ensure to lock the safety pins properly once you are done. You do not want that platform falling on you fully loaded.']::TEXT[], 'Leg_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leg Pull-In', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leg_Pull-In/0.jpg', NULL, ARRAY['Lie on an exercise mat with your legs extended and your hands either palms facing down next to you or under your glutes. Tip: My preference is with the hands next to me. This will be your starting position.', 'Bend your knees and pull your upper thighs into your midsection as you breathe out. Continue the motion until your knees are around chest level. Contract your abs as you execute this movement and hold for a second at the top. Tip: As you perform the motion, the lower legs (calves) should always remain parallel to the floor.', 'Return to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Leg_Pull-In', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leverage Chest Press', 'Chest', 'Chest', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leverage_Chest_Press/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Load an appropriate weight onto the pins and adjust the seat for your height. The handles should be near the bottom or middle of the pectorals at the beginning of the motion.', 'Your chest and head should be up and your shoulder blades retracted. This will be your starting position.', 'Press the handles forward by extending through the elbow.', 'After a brief pause at the top, return the weight just above the start position, keeping tension on the muscles by not returning the weight to the stops until the set is complete.']::TEXT[], 'Leverage_Chest_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leverage Deadlift', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leverage_Deadlift/0.jpg', ARRAY['Glutes', 'Hamstrings']::TEXT[], ARRAY['Load the pins to an appropriate weight. Position yourself directly between the handles. Grasp the bottom handles with a comfortable grip, and then lower your hips as you take a breath. Look forward with your head and keep your chest up. This will be your starting position.', 'Return the weight to the starting position.']::TEXT[], 'Leverage_Deadlift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leverage Decline Chest Press', 'Chest', 'Chest', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leverage_Decline_Chest_Press/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Load an appropriate weight onto the pins and adjust the seat for your height. The handles should be near the bottom of the pectorals at the beginning of the motion. Your chest and head should be up and your shoulder blades retracted. This will be your starting position.', 'Press the handles forward by extending through the elbow.', 'After a brief pause at the top, return the weight just above the start position, keeping tension on the muscles by not returning the weight to the stops until the set is complete.']::TEXT[], 'Leverage_Decline_Chest_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leverage High Row', 'Middle back', 'Back', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leverage_High_Row/0.jpg', ARRAY['Lats']::TEXT[], ARRAY['Load an appropriate weight onto the pins and adjust the seat height so that you can just reach the handles above you. Adjust the knee pad to help keep you down. Grasp the handles with a pronated grip. This will be your starting position.', 'Pull the handles towards your torso, retracting your shoulder blades as you flex the elbow.', 'Pause at the bottom of the motion, and then slowly return the handles to the starting position.', 'For multiple repetitions, avoid completely returning the weight to the stops to keep tension on the muscles being worked.']::TEXT[], 'Leverage_High_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leverage Incline Chest Press', 'Chest', 'Chest', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leverage_Incline_Chest_Press/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Load an appropriate weight onto the pins and adjust the seat for your height. The handles should be near the top of the pectorals at the beginning of the motion. Your chest and head should be up and your shoulder blades retracted. This will be your starting position.', 'Press the handles forward by extending through the elbow.', 'After a brief pause at the top, return the weight just above the start position, keeping tension on the muscles by not returning the weight to the stops until the set is complete.']::TEXT[], 'Leverage_Incline_Chest_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leverage Iso Row', 'Lats', 'Back', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leverage_Iso_Row/0.jpg', ARRAY['Biceps', 'Middle back']::TEXT[], ARRAY['Load an appropriate weight onto the pins and adjust the seat height so that the handles are at chest level. Grasp the handles with either a neutral or pronated grip. This will be your starting position.', 'Pull the handles towards your torso, retracting your shoulder blades as you flex the elbow.', 'Pause at the bottom of the motion, and then slowly return the handles to the starting position. For multiple repetitions, avoid completely returning the weight to the stops to keep tension on the muscles being worked.']::TEXT[], 'Leverage_Iso_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leverage Shoulder Press', 'Shoulders', 'Shoulders', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leverage_Shoulder_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Load an appropriate weight onto the pins and adjust the seat for your height. The handles should be near the top of the shoulders at the beginning of the motion. Your chest and head should be up and handles held with a pronated grip. This will be your starting position.', 'Press the handles upward by extending through the elbow.', 'After a brief pause at the top, return the weight to just above the start position, keeping tension on the muscles by not returning the weight to the stops until the set is complete.']::TEXT[], 'Leverage_Shoulder_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Leverage Shrug', 'Traps', 'Back', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Leverage_Shrug/0.jpg', ARRAY['Forearms']::TEXT[], ARRAY['Load the pins to an appropriate weight. Position yourself directly between the handles.', 'Grasp the top handles with a comfortable grip, and then lower your hips as you take a breath. Look forward with your head and keep your chest up.', 'Drive through the floor with your heels, extending your hips and knees as you rise to a standing position. Keep your arms straight throughout the movement, finishing with your shoulders back. This will be your starting position.', 'Raise the weight by shrugging the shoulders towards your ears, moving straight up and down.', 'Pause at the top of the motion, and then return the weight to the starting position.']::TEXT[], 'Leverage_Shrug', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Linear 3-Part Start Technique', 'Hamstrings', 'Hamstrings', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Linear_3-Part_Start_Technique/0.jpg', ARRAY['Calves', 'Quadriceps']::TEXT[], ARRAY['This drill helps you accelerate as quickly as possible into a sprint from a dead stop. It helps to use a line to start from. Begin with two feet on the line. Place your left foot with the toe next to your right ankle. Place your right foot 4-6 inches behind the left.', 'Place your right hand onto the line, and thing bring your nose close to your left knee.', 'Squat down as you lean foward, your head being lower than your hips and your weight loaded onto the left leg. This will be your starting position.', 'Take your left hand up so that it is parallel to the ground, pointing behind you, and explode out when ready.']::TEXT[], 'Linear_3-Part_Start_Technique', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Linear Acceleration Wall Drill', 'Hamstrings', 'Hamstrings', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Linear_Acceleration_Wall_Drill/0.jpg', ARRAY['Calves', 'Glutes', 'Quadriceps']::TEXT[], ARRAY['Lean at around 45 degrees against a wall. Your feet should be together, glutes contracted.', 'Begin by lifting your right knee quickly, pausing, and then driving it straight down into the ground.', 'Switch legs, raising the opposite knee, and then attacking the ground straight down.', 'Repeat once more with your right leg, and as soon as the right foot strikes the ground hammer them out rapidly, alternating left and right as fast as you can.']::TEXT[], 'Linear_Acceleration_Wall_Drill', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Linear Depth Jump', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Linear_Depth_Jump/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['You will need two boxes or benches spaced a few feet away from each other. Begin by standing on one box facing towards the other platform.', 'To initiate the movement, gently drop down to the ground between your platforms, allowing the knees and hips to flex.', 'Reverse the motion by exploding, extending through the hips, knees, and ankles to jump onto the other platform.', 'Land softly, asborbing the impact through the legs.']::TEXT[], 'Linear_Depth_Jump', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Log Lift', 'Shoulders', 'Shoulders', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Log_Lift/0.jpg', ARRAY['Abdominals', 'Chest', 'Glutes', 'Hamstrings', 'Lower back', 'Middle back', 'Quadriceps', 'Traps', 'Triceps']::TEXT[], ARRAY['Begin standing with the log in front of you. Grasp the handles, and begin to clean the log. As you are bent over to start the clean, attempt to get the log as high as possible, pulling it into your chest. Extend through the hips and knees to bring it up to complete the clean.', 'Push your head back and look up, creating a shelf on your chest to rest the log. Begin the press by dipping, flexing slightly through the knees and reversing the motion. This push press will generate momentum to start the log moving vertically. Continue by extending through the elbows to press the log above your head. There are no strict rules on form, so use whatever techniques you are most efficient with. As the log is pressed, ensure that you push your head through on each repetition, looking forward.', 'Repeat as many times as possible. Attempt to control the descent of the log as it is returned to the ground.']::TEXT[], 'Log_Lift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('London Bridges', 'Lats', 'Back', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/London_Bridges/0.jpg', ARRAY['Biceps', 'Forearms', 'Middle back']::TEXT[], ARRAY['Attach a climbing rope to a high beam or cross member. Below it, ensure that the smith machine bar is locked in place with the safeties and cannot move. Alternatively, a secure box could also be utilized.', 'Stand on the bar, using the rope to balance yourself. This will be your starting position.', 'Keeping your body straight, lean back and lower your body by slowly going hand over hand with the rope. Continue until you are perpendicular to the ground.', 'Keeping your body straight, reverse the motion, going hand over hand back to the starting position.']::TEXT[], 'London_Bridges', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Looking At Ceiling', 'Quadriceps', 'Quads', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Looking_At_Ceiling/0.jpg', NULL, ARRAY['Kneel on the floor, holding your heels with both hands.', 'Lift your buttocks up and forward while bringing your head back to look up at the ceiling, to give an arch in your back.']::TEXT[], 'Looking_At_Ceiling', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Low Cable Crossover', 'Chest', 'Chest', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Low_Cable_Crossover/0.jpg', ARRAY['Shoulders']::TEXT[], ARRAY['To move into the starting position, place the pulleys at the low position, select the resistance to be used and grasp a handle in each hand.', 'Step forward, gaining tension in the pulleys. Your palms should be facing forward, hands below the waist, and your arms straight. This will be your starting position.', 'With a slight bend in your arms, draw your hands upward and toward the midline of your body. Your hands should come together in front of your chest, palms facing up.', 'Return your arms back to the starting position after a brief pause.']::TEXT[], 'Low_Cable_Crossover', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Low Cable Triceps Extension', 'Triceps', 'Triceps', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Low_Cable_Triceps_Extension/0.jpg', NULL, ARRAY['Select the desired weight and lay down face up on the bench of a seated row machine that has a rope attached to it. Your head should be pointing towards the attachment.', 'Grab the outside of the rope ends with your palms facing each other (neutral grip).', 'Position your elbows so that they are bent at a 90 degree angle and your upper arms are perpendicular (90 degree angle) to your torso. Tip: Keep the elbows in and make sure that the upper arms point to the ceiling while your forearms point towards the pulley above your head. This will be your starting position.', 'As you breathe out, extend your lower arms until they are straight and vertical. The upper arms and elbows remain stationary throughout the movement. Only the forearms should move. Contract the triceps hard for a second.', 'As you breathe in slowly return to the starting position.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Low_Cable_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Low Pulley Row To Neck', 'Shoulders', 'Shoulders', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Low_Pulley_Row_To_Neck/0.jpg', ARRAY['Biceps', 'Middle back', 'Traps']::TEXT[], ARRAY['Sit on a low pulley row machine with a rope attachment.', 'Grab the ends of the rope using a palms-down grip and sit with your back straight and your knees slightly bent. Tip: Keep your back almost completely vertical and your arms fully extended in front of you. This will be your starting position.', 'While keeping your torso stationary, lift your elbows and start bending them as you pull the rope towards your neck while exhaling. Throughout the movement your upper arms should remain parallel to the floor. Tip: Continue this motion until your hands are almost next to your ears (the forearms will not be parallel to the floor at the end of the movement as they will be angled a bit upwards) and your elbows are out away from your sides.', 'After holding for a second or so at the contracted position, come back slowly to the starting position as you inhale. Tip: Again, during no part of the movement should the torso move.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Low_Pulley_Row_To_Neck', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lower Back-SMR', 'Lower back', 'Back', 'Foam roll', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lower_Back-SMR/0.jpg', NULL, ARRAY['In a seated position, place a foam roll under your lower back. Cross your arms in front of you and protract your shoulders. This will be your starting position.', 'Raise your hips off of the floor and lean back, keeping your weight on your lower back. Now shift your weight slightly to one side, keeping your weight off of the spine and on the muscles to the side of it. Roll over your lower back, holding points of tension for 10-30 seconds. Repeat on the other side.']::TEXT[], 'Lower_Back-SMR', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lower Back Curl', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lower_Back_Curl/0.jpg', NULL, ARRAY['Lie on your stomach with your arms out to your sides. This will be your starting position.', 'Using your lower back muscles, extend your spine lifting your chest off of the ground. Do not use your arms to push yourself up. Keep your head up during the movement. Repeat for 10-20 repetitions.']::TEXT[], 'Lower_Back_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lunge Pass Through', 'Hamstrings', 'Hamstrings', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lunge_Pass_Through/0.jpg', ARRAY['Calves', 'Glutes', 'Quadriceps']::TEXT[], ARRAY['Stand with your torso upright holding a kettlebell in your right hand. This will be your starting position.', 'Step forward with your left foot and lower your upper body down by flexing the hip and the knee, keeping the torso upright. Lower your back knee until it nearly touches the ground.', 'As you lunge, pass the kettlebell under your front leg to your opposite hand.', 'Pressing through the heel of your foot, return to the starting position.', 'Repeat the movement for the recommended amount of repetitions, alternating legs.']::TEXT[], 'Lunge_Pass_Through', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lunge Sprint', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lunge_Sprint/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Adjust a bar in a Smith machine to an appropriate height. Position yourself under the bar, racking it across the back of your shoulders. Unrack the bar, and then split your feet, moving one foot forward and one foot back. This will be your starting position.', 'Lower your back knee nearly to the ground, flexing the knees and lowering your hips as you do so.', 'At the bottom of the descent, immediately reverse direction. Explosively drive through the heel of your front foot with light pressure from your back foot. Jump up and reverse the position of your legs.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lunge_Sprint', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Bent Leg Groin', 'Adductors', 'Legs', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Bent_Leg_Groin/0.jpg', NULL, ARRAY['Lie on your back with your knees bent and the soles of the feet pressed together. Have your partner hold your knees. This will be your starting position.', 'Attempt to squeeze your knees together, while your partner prevents any movement from occurring.', 'After 10-20 seconds, relax your muscles as your partner gently pushes your knees towards the floor. Be sure to inform your helper when the stretch is adequate to prevent injury or overstretching.']::TEXT[], 'Lying_Bent_Leg_Groin', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Cable Curl', 'Biceps', 'Biceps', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Cable_Curl/0.jpg', NULL, ARRAY['Grab a straight bar or E-Z bar attachment that is attached to the low pulley with both hands, using an underhand (palms facing up) shoulder-width grip.', 'Lie flat on your back on top of an exercise mat in front of the weight stack with your feet flat against the frame of the pulley machine and your legs straight.', 'With your arms extended and your elbows close to your body slightly bend your arms. This will be your starting position.', 'While keeping your upper arms stationary and the elbows close to your body, curl the bar up slowly toward your chest as you breathe out and you squeeze the biceps.', 'After a second squeeze at the top of the movement, slowly return to the starting position.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_Cable_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Cambered Barbell Row', 'Middle back', 'Back', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Cambered_Barbell_Row/0.jpg', ARRAY['Biceps', 'Lats', 'Traps']::TEXT[], ARRAY['Place a cambered bar underneath an exercise bench.', 'Lie face down on the exercise bench and grab the bar using a palms down (pronated grip) that is wider than shoulder width. This will be your starting position.', 'As you exhale row the bar up as you keep the elbows close to your body to either your chest, in order to target the upper mid back, or to your stomach if targeting the lats is your goal.', 'After a second hold at the top, lower back down to the starting position slowly as you inhale.']::TEXT[], 'Lying_Cambered_Barbell_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Close-Grip Bar Curl On High Pulley', 'Biceps', 'Biceps', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Close-Grip_Bar_Curl_On_High_Pulley/0.jpg', NULL, ARRAY['Place a flat bench in front of a high pulley or lat pulldown machine.', 'Hold the straight bar attachment using an underhand grip (palms up) that is about shoulder width.', 'Lie on your back with your head over the end of the bench.', 'Now extend your arms straight above your shoulders. Your torso and your arms should make a 90-degree angle and the elbows should be in. This will be your starting position.', 'As you breathe out, curl the bar down in a semicircular motion until it touches your chin. Squeeze the biceps for a second at the top contracted position. Tip: As you execute this motion only the forearms should move. At no time should the upper arms be moving at all. They are to remain perpendicular throughout the movement.', 'Return to starting position slowly.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_Close-Grip_Bar_Curl_On_High_Pulley', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Close-Grip Barbell Triceps Extension Behind The Head', 'Triceps', 'Triceps', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Close-Grip_Barbell_Triceps_Extension_Behind_The_Head/0.jpg', NULL, ARRAY['While holding a barbell or EZ Curl bar with a pronated grip (palms facing forward), lie on your back on a flat bench with your head close to the end of the bench. Tip: If you are holding a barbell grab it using a shoulder-width grip and if you are using an E-Z Bar grab it on the inner handles.', 'Extend your arms in front of you and slowly bring the bar back in a semi circular motion (while keeping the arms extended) to a position over your head. At the end of this step your arms should be overhead and parallel to the floor. This will be your starting position. Tip: Keep your elbows in at all times.', 'As you inhale, lower the bar by bending at the elbows and while keeping the upper arm stationary. Keep lowering the bar until your forearms are perpendicular to the floor.', 'As you exhale bring the bar back up to the starting position by pushing the bar up in a semi-circular motion until the lower arms are also parallel to the floor. Contract the triceps hard at the top of the movement for a second. Tip: Again, only the forearms should move. The upper arms should remain stationary at all times.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_Close-Grip_Barbell_Triceps_Extension_Behind_The_Head', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Close-Grip Barbell Triceps Press To Chin', 'Triceps', 'Triceps', 'E-z curl bar', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Close-Grip_Barbell_Triceps_Press_To_Chin/0.jpg', NULL, ARRAY['While holding a barbell or EZ Curl bar with a pronated grip (palms facing forward), lie on your back on a flat bench with your head off the end of the bench. Tip: If you are holding a barbell grab it using a shoulder-width grip and if you are using an E-Z Bar grab it on the inner handles.', 'Extend your arms in front of you as you hold the barbell over your chest. The arms should be perpendicular to your torso (90-degree angle). This will be your starting position.', 'As you inhale, lower the bar in a semi-circular motion by bending at the elbows and while keeping the upper arm stationary and elbows in. Keep lowering the bar until it lightly touches your chin.', 'As you exhale bring the bar back up to the starting position by pushing the bar up in a semi-circular motion. Contract the triceps hard at the top of the movement for a second. Tip: Again, only the forearms should move. The upper arms should remain stationary at all times.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_Close-Grip_Barbell_Triceps_Press_To_Chin', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Crossover', 'Abductors', 'Legs', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Crossover/0.jpg', NULL, ARRAY['Lie on your back with your legs extended.', 'Cross one leg over your body with the knee bent, attempting to touch the knee to the ground. Your partner should kneel beside you, holding your shoulder down with one hand and controlling the crossed leg with the other. this will be your starting position.', 'Attempt to raise the bent knee off of the ground as your partner prevents any actual movement.', 'After 10-20 seconds, relax the leg as your partner gently presses the knee towards the floor. Repeat with the other side.']::TEXT[], 'Lying_Crossover', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Dumbbell Tricep Extension', 'Triceps', 'Triceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Dumbbell_Tricep_Extension/0.jpg', ARRAY['Chest', 'Shoulders']::TEXT[], ARRAY['Lie on a flat bench while holding two dumbbells directly in front of you. Your arms should be fully extended at a 90-degree angle from your torso and the floor. The palms should be facing in and the elbows should be tucked in. This is the starting position.', 'As you breathe in and you keep the upper arms stationary with the elbows in, slowly lower the weight until the dumbbells are near your ears.', 'At that point, while keeping the elbows in and the upper arms stationary, use the triceps to bring the weight back up to the starting position as you breathe out.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_Dumbbell_Tricep_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Face Down Plate Neck Resistance', 'Neck', 'Other', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Face_Down_Plate_Neck_Resistance/0.jpg', NULL, ARRAY['Lie face down with your whole body straight on a flat bench while holding a weight plate behind your head. Tip: You will need to position yourself so that your shoulders are slightly above the end of a flat bench in order for the upper chest, neck and face to be off the bench. This will be your starting position.', 'While keeping the plate secure on the back of your head slowly lower your head (as in saying "yes") as you breathe in.', 'Raise your head back up to the starting position in a semi-circular motion as you breathe out. Hold the contraction for a second.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_Face_Down_Plate_Neck_Resistance', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Face Up Plate Neck Resistance', 'Neck', 'Other', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Face_Up_Plate_Neck_Resistance/0.jpg', NULL, ARRAY['Lie face up with your whole body straight on a flat bench while holding a weight plate on top of your forehead. Tip: You will need to position yourself so that your shoulders are slightly above the end of a flat bench in order for the traps, neck and head to be off the bench. This will be your starting position.', 'While keeping the plate secure on your forehead slowly lower your head back in a semi-circular motion as you breathe in.', 'Raise your head back up to the starting position in a semi-circular motion as you breathe out. Hold the contraction for a second.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_Face_Up_Plate_Neck_Resistance', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Glute', 'Glutes', 'Legs', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Glute/0.jpg', ARRAY['Abductors']::TEXT[], ARRAY['Lie on your back with your partner kneeling beside you.', 'Flex the hip of one leg, raising it off of the floor. Rotate the leg so the foot is over the opposite hip, the lower leg perpendicular to your body. Your partner should hold the knee and ankle in place. This will be your starting position.', 'Attempt to push your leg towards your partner, who should be preventing any actual movement of the leg.', 'After 10-20 seconds, completely relax as your partner gently pushes the ankle and knee towards your chest. Be sure to inform your helper when the stretch is adequate to prevent injury or overstretching.']::TEXT[], 'Lying_Glute', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Hamstring', 'Hamstrings', 'Hamstrings', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Hamstring/0.jpg', ARRAY['Calves']::TEXT[], ARRAY['Lie on your back with your legs extended. Your partner should be kneeling beside you. Raise one leg up towards the ceiling and have your partner hold the ankle. Your partner can use their shoulder to brace your leg if necessary. This will be your starting position.', 'With your partner holding your leg in place, attempt to flex the knee, contracting the hamstrings for 10-20 seconds.', 'Then relax your leg, allowing your partner to gently push the leg towards your head. Be sure to inform your helper when the stretch is adequate to prevent injury or overstretching. Switch sides once complete.']::TEXT[], 'Lying_Hamstring', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying High Bench Barbell Curl', 'Biceps', 'Biceps', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_High_Bench_Barbell_Curl/0.jpg', NULL, ARRAY['Lie face forward on a tall flat bench while holding a barbell with a supinated grip (palms facing up). Tip: If you are holding a barbell grab it using a shoulder-width grip and if you are using an E-Z Bar grab it on the inner handles. Your upper body should be positioned in a way that the upper chest is over the end of the bench and the barbell is hanging in front of you with the arms extended and perpendicular to the floor. This will be your starting position.', 'While keeping the elbows in and the upper arms stationary, curl the weight up in a semi-circular motion as you contract the biceps and exhale. Hold at the top of the movement for a second.', 'As you inhale, slowly go back to the starting position. Tip: Maintain full control of the weight at all times and avoid any swinging. Remember, only the forearms should move throughout the movement.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_High_Bench_Barbell_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Leg Curls', 'Hamstrings', 'Hamstrings', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Leg_Curls/0.jpg', NULL, ARRAY['Adjust the machine lever to fit your height and lie face down on the leg curl machine with the pad of the lever on the back of your legs (just a few inches under the calves). Tip: Preferably use a leg curl machine that is angled as opposed to flat since an angled position is more favorable for hamstrings recruitment.', 'Keeping the torso flat on the bench, ensure your legs are fully stretched and grab the side handles of the machine. Position your toes straight (or you can also use any of the other two stances described on the foot positioning section). This will be your starting position.', 'As you exhale, curl your legs up as far as possible without lifting the upper legs from the pad. Once you hit the fully contracted position, hold it for a second.', 'As you inhale, bring the legs back to the initial position. Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_Leg_Curls', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Machine Squat', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Machine_Squat/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Adjust the leg machine to a height that will allow you to get inside it with your knees bent and the thighs slightly below parallel.', 'Once you select the weight, position yourself inside the machine face up with the knees bent and thighs slightly below parallel to the platform. Make sure that the knees do not go past the toes. The angle created between the hamstrings and the calves should be one that is slightly less than 90 degrees (since your starting position requires you to start slightly below parallel). Your back and your head should be resting on the machine while your shoulders are pressed under the shoulder pads.', 'Place your hands by the handles and position your feet slightly pointing out at a shoulder width position. This will be your starting position.', 'While pressing with the balls of the feet as you breathe out, make your whole body erect as you squeeze the quads. Hold the contracted position for a second. Tip: Since you are starting below parallel, you can opt to use your hands to help you up by pressing on your thighs only on the first repetition.', 'Slowly squat down as you inhale but instead of going all the way down to the starting position, just stop once your thighs are parallel to the platform. The angle between your hamstrings and calves should be a 90-degree angle.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_Machine_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying One-Arm Lateral Raise', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_One-Arm_Lateral_Raise/0.jpg', NULL, ARRAY['While holding a dumbbell in one hand, lay with your chest down on a flat bench. The other hand can be used to hold to the leg of the bench for stability.', 'Position the palm of the hand that is holding the dumbbell in a neutral manner (palms facing your torso) as you keep the arm extended with the elbow slightly bent. This will be your starting position.', 'Now raise the arm with the dumbbell to the side until your elbow is at shoulder height and your arm is roughly parallel to the floor as you exhale. Tip: Maintain your arm perpendicular to the torso while keeping your arm extended throughout the movement. Also, keep the contraction at the top for a second.', 'Slowly lower the dumbbell to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_One-Arm_Lateral_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Prone Quadriceps', 'Quadriceps', 'Quads', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Prone_Quadriceps/0.jpg', NULL, ARRAY['Lay face down on the floor with your partner kneeling beside you. Flex one knee and raise that leg off the ground, attempting to touch your glutes with your foot. Your partner should hold the knee and ankle. This will be your starting position.', 'Attempt to extend your knee while your partner prevents any actual movement.', 'After 10-20 seconds, relax your muscles as your partner gently pushes the foot towards your glutes, further stretching the quadriceps and hip flexors.', 'After 10-20 seconds, switch sides.']::TEXT[], 'Lying_Prone_Quadriceps', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Rear Delt Raise', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Rear_Delt_Raise/0.jpg', NULL, ARRAY['While holding a dumbbell in each hand, lay with your chest down on a flat bench.', 'Position the palms of the hands in a neutral manner (palms facing your torso) as you keep the arms extended with the elbows slightly bent. This will be your starting position.', 'Now raise the arms to the side until your elbows are at shoulder height and your arms are roughly parallel to the floor as you exhale. Tip: Maintain your arms perpendicular to the torso while keeping them extended throughout the movement. Also, keep the contraction at the top for a second.', 'Slowly lower the dumbbells to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions and then switch to the other arm.']::TEXT[], 'Lying_Rear_Delt_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Supine Dumbbell Curl', 'Biceps', 'Biceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Supine_Dumbbell_Curl/0.jpg', NULL, ARRAY['Lie down on a flat bench face up while holding a dumbbell in each arm on top of your thighs.', 'Bring the dumbbells to the sides with the arms extended and the palms of the hands facing your thighs (neutral grip).', 'While keeping the arms close to your torso and elbows in, slowly lower your arms (as you keep them extended with a slight bend at the elbows) as far down towards the floor as you can go. Once you cannot go down any further, lock your upper arms in that position and that will be your starting position.', 'As you breathe out, slowly begin to curl the weights up as you simultaneously rotate your wrists so that the palms of the hands face up. Continue curling the weight until your biceps are fully contracted and squeeze hard at the top position for a second. Tip: Only the forearms should move. Upper arms should remain stationary and elbows should stay in throughout the movement.', 'Return back to the starting position very slowly.']::TEXT[], 'Lying_Supine_Dumbbell_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying T-Bar Row', 'Middle back', 'Back', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_T-Bar_Row/0.jpg', ARRAY['Biceps', 'Lats']::TEXT[], ARRAY['Load up the T-bar Row Machine with the desired weight and adjust the leg height so that your upper chest is at the top of the pad. Tip: In some machines all you can do is stand on the appropriate step that allows you to be at a height that has the upper chest at the top of the pad.', 'Lay face down on the pad and grab the handles. You can either use a palms down, palms up, or palms in position depending on what part of your back you want to emphasize.', 'Lift the bar off the rack and extend your arms in front of you. This will be your starting position.', 'As you exhale slowly pull the weight up and squeeze your back at the top of the movement. Tip: Keep the upper arms as close to the torso as possible throughout the movement in order to better engage the back muscles. Also, do not lift your body off of the pad at any time and refrain from using the biceps to lift the weight.', 'After a second contraction at the top of the movement, as you inhale, slowly go back down to the starting position.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_T-Bar_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Lying Triceps Press', 'Triceps', 'Triceps', 'E-z curl bar', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Lying_Triceps_Press/0.jpg', NULL, ARRAY['Lie on a flat bench with either an e-z bar (my preference) or a straight bar placed on the floor behind your head and your feet on the floor.', 'Grab the bar behind you, using a medium overhand (pronated) grip, and raise the bar in front of you at arms length. Tip: The arms should be perpendicular to the torso and the floor. The elbows should be tucked in. This is the starting position.', 'As you breathe in, slowly lower the weight until the bar lightly touches your forehead while keeping the upper arms and elbows stationary.', 'At that point, use the triceps to bring the weight back up to the starting position as you breathe out.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Lying_Triceps_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Machine Bench Press', 'Chest', 'Chest', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Machine_Bench_Press/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Sit down on the Chest Press Machine and select the weight.', 'Step on the lever provided by the machine since it will help you to bring the handles forward so that you can grab the handles and fully extend the arms.', 'Grab the handles with a palms-down grip and lift your elbows so that your upper arms are parallel to the floor to the sides of your torso. Tip: Your forearms will be pointing forward since you are grabbing the handles. Once you bring the handles forward and extend the arms you will be at the starting position.', 'Now bring the handles back towards you as you breathe in.', 'Push the handles away from you as you flex your pecs and you breathe out. Hold the contraction for a second before going back to the starting position.', 'Repeat for the recommended amount of reps.', 'When finished step on the lever again and slowly get the handles back to their original place.']::TEXT[], 'Machine_Bench_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Machine Bicep Curl', 'Biceps', 'Biceps', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Machine_Bicep_Curl/0.jpg', NULL, ARRAY['Adjust the seat to the appropriate height and make your weight selection. Place your upper arms against the pads and grasp the handles. This will be your starting position.', 'Perform the movement by flexing the elbow, pulling your lower arm towards your upper arm.', 'Pause at the top of the movement, and then slowly return the weight to the starting position.', 'Avoid returning the weight all the way to the stops until the set is complete to keep tension on the muscles being worked.']::TEXT[], 'Machine_Bicep_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Machine Preacher Curls', 'Biceps', 'Biceps', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Machine_Preacher_Curls/0.jpg', NULL, ARRAY['Sit down on the Preacher Curl Machine and select the weight.', 'Place the back of your upper arms (your triceps) on the preacher pad provided and grab the handles using an underhand grip (palms facing up). Tip: Make sure that when you place the arms on the pad you keep the elbows in. This will be your starting position.', 'Now lift the handles as you exhale and you contract the biceps. At the top of the position make sure that you hold the contraction for a second. Tip: Only the forearms should move. The upper arms should remain stationary and on the pad at all times.', 'Lower the handles slowly back to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Machine_Preacher_Curls', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Machine Shoulder (Military) Press', 'Shoulders', 'Shoulders', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Machine_Shoulder_Military_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Sit down on the Shoulder Press Machine and select the weight.', 'Grab the handles to your sides as you keep the elbows bent and in line with your torso. This will be your starting position.', 'Now lift the handles as you exhale and you extend the arms fully. At the top of the position make sure that you hold the contraction for a second.', 'Lower the handles slowly back to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Machine_Shoulder_Military_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Machine Triceps Extension', 'Triceps', 'Triceps', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Machine_Triceps_Extension/0.jpg', NULL, ARRAY['Adjust the seat to the appropriate height and make your weight selection. Place your upper arms against the pads and grasp the handles. This will be your starting position.', 'Perform the movement by extending the elbow, pulling your lower arm away from your upper arm.', 'Pause at the completion of the movement, and then slowly return the weight to the starting position.', 'Avoid returning the weight all the way to the stops until the set is complete to keep tension on the muscles being worked.']::TEXT[], 'Machine_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Medicine Ball Chest Pass', 'Chest', 'Chest', 'Medicine ball', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Medicine_Ball_Chest_Pass/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['You will need a partner for this exercise. Lacking one, this movement can be performed against a wall.', 'Begin facing your partner holding the medicine ball at your torso with both hands.', 'Pull the ball to your chest, and reverse the motion by extending through the elbows. For sports applications, you can take a step as you throw.', 'Your partner should catch the ball, and throw it back to you.', 'Receive the throw with both hands at chest height.']::TEXT[], 'Medicine_Ball_Chest_Pass', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Medicine Ball Full Twist', 'Abdominals', 'Other', 'Medicine ball', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Medicine_Ball_Full_Twist/0.jpg', ARRAY['Shoulders']::TEXT[], ARRAY['For this exercise you will need a medicine ball and a partner. Stand back to back with your partner, spaced 2-3 feet apart. This will be your starting position.', 'Hold the ball in front of the trunk. Open the hips and turn the shoulders at the same time as your partner.', 'For full rotation, you and your partner should twist in the same direction, i.e. counter-clockwise.', 'Pass the ball to your partner, and both of you can now twist in the opposite direction to repeat the procedure.']::TEXT[], 'Medicine_Ball_Full_Twist', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Medicine Ball Scoop Throw', 'Shoulders', 'Shoulders', 'Medicine ball', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Medicine_Ball_Scoop_Throw/0.jpg', ARRAY['Abdominals', 'Hamstrings', 'Quadriceps']::TEXT[], ARRAY['Assume a semisquat stance with a medicine ball in your hands. Your arms should hang so the ball is near your feet.', 'Begin by thrusting the hips forward as you extend through the legs, jumping up.', 'As you do, swing your arms up and over your head, keeping them extended, releasing the ball at the peak of your movement. The goal is to throw the ball the greatest distance behind you.']::TEXT[], 'Medicine_Ball_Scoop_Throw', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Middle Back Shrug', 'Middle back', 'Back', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Middle_Back_Shrug/0.jpg', NULL, ARRAY['Lie facedown on an incline bench while holding a dumbbell in each hand. Your arms should be fully extended hanging down and pointing towards the floor. The palms of your hands should be facing each other. This will be your starting position.', 'As you exhale, squeeze your shoulder blades together and hold the contraction for a full second. Tip: This movement is just like the reverse action of a hug, or trying to perform rear laterals as if you had no arms.', 'As you inhale go back to the starting position.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Middle_Back_Shrug', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Middle Back Stretch', 'Middle back', 'Back', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Middle_Back_Stretch/0.jpg', ARRAY['Abdominals', 'Lats', 'Lower back']::TEXT[], ARRAY['Stand so your feet are shoulder width apart and your hands are on your hips.', 'Twist at your waist until you feel a stretch. Hold for 10 to 15 seconds, then twist to the other side.']::TEXT[], 'Middle_Back_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Mixed Grip Chin', 'Middle back', 'Back', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Mixed_Grip_Chin/0.jpg', ARRAY['Biceps', 'Lats']::TEXT[], ARRAY['Using a spacing that is just about 1 inch wider than shoulder width, grab a pull-up bar with the palms of one hand facing forward and the palms of the other hand facing towards you. This will be your starting position.', 'Now start to pull yourself up as you exhale. Tip: With the arm that has the palms facing up concentrate on using the back muscles in order to perform the movement. The elbow of that arm should remain close to the torso. With the other arm that has the palms facing forward, the elbows will be away but in line with the torso. You will concentrate on using the lats to pull your body up.', 'After a second contraction at the top, start to slowly come down as you inhale.', 'Repeat for the recommended amount of repetitions.', 'On the following set, switch grips; so if you had the right hand with the palms facing you and the left one with the palms facing forward, on the next set you will have the palms facing forward for the right hand and facing you for the left.']::TEXT[], 'Mixed_Grip_Chin', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Monster Walk', 'Abductors', 'Legs', 'Bands', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Monster_Walk/0.jpg', NULL, ARRAY['Place a band around both ankles and another around both knees. There should be enough tension that they are tight when your feet are shoulder width apart.', 'To begin, take short steps forward alternating your left and right foot.', 'After several steps, do just the opposite and walk backward to where you started.']::TEXT[], 'Monster_Walk', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Mountain Climbers', 'Quadriceps', 'Quads', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Mountain_Climbers/0.jpg', ARRAY['Chest', 'Hamstrings', 'Shoulders']::TEXT[], ARRAY['Begin in a pushup position, with your weight supported by your hands and toes. Flexing the knee and hip, bring one leg until the knee is approximately under the hip. This will be your starting position.', 'Explosively reverse the positions of your legs, extending the bent leg until the leg is straight and supported by the toe, and bringing the other foot up with the hip and knee flexed. Repeat in an alternating fashion for 20-30 seconds.']::TEXT[], 'Mountain_Climbers', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Moving Claw Series', 'Hamstrings', 'Hamstrings', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Moving_Claw_Series/0.jpg', ARRAY['Calves', 'Quadriceps']::TEXT[], ARRAY['This move helps prepare your running form to help you excel at sprinting. As you run, be sure to flex the knee, aiming to kick your glutes as the hip extends.', 'Reload the quad as the leg moves back forward, attacking the ground on the next step.', 'Ensure that as you run, you block with the arms, punching through in a rapid 1-2 motion.']::TEXT[], 'Moving_Claw_Series', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Muscle Snatch', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Muscle_Snatch/0.jpg', ARRAY['Glutes', 'Lower back', 'Quadriceps', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Begin with a loaded barbell held at the mid thigh position with a wide grip. The feet should be directly below the hips, with the feet turned out as needed. Lower the hips, with the chest up and the head looking forward. The shoulders should be just in front of the bar. This will be the starting position.', 'Begin the pull by driving through the front of the heels, raising the bar. Transition into the second pull by extending through the hips knees and ankles, driving the bar up as quickly as possible. The bar should be close to the body.', 'Continue raising the bar to the overhead position, without rebending the knees.']::TEXT[], 'Muscle_Snatch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Muscle Up', 'Lats', 'Back', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Muscle_Up/0.jpg', ARRAY['Abdominals', 'Biceps', 'Forearms', 'Middle back', 'Shoulders', 'Traps', 'Triceps']::TEXT[], ARRAY['Grip the rings using a false grip, with the base of your palms on top of the rings. Initiate a pull up by pulling the elbows down to your side, flexing the elbows.', 'As you reach the top position of the pull-up, pull the rings to your armpits as you roll your shoulders forward, allowing your elbows to move straight back behind you. This puts you into the proper position to continue into the dip portion of the movement.', 'Maintaining control and stability, extend through the elbow to complete the motion.', 'Use care when lowering yourself to the ground.']::TEXT[], 'Muscle_Up', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Narrow Stance Hack Squats', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Narrow_Stance_Hack_Squats/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Place the back of your torso against the back pad of the machine and hook your shoulders under the shoulder pads provided.', 'Position your legs in the platform using a less than shoulder width narrow stance with the toes slightly pointed out. Your feet should be around 3 inches or less apart. Tip: Keep your head up at all times and also maintain the back on the pad at all times.', 'Place your arms on the side handles of the machine and disengage the safety bars (which on most designs is done by moving the side handles from a facing front position to a diagonal position).', 'Now straighten your legs without locking the knees. This will be your starting position.', 'Begin to slowly lower the unit by bending the knees as you maintain a straight posture with the head up (back on the pad at all times). Continue down until the angle between the upper leg and the calves becomes slightly less than 90-degrees (which is the point in which the upper legs are below parallel to the floor). Inhale as you perform this portion of the movement.', 'Begin to raise the unit as you exhale by pushing the floor with mainly with the heels of your feet as you straighten the legs again and go back to the starting position.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Narrow_Stance_Hack_Squats', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Narrow Stance Leg Press', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Narrow_Stance_Leg_Press/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Using a leg press machine, sit down on the machine and place your legs on the platform directly in front of you at a less-than-shoulder-width narrow stance with the toes slightly pointed out. Your feet should be around 3 inches or less apart. Tip: Keep your head up at all times and also maintain the back on the pad at all times.', 'Lower the safety bars holding the weighted platform in place and press the platform all the way up until your legs are fully extended in front of you. Tip: Make sure that you do not lock your knees. Your torso and the legs should make a perfect 90-degree angle. This will be your starting position.', 'As you inhale, slowly lower the platform until your upper and lower legs make a 90-degree angle.', 'Pushing mainly with the heels of your feet and using the quadriceps go back to the starting position as you exhale.', 'Repeat for the recommended amount of repetitions and ensure to lock the safety pins properly once you are done. You do not want that platform falling on you fully loaded.']::TEXT[], 'Narrow_Stance_Leg_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Narrow Stance Squats', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Narrow_Stance_Squats/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings', 'Lower back']::TEXT[], ARRAY['This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place the back of your shoulders (slightly below the neck) across it.', 'Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.', 'Step away from the rack and position your legs using a less-than-shoulder-width narrow stance with the toes slightly pointed out. Feet should be around 3-6 inches apart. Keep your head up at all times (looking down will get you off balance) and maintain a straight back. This will be your starting position. (Note: For the purposes of this discussion we will use the medium stance described above which targets overall development; however you can choose any of the three stances discussed in the foot stances section).', 'Begin to slowly lower the bar by bending the knees as you maintain a straight posture with the head up. Continue down until the angle between the upper leg and the calves becomes slightly less than 90-degrees (which is the point in which the upper legs are below parallel to the floor). Inhale as you perform this portion of the movement. Tip: If you performed the exercise correctly, the front of the knees should make an imaginary straight line with the toes that is perpendicular to the front. If your knees are past that imaginary line (if they are past your toes) then you are placing undue stress on the knee and the exercise has been performed incorrectly.', 'Begin to raise the bar as you exhale by pushing the floor with the heel of your foot mainly as you straighten the legs again and go back to the starting position.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Narrow_Stance_Squats', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Natural Glute Ham Raise', 'Hamstrings', 'Hamstrings', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Natural_Glute_Ham_Raise/0.jpg', ARRAY['Calves', 'Glutes', 'Lower back']::TEXT[], ARRAY['Using the leg pad of a lat pulldown machine or a preacher bench, position yourself so that your ankles are under the pads, knees on the seat, and you are facing away from the machine. You should be upright and maintaining good posture.', 'This will be your starting position. Lower yourself under control until your knees are almost completely straight.', 'Remaining in control, raise yourself back up to the starting position.', 'If you are unable to complete a rep, use a band, a partner, or push off of a box to aid in completing a repetition.']::TEXT[], 'Natural_Glute_Ham_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Neck-SMR', 'Neck', 'Other', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Neck-SMR/0.jpg', NULL, ARRAY['Using a muscle roller or a rolling pin, place the roller behind your head and against your neck. Make sure that you do not place the roller directly against the spine, but turned slightly so that the roller is pressed against the muscles to either side of the spine. This will be your starting position.', 'Starting at the top of your neck, slowly roll down the muscles of your neck, pausing at points of tension for 10-30 seconds.']::TEXT[], 'Neck-SMR', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Neck Press', 'Chest', 'Chest', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Neck_Press/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Lie back on a flat bench. Using a medium-width grip (a grip that creates a 90-degree angle in the middle of the movement between the forearms and the upper arms), lift the bar from the rack and hold it straight over your neck with your arms locked. This will be your starting position.', 'As you breathe in, come down slowly until you feel the bar on your neck.', 'After a second pause, bring the bar back to the starting position as you breathe out and push the bar using your chest muscles. Lock your arms and squeeze your chest in the contracted position, hold for a second and then start coming down slowly again. Tip: It should take at least twice as long to go down than to come up).', 'Repeat the movement for the prescribed amount of repetitions.', 'When you are done, place the bar back in the rack.']::TEXT[], 'Neck_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Oblique Crunches', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Oblique_Crunches/0.jpg', NULL, ARRAY['Lie flat on the floor with your lower back pressed to the ground. For this exercise, you will need to put one hand beside your head and the other to the side against the floor.', 'Make sure your feet are elevated and resting on a flat surface.', 'Now lift the shoulder in which your hand is touching your head.', 'Simply elevate your shoulder and body upward until you touch your knee. For example, if you have your right hand besides your head, then you want to elevate your body upwards until your right elbow touches your left knee. The same variation can be applied doing the inverse and using your left elbow to touch your right knee.', 'After your knee touches your elbow, lower your body until you have reached the starting position.', 'Remember to breathe in during the eccentric (lowering) part of the exercise and to breathe out during the concentric (upward) part of the exercise.', 'Continue alternating in this manner until all of the recommended repetitions for each side have been completed.']::TEXT[], 'Oblique_Crunches', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Oblique Crunches - On The Floor', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Oblique_Crunches_-_On_The_Floor/0.jpg', NULL, ARRAY['Start out by lying on your right side with your legs lying on top of each other. Make sure your knees are bent a little bit.', 'Place your left hand behind your head.', 'Once you are in this set position, begin by moving your left elbow up as you would perform a normal crunch except this time the main emphasis is on your obliques.', 'Crunch as high as you can, hold the contraction for a second and then slowly drop back down into the starting position.', 'Remember to breathe in during the eccentric (lowering) part of the exercise and to breathe out during the concentric (elevation) part of the exercise.']::TEXT[], 'Oblique_Crunches_-_On_The_Floor', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Olympic Squat', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Olympic_Squat/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Begin with a barbell supported on top of the traps. The chest should be up, and the head facing forward. Adopt a hip width stance with the feet turned out as needed.', 'Descend by flexing the knees, refraining from moving the hips back as much as possible. This requires that the knees travel forward; ensure that they stay aligned with the feet. The goal is to keep the torso as upright as possible. Continue all the way down, keeping the weight on the front of the heel.', 'At the moment the upper legs contact the lower, reverse the motion, driving the weight upward.']::TEXT[], 'Olympic_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('On-Your-Back Quad Stretch', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/On-Your-Back_Quad_Stretch/0.jpg', NULL, ARRAY['Lie on a flat bench or step, and hang one leg and arm over the side.', 'Bend the knee and hold the top of the foot. As you do this, be careful not to arch your lower back.', 'Pull the belly button to the spine to stay in neutral. Press your foot down and into your hand. To add the hip stretch, lift the hip of the leg you''re holding up toward the ceiling.', 'Switch sides.']::TEXT[], 'On-Your-Back_Quad_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('On Your Side Quad Stretch', 'Quadriceps', 'Quads', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/On_Your_Side_Quad_Stretch/0.jpg', NULL, ARRAY['Start off by lying on your right side, with your right knee bent at a 90-degree angle resting on the floor in front of you (this stabilizes the torso).', 'Bend your left knee behind you and hold your left foot with your left hand. To stretch your hip flexor, press your left hip forward as you push your left foot back into your hand. Switch sides.']::TEXT[], 'On_Your_Side_Quad_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Dumbbell Row', 'Middle back', 'Back', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Dumbbell_Row/0.jpg', ARRAY['Biceps', 'Lats', 'Shoulders']::TEXT[], ARRAY['Choose a flat bench and place a dumbbell on each side of it.', 'Place the right leg on top of the end of the bench, bend your torso forward from the waist until your upper body is parallel to the floor, and place your right hand on the other end of the bench for support.', 'Use the left hand to pick up the dumbbell on the floor and hold the weight while keeping your lower back straight. The palm of the hand should be facing your torso. This will be your starting position.', 'Pull the resistance straight up to the side of your chest, keeping your upper arm close to your side and keeping the torso stationary. Breathe out as you perform this step. Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. Also, make sure that the force is performed with the back muscles and not the arms. Finally, the upper torso should remain stationary and only the arms should move. The forearms should do no other work except for holding the dumbbell; therefore do not try to pull the dumbbell up using the forearms.', 'Lower the resistance straight down to the starting position. Breathe in as you perform this step.', 'Repeat the movement for the specified amount of repetitions.', 'Switch sides and repeat again with the other arm.']::TEXT[], 'One-Arm_Dumbbell_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Flat Bench Dumbbell Flye', 'Chest', 'Chest', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Flat_Bench_Dumbbell_Flye/0.jpg', NULL, ARRAY['Lie down on a flat bench with a dumbbell in one hand resting on top of your thigh. The palm of your hand with the dumbbell in it should be at a neutral grip.', 'By using your thighs to help you get the dumbbell up, clean the dumbbell so that you can hold it in front of you with your lifting arm being fully extended. Remember to maintain a neutral grip with this exercise. Your non lifting hand should be to the side holding the flat bench for better support. This will be your starting position.', 'Your arm with the weight should have a slight bend on your elbow in order to prevent stress at the biceps tendon. Begin by lowering your arm with the weight in it out in a wide arc until you feel a stretch on your chest. Breathe in as you perform this portion of the movement. Tip: Keep in mind that throughout the movement, your lifting arm should remain stationary; the movement should only occur at the shoulder joint.', 'Return your lifting arm back to the starting position as you squeeze your chest muscles and breathe out. Tip: Make sure to use the same arc of motion used to lower the weights.', 'Hold for a second at the contracted position and repeat the movement for the prescribed amount of repetitions.', 'Switch arms and repeat the exercise.']::TEXT[], 'One-Arm_Flat_Bench_Dumbbell_Flye', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm High-Pulley Cable Side Bends', 'Abdominals', 'Other', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_High-Pulley_Cable_Side_Bends/0.jpg', NULL, ARRAY['Connect a standard handle to a tower. Move cable to highest pulley position.', 'Stand with side to cable. With one hand, reach up and grab handle with underhand grip.', 'Pull down cable until elbow touches your side and the handle is by your shoulder.', 'Position feet hip-width apart. Place free hand on hip to help gauge pivot point.', 'Keep arm in static position. Contract oblique to bring the weight down in a side crunch.', 'Once you reach maximum contraction, slowly release the weight to the starting position. The weight stack should never be unloaded in a resting position. The aim is constant tension during the set.', 'Repeat to failure.', 'Then, reposition and repeat the same series of movements on the opposite side.']::TEXT[], 'One-Arm_High-Pulley_Cable_Side_Bends', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Incline Lateral Raise', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Incline_Lateral_Raise/0.jpg', NULL, ARRAY['Lie down sideways on an incline bench press with a dumbbell in the hand. Make sure the shoulder is pressing against the incline bench and the arm is lying across your body with the palm around your navel.', 'Hold a dumbbell in your uppermost arm while keeping it extended in front of you parallel to the floor. This is your starting position.', 'While keeping the dumbbell parallel to the floor at all times, perform a lateral raise. Your arm should travel straight up until it is pointing at the ceiling. Tip: Exhale as you perform this movement. Hold the dumbbell in the position and feel the contraction in the shoulders for a second.', 'While inhaling lower the weight across your body back into the starting position.', 'Repeat the movement for the prescribed amount of repetitions.', 'Switch arms and repeat the movement.']::TEXT[], 'One-Arm_Incline_Lateral_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Clean', 'Hamstrings', 'Hamstrings', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Clean/0.jpg', ARRAY['Glutes', 'Lower back', 'Shoulders', 'Traps']::TEXT[], ARRAY['Place a kettlebell between your feet. As you bend down to grab the kettlebell, push your butt back and keep your eyes looking forward.', 'Clean the kettlebell to your shoulders by extending through the legs and hips as you raise the kettlebell towards your shoulder. The wrist should rotate as you do so.', 'Return the weight to the starting position.']::TEXT[], 'One-Arm_Kettlebell_Clean', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Clean and Jerk', 'Shoulders', 'Shoulders', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Clean_and_Jerk/0.jpg', NULL, ARRAY['Hold a kettlebell by the handle.', 'Clean the kettlebell to your shoulder by extending through the legs and hips as you pull the kettlebell towards your shoulder. Rotate your wrist as you do so, so that the palm faces forward.', 'Dip your body by bending the knees, keeping your torso upright.', 'Immediately reverse direction, driving through the heels, in essence jumping to create momentum. As you do so, press the kettlebell overhead to lockout by extending the arms, using your body''s momentum to move the weight.', 'Receive the weight overhead by returning to a squat position underneath the weight.', 'Keeping the weight overhead, return to a standing position. Lower the weight to the floor to perform the next repetition.']::TEXT[], 'One-Arm_Kettlebell_Clean_and_Jerk', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Floor Press', 'Chest', 'Chest', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Floor_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Lie on the floor holding a kettlebell with one hand, with your upper arm supported by the floor. The palm should be facing in.', 'Press the kettlebell straight up toward the ceiling, rotating your wrist.', 'Lower the kettlebell back to the starting position and repeat.']::TEXT[], 'One-Arm_Kettlebell_Floor_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Jerk', 'Shoulders', 'Shoulders', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Jerk/0.jpg', ARRAY['Calves', 'Quadriceps', 'Triceps']::TEXT[], ARRAY['Hold a kettlebell by the handle. Clean the kettlebell to your shoulder by extending through the legs and hips as you pull the kettlebell towards your shoulder. Rotate your wrist as you do so, so that the palm faces forward. This will be your starting position.', 'Dip your body by bending the knees, keeping your torso upright.', 'Immediately reverse direction, driving through the heels, in essence jumping to create momentum. As you do so, press the kettlebell overhead to lockout by extending the arms, using your body''s momentum to move the weight. Receive the weight overhead by returning to a squat position underneath the weight. Keeping the weight overhead, return to a standing position.', 'Lower the weight to perform the next repetition.']::TEXT[], 'One-Arm_Kettlebell_Jerk', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Military Press To The Side', 'Shoulders', 'Shoulders', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Military_Press_To_The_Side/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Clean a kettlebell to your shoulder. Clean the kettlebell to your shoulder by extending through the legs and hips as you pull the kettlebell towards your shoulder. Rotate your wrist as you do so, so that the palm faces inward. This will be your starting position.', 'Look at the kettlebell and press it up and out until it is locked out overhead.', 'Lower the kettlebell back to your shoulder under control and repeat. Make sure to contract your lat, butt, and stomach forcefully for added stability and strength.']::TEXT[], 'One-Arm_Kettlebell_Military_Press_To_The_Side', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Para Press', 'Shoulders', 'Shoulders', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Para_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Clean a kettlebell to your shoulder. Clean the kettlebell to your shoulder by extending through the legs and hips as you pull the kettlebell towards your shoulder. Rotate your wrist as you do so, so that the palm faces forward. This will be your starting position.', 'Hold the kettlebell with the elbow out to the side, and press it up and out until it is locked out overhead.', 'Lower the kettlebell back to your shoulder under control and repeat. Make sure to contract your lat, butt, and stomach forcefully for added stability and strength.']::TEXT[], 'One-Arm_Kettlebell_Para_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Push Press', 'Shoulders', 'Shoulders', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Push_Press/0.jpg', ARRAY['Calves', 'Quadriceps', 'Triceps']::TEXT[], ARRAY['Hold a kettlebell by the handle. Clean the kettlebell to your shoulder by extending through the legs and hips as you pull the kettlebell towards your shoulder. Rotate your wrist as you do so, so that the palm faces forward. This will be your starting position.', 'Dip your body by bending the knees, keeping your torso upright.', 'Immediately reverse direction, driving through the heels, in essence jumping to create momentum. As you do so, press the kettlebell overhead to lockout by extending the arms, using your body''s momentum to move the weight. Lower the weight to perform the next repetition.']::TEXT[], 'One-Arm_Kettlebell_Push_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Row', 'Middle back', 'Back', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Row/0.jpg', ARRAY['Biceps', 'Lats']::TEXT[], ARRAY['Place a kettlebell in front of your feet. Bend your knees slightly and then push your butt out as much as possible as you bend over to get in the starting position. Grab the kettlebell and pull it to your stomach, retracting your shoulder blade and flexing the elbow. Keep your back straight. Lower and repeat.']::TEXT[], 'One-Arm_Kettlebell_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Snatch', 'Shoulders', 'Shoulders', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Snatch/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings', 'Lower back', 'Traps', 'Triceps']::TEXT[], ARRAY['Place a kettlebell between your feet. Bend your knees and push your butt back to get in the proper starting position.', 'Look straight ahead and swing the kettlebell back between your legs.', 'Immediately reverse the direction and drive through with your hips and knees, accelerating the kettlebell upward. As the kettlebell rises to your shoulder rotate your hand and punch straight up, using momentum to receive the weight locked out overhead.']::TEXT[], 'One-Arm_Kettlebell_Snatch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Split Jerk', 'Shoulders', 'Shoulders', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Split_Jerk/0.jpg', ARRAY['Glutes', 'Hamstrings', 'Quadriceps', 'Triceps']::TEXT[], ARRAY['Hold a kettlebell by the handle. Clean the kettlebell to your shoulder by extending through the legs and hips as you pull the kettlebell towards your shoulder. Rotate your wrist as you do so, so that the palm faces forward. This will be your starting position.', 'Dip your body by bending the knees, keeping your torso upright.', 'Immediately reverse direction, driving through the heels, in essence jumping to create momentum. As you do so, press the kettlebell overhead to lockout by extending the arms, using your body''s momentum to move the weight.', 'Receive the weight overhead by returning to a squat position underneath the weight, positioning one leg in front of you and one leg behind you.', 'Keeping the weight overhead, return to a standing position and bring your feet together. Lower the weight to perform the next repetition.']::TEXT[], 'One-Arm_Kettlebell_Split_Jerk', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Split Snatch', 'Shoulders', 'Shoulders', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Split_Snatch/0.jpg', ARRAY['Hamstrings', 'Quadriceps']::TEXT[], ARRAY['Hold a kettlebell in one hand by the handle.', 'Squat towards the floor, and then reverse the motion, extending the hips, knees, and finally the ankles, to raise the kettlebell overhead.', 'After fully extending the body, descend into a lunge position to receive the weights overhead, one leg forward and one leg back. Ensure you drive through with your hips and lock the ketttlebells overhead in one uninterrupted motion.', 'Return to a standing position, holding the weight overhead, and bring the feet together. Lower the weight to return to the starting position.']::TEXT[], 'One-Arm_Kettlebell_Split_Snatch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Kettlebell Swings', 'Hamstrings', 'Hamstrings', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Kettlebell_Swings/0.jpg', ARRAY['Calves', 'Glutes', 'Lower back', 'Shoulders']::TEXT[], NULL, 'One-Arm_Kettlebell_Swings', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Long Bar Row', 'Middle back', 'Back', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Long_Bar_Row/0.jpg', ARRAY['Biceps', 'Lats']::TEXT[], ARRAY['Position a bar into a landmine or in a corner to keep it from moving. Load an appropriate weight onto your end.', 'Stand next to the bar, and take a grip with one hand close to the collar. Using your hips and legs, rise to a standing position.', 'Assume a bent-knee stance with your hips back and your chest up. Your arm should be extended. This will be your starting position.', 'Pull the weight to your side by retracting the shoulder and flexing the elbow. Do not jerk the weight or cheat during the movement.', 'After a brief pause, return to the starting position.']::TEXT[], 'One-Arm_Long_Bar_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Medicine Ball Slam', 'Abdominals', 'Other', 'Medicine ball', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Medicine_Ball_Slam/0.jpg', ARRAY['Lats', 'Shoulders']::TEXT[], ARRAY['Start in a standing position with a staggered, athletic stance. Hold a medicine ball in one hand, on the same side as your back leg. This will be your starting position.', 'Begin by winding the arm, raising the medicine ball above your head. As you do so, extend through the hips, knees, and ankles to load up for the slam.', 'At peak extension, flex the shoulders, spine, and hips to throw the ball hard into the ground directly in front of you.', 'Catch the ball on the bounce and continue for the desired number of repetitions.']::TEXT[], 'One-Arm_Medicine_Ball_Slam', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Open Palm Kettlebell Clean', 'Hamstrings', 'Hamstrings', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Open_Palm_Kettlebell_Clean/0.jpg', ARRAY['Forearms', 'Glutes', 'Lower back', 'Quadriceps', 'Shoulders']::TEXT[], ARRAY['Place one kettlebell between your feet.', 'Grab the handle with one hand and raise the kettlebell rapidly, let it flip so that the ball of the kettlebell lands in the palm of your hand.', 'Throw the kettlebell out in front of you and catch the handle with one hand.', 'Take the kettlebell to the floor and repeat. Make sure to work both arms.']::TEXT[], 'One-Arm_Open_Palm_Kettlebell_Clean', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Overhead Kettlebell Squats', 'Quadriceps', 'Quads', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Overhead_Kettlebell_Squats/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings', 'Shoulders']::TEXT[], ARRAY['Clean and press a kettlebell with one arm. Clean the kettlebell to your shoulder by extending through the legs and hips as you pull the kettlebell towards your shoulder. Rotate your wrist as you do so. Press the weight overhead by extending through the elbow.This will be your starting position.', 'Looking straight ahead and keeping a kettlebell locked out above you, flex the knees and hips and lower your torso between your legs, keeping your head and chest up.', 'Pause at the bottom position for a second before rising back to the top, driving through the heels of your feet.']::TEXT[], 'One-Arm_Overhead_Kettlebell_Squats', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Side Deadlift', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Side_Deadlift/0.jpg', ARRAY['Abdominals', 'Calves', 'Glutes', 'Hamstrings', 'Lower back', 'Traps']::TEXT[], ARRAY['Stand to the side of a barbell next to its center. Bend your knees and lower your body until you are able to reach the barbell.', 'Grasp the bar as if you were grabbing a briefcase (palms facing you since the bar is sideways). You may need a wrist wrap if you are using a significant amount of weight. This is your starting position.', 'Use your legs to help lift the barbell up while exhaling. Your arms should extend fully as bring the barbell up until you are in a standing position.', 'Slowly bring the barbell back down while inhaling. Tip: Make sure to bend your knees while lowering the weight to avoid any injury from occurring.', 'Repeat for the recommended amount of repetitions.', 'Switch arms and repeat the movement.']::TEXT[], 'One-Arm_Side_Deadlift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Arm Side Laterals', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Arm_Side_Laterals/0.jpg', NULL, ARRAY['Pick a dumbbell and place it in one of your hands. Your non lifting hand should be used to grab something steady such as an incline bench press. Lean towards your lifting arm and away from the hand that is gripping the incline bench as this will allow you to keep your balance.', 'Stand with a straight torso and have the dumbbell by your side at arm''s length with the palm of the hand facing you. This will be your starting position.', 'While maintaining the torso stationary (no swinging), lift the dumbbell to your side with a slight bend on the elbow and your hand slightly tilted forward as if pouring water in a glass. Continue to go up until you arm is parallel to the floor. Exhale as you execute this movement and pause for a second at the top.', 'Lower the dumbbell back down slowly to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.', 'Switch arms and repeat the exercise.']::TEXT[], 'One-Arm_Side_Laterals', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One-Legged Cable Kickback', 'Glutes', 'Legs', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One-Legged_Cable_Kickback/0.jpg', ARRAY['Hamstrings']::TEXT[], ARRAY['Hook a leather ankle cuff to a low cable pulley and then attach the cuff to your ankle.', 'Face the weight stack from a distance of about two feet, grasping the steel frame for support.', 'While keeping your knees and hips bent slightly and your abs tight, contract your glutes to slowly "kick" the working leg back in a semicircular arc as high as it will comfortably go as you breathe out. Tip: At full extension, squeeze your glutes for a second in order to achieve a peak contraction.', 'Now slowly bring your working leg forward, resisting the pull of the cable until you reach the starting position.', 'Repeat for the recommended amount of repetitions.', 'Switch legs and repeat the movement for the other side.']::TEXT[], 'One-Legged_Cable_Kickback', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Arm Against Wall', 'Lats', 'Back', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Arm_Against_Wall/0.jpg', NULL, ARRAY['From a standing position, place a bent arm against a wall or doorway.', 'Slowly lean toward your arm until you feel a stretch in your lats.']::TEXT[], 'One_Arm_Against_Wall', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Arm Chin-Up', 'Middle back', 'Back', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Arm_Chin-Up/0.jpg', ARRAY['Biceps', 'Forearms', 'Lats']::TEXT[], ARRAY['For this exercise, start out by placing a towel around a chin up bar.', 'Grab the chin-up bar with your palm facing you. One hand will be grabbing the chin-up bar and the other will be grabbing the towel.', 'Bring your torso back around 30 degrees or so while creating a curvature on your lower back and sticking your chest out. This is your starting position.v', 'Pull your torso up until the bar touches your upper chest by drawing the shoulders and the upper arms down and back. Exhale as you perform this portion of the movement. Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. The upper torso should remain stationary as it moves through space and only the arms should move. The forearms should do no other work other than hold the bar.', 'After a second on the contracted position, start to inhale and slowly lower your torso back to the starting position when your arms are fully extended and the lats are fully stretched.', 'Repeat this motion for the prescribed amount of repetitions.', 'Switch arms and repeat the movement.']::TEXT[], 'One_Arm_Chin-Up', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Arm Dumbbell Bench Press', 'Chest', 'Chest', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Arm_Dumbbell_Bench_Press/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Lie down on a flat bench with a dumbbell in one hand on top of your thigh.', 'By using your thigh to help you get the dumbbell up, clean the dumbbell up so that you can hold it in front of you at shoulder width. Use the hand you are not lifting with to help position the dumbbell over you properly.', 'Once at shoulder width, rotate your wrist forward so that the palm of your hand is facing away from you. This will be your starting position.', 'Bring down the weights slowly to your side as you breathe in. Keep full control of the dumbbell at all times. Tip: Use the hand that you are not lifting with to help keep the dumbbell balance as you may struggle a bit at first. Only use your non-lifting hand if it is needed. Otherwise, keep it resting to the side.', 'As you breathe out, push the dumbbells up using your pectoral muscles. Lock your arms in the contracted position, squeeze your chest, hold for a second and then start coming down slowly. Tip: It should take at least twice as long to go down than to come up.', 'Repeat the movement for the prescribed amount of repetitions of your training program.', 'Switch arms and repeat the movement.']::TEXT[], 'One_Arm_Dumbbell_Bench_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Arm Dumbbell Preacher Curl', 'Biceps', 'Biceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Arm_Dumbbell_Preacher_Curl/0.jpg', NULL, ARRAY['Grab a dumbbell with the right arm and place the upper arm on top of the preacher bench or the incline bench. The dumbbell should be held at shoulder length. This will be your starting position.', 'As you breathe in, slowly lower the dumbbell until your upper arm is extended and the biceps is fully stretched.', 'As you exhale, use the biceps to curl the weight up until your biceps is fully contracted and the dumbbell is at shoulder height. Again, remember that to ensure full contraction you need to bring that small finger higher than the thumb.', 'Squeeze the biceps hard for a second at the contracted position and repeat for the recommended amount of repetitions.', 'Switch arms and repeat the movement.']::TEXT[], 'One_Arm_Dumbbell_Preacher_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Arm Floor Press', 'Triceps', 'Triceps', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Arm_Floor_Press/0.jpg', ARRAY['Chest', 'Shoulders']::TEXT[], ARRAY['Lie down on a flat surface with your back pressing against the floor or an exercise mat. Make sure your knees are bent.', 'Have a partner hand you the bar on one hand. When starting, your arm should be just about fully extended, similar to the starting position of a barbell bench press. However, this time your grip will be neutral (palms facing your torso).', 'Make sure the hand you are not using to lift the weight is placed by your side.', 'Begin the exercise by lowering the barbell until your elbow touches the ground. Make sure to breathe in as this is the eccentric (lowering part of the exercise).', 'Then start lifting the barbell back up to the original starting position. Remember to breathe out during the concentric (lifting part of the exercise).', 'Repeat until you have performed your recommended repetitions.', 'Switch arms and repeat the movement.']::TEXT[], 'One_Arm_Floor_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Arm Lat Pulldown', 'Lats', 'Back', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Arm_Lat_Pulldown/0.jpg', ARRAY['Biceps', 'Middle back']::TEXT[], ARRAY['Select an appropriate weight and adjust the knee pad to help keep you down. Grasp the handle with a pronated grip. This will be your starting position.', 'Pull the handle down, squeezing your elbow to your side as you flex the elbow.', 'Pause at the bottom of the motion, and then slowly return the handle to the starting position.', 'For multiple repetitions, avoid completely returning the weight to keep tension on the muscles being worked.']::TEXT[], 'One_Arm_Lat_Pulldown', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Arm Pronated Dumbbell Triceps Extension', 'Triceps', 'Triceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Arm_Pronated_Dumbbell_Triceps_Extension/0.jpg', NULL, ARRAY['Lie flat on a bench while holding a dumbbell at arms length. Your arm should be perpendicular to your body. The palm of your hand should be facing towards your feet as a pronated grip is required to perform this exercise.', 'Place your non lifting hand on your bicep for support.', 'Slowly begin to lower the dumbbell down as you breathe in.', 'Then, begin lifting the dumbbell upward as you contract the triceps. Remember to breathe out during the concentric (lifting part of the exercise).', 'Repeat until you have performed your set repetitions.', 'Switch arms and repeat the movement.']::TEXT[], 'One_Arm_Pronated_Dumbbell_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Arm Supinated Dumbbell Triceps Extension', 'Triceps', 'Triceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Arm_Supinated_Dumbbell_Triceps_Extension/0.jpg', NULL, ARRAY['Lie flat on a bench while holding a dumbbell at arms length. Your arm should be perpendicular to your body. The palm of your hand should be facing towards your face as a supinated grip is required to perform this exercise.', 'Place your non lifting hand on your bicep for support.', 'Slowly begin to lower the dumbbell down as you breathe in.', 'Then, begin lifting the dumbbell upward as you contract the triceps. Remember to breathe out during the concentric (lifting part of the exercise).', 'Repeat until you have performed your set repetitions.', 'Switch arms and repeat the movement.', 'Switch arms again and repeat the movement.']::TEXT[], 'One_Arm_Supinated_Dumbbell_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Half Locust', 'Quadriceps', 'Quads', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Half_Locust/0.jpg', ARRAY['Abdominals', 'Biceps', 'Chest']::TEXT[], ARRAY['Lie facedown on the floor.', 'Put your left hand under your left hipbone to pad your hip and pubic bone.', 'Bend your right knee so you can hold the foot in your right hand.', 'Lift the foot in the air and simultaneously lift your shoulders off the floor. This also stretches the right hip flexor and the chest and shoulders. Switch sides. If it doesn''t bother your back, you can try it with both arms and legs at the same time.']::TEXT[], 'One_Half_Locust', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Handed Hang', 'Lats', 'Back', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Handed_Hang/0.jpg', ARRAY['Biceps']::TEXT[], ARRAY['Grab onto a chinup bar with one hand, using a pronated grip. Keep your feet on the floor or a step. Allow the majority of your weight to hang from that hand, while keeping your feet on the ground. Hold for 10-20 seconds and switch sides.']::TEXT[], 'One_Handed_Hang', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Knee To Chest', 'Glutes', 'Legs', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Knee_To_Chest/0.jpg', ARRAY['Hamstrings', 'Lower back']::TEXT[], ARRAY['Start off by lying on the floor.', 'Extend one leg straight and pull the other knee to your chest. Hold under the knee joint to protect the kneecap.', 'Gently tug that knee toward your nose.', 'Switch sides. This stretches the buttocks and lower back of the bent leg and the hip flexor of the straight leg.']::TEXT[], 'One_Knee_To_Chest', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('One Leg Barbell Squat', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/One_Leg_Barbell_Squat/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Start by standing about 2 to 3 feet in front of a flat bench with your back facing the bench. Have a barbell in front of you on the floor. Tip: Your feet should be shoulder width apart from each other.', 'Bend the knees and use a pronated grip with your hands being wider than shoulder width apart from each other to lift the barbell up until you can rest it on your chest.', 'Then lift the barbell over your head and rest it on the base of your neck. Move one foot back so that your toe is resting on the flat bench. Your other foot should be stationary in front of you. Keep your head up at all times as looking down will get you off balance and also maintain a straight back. Tip: Make sure your back is straight and chest is out while performing this exercise.', 'As you inhale, slowly lower your leg until your thigh is parallel to the floor. At this point, your knee should be over your toes. Your chest should be directly above the middle of your thigh.', 'Leading with the chest and hips and contracting the quadriceps, elevate your leg back to the starting position as you exhale.', 'Repeat for the recommended amount of repetitions.', 'Switch legs and repeat the movement.']::TEXT[], 'One_Leg_Barbell_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Open Palm Kettlebell Clean', 'Hamstrings', 'Hamstrings', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Open_Palm_Kettlebell_Clean/0.jpg', ARRAY['Glutes', 'Lower back', 'Quadriceps', 'Shoulders']::TEXT[], ARRAY['Place one kettlebell between your feet. Clean the kettlebell by extending through the legs and hips as you raise the kettlebell towards your shoulders.', 'Release the kettlebell as it comes up, and let it flip so that the ball of the kettlebell lands in the palms of your hands.', 'Release the kettlebell out in front of you and catch the handle with both hands. Lower the kettlebell to the starting position and repeat.']::TEXT[], 'Open_Palm_Kettlebell_Clean', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Otis-Up', 'Abdominals', 'Other', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Otis-Up/0.jpg', ARRAY['Chest', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Secure your feet and lay back on the floor. Your knees should be bent. Hold a weight with both hands to your chest. This will be your starting position.', 'Initiate the movement by flexing the hips and spine to raise your torso up from the ground.', 'As you move up, press the weight up so that it is above your head at the top of the movement.', 'Return the weight to your chest as you reverse the sit-up motion, ensuring not to go all the way down to the floor.']::TEXT[], 'Otis-Up', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Overhead Cable Curl', 'Biceps', 'Biceps', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Overhead_Cable_Curl/0.jpg', NULL, ARRAY['To begin, set a weight that is comfortable on each side of the pulley machine. Note: Make sure that the amount of weight selected is the same on each side.', 'Now adjust the height of the pulleys on each side and make sure that they are positioned at a height higher than that of your shoulders.', 'Stand in the middle of both sides and use an underhand grip (palms facing towards the ceiling) to grab each handle. Your arms should be fully extended and parallel to the floor with your feet positioned shoulder width apart from each other. Your body should be evenly aligned the handles. This is the starting position.', 'While exhaling, slowly squeeze the biceps on each side until your forearms and biceps touch.', 'While inhaling, move your forearms back to the starting position. Note: Your entire body is stationary during this exercise except for the forearms.', 'Repeat for the recommended amount of repetitions prescribed in your program.']::TEXT[], 'Overhead_Cable_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Overhead Lat', 'Lats', 'Back', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Overhead_Lat/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Sit upright on the floor with your partner behind you. Raise one arm straight up, and flex the elbow, attempting to touch your hand to your back. Your parner should hold your tricep and wrist. This will be your starting position.', 'Attempt to pull your upper arm to your side as your partner prevents you from doing actually doing so.', 'After 10-20 seconds, relax the arm and allow your partner to further stretch the lat by applying gentle pressure to the tricep. Hold for 10-20 seconds, and then switch sides.']::TEXT[], 'Overhead_Lat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Overhead Slam', 'Lats', 'Back', 'Medicine ball', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Overhead_Slam/0.jpg', NULL, ARRAY['Hold a medine ball with both hands and stand with your feet at shoulder width. This will be your starting position.', 'Initiate the countermovement by raising the ball above your head and fully extending your body.', 'Reverse the motion, slamming the ball into the ground directly in front of you as hard as you can.', 'Receive the ball with both hands on the bounce and repeat the movement.']::TEXT[], 'Overhead_Slam', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Overhead Squat', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Overhead_Squat/0.jpg', ARRAY['Abdominals', 'Calves', 'Glutes', 'Hamstrings', 'Lower back', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Start out by having a barbell in front of you on the floor. Your feet should be wider than shoulder width apart from each other.', 'Bend the knees and use a pronated grip (palms facing you) to grab the barbell. Your hands should be at a wider than shoulder width apart from each other before lifting. Once you are positioned, lift the barbell up until you can rest it on your chest.', 'Move the barbell over and slightly behind your head and make sure your arms are fully extended. Keep your head up at all times and also maintain a straight back. Retract your shoulder blades. This is your starting position.', 'Slowly lower the weight by bending your knees until your thighs are parallel to the ground while inhaling. Tip: Keep your back straight while performing this exercise to avoid any injuries and your arms should remain extended and over your head at all times.', 'Now use your feet and legs to help bring the weight back up to the starting position while exhaling.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Overhead_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Overhead Stretch', 'Abdominals', 'Other', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Overhead_Stretch/0.jpg', ARRAY['Chest', 'Forearms', 'Lats', 'Triceps']::TEXT[], ARRAY['Standing straight up, lace your fingers together and open your palms to the ceiling. Keep your shoulders down as you extend your arms up.', 'To create a full torso stretch, pull your tailbone down and stabilize your torso as you do this. Stretch the muscles on both the front and the back of the torso.']::TEXT[], 'Overhead_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Overhead Triceps', 'Triceps', 'Triceps', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Overhead_Triceps/0.jpg', ARRAY['Lats']::TEXT[], ARRAY['Sit upright on the floor with your partner behind you. Raise one arm straight up, and flex the elbow, attempting to touch your hand to your back. Your parner should hold your elbow and wrist. This will be your starting position.', 'Attempt to extend the arm straight into the air as your partner prevents you from doing actually doing so.', 'After 10-20 seconds, relax the arm and allow your partner to further stretch the tricep by applying gentle pressure to the wrist. Hold for 10-20 seconds, and then switch sides.']::TEXT[], 'Overhead_Triceps', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Pallof Press', 'Abdominals', 'Other', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Pallof_Press/0.jpg', ARRAY['Chest', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Connect a standard handle to a tower, and—if possible—position the cable to shoulder height. If not, a low pulley will suffice.', 'With your side to the cable, grab the handle with both hands and step away from the tower. You should be approximately arm''s length away from the pulley, with the tension of the weight on the cable.', 'With your feet positioned hip-width apart and knees slightly bent, hold the cable to the middle of your chest. This will be your starting position.', 'Press the cable away from your chest, fully extending both arms. You core should be tight and engaged.', 'Hold the repetition for several seconds before returning to the starting position.', 'At the conclusion of the set, repeat facing the other direction.']::TEXT[], 'Pallof_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Pallof Press With Rotation', 'Abdominals', 'Other', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Pallof_Press_With_Rotation/0.jpg', ARRAY['Chest', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Connect a standard handle to a tower, and position the cable to shoulder height.', 'With your side to the cable, grab the handle with one hand and step away from the tower. You should be approximately arm''s length away from the pulley, with the tension of the weight on the cable. Align outstretched arm with cable.', 'With your feet positioned hip-width apart, pull the cable into your chest and grab the handle with your other hand. Both hands should be on the handle at this time.', 'Facing forward, press the cable away from your chest. You core should be tight and engaged.', 'Keeping your hips straight, twist your torso away from the pulley until you get a full quarter rotation.', 'Maintain your rigid stance and straight arms. Return to the neutral position in a slow and controlled manner. Your arms should be extended in front of you.', 'With the side tension still engaging your core, bring your hands to your chest and immediately press outward to a fully extended position. This constitutes one rep.', 'Repeat to failure.', 'Then, reposition and repeat the same series of movements on the opposite side.']::TEXT[], 'Pallof_Press_With_Rotation', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Palms-Down Dumbbell Wrist Curl Over A Bench', 'Forearms', 'Arms', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Palms-Down_Dumbbell_Wrist_Curl_Over_A_Bench/0.jpg', NULL, ARRAY['Start out by placing two dumbbells on one side of a flat bench.', 'Kneel down on both of your knees so that your body is facing the flat bench.', 'Use your arms to grab both of the dumbbells with a pronated grip (palms facing down) and bring them up so that your forearms are resting against the flat bench. Your wrists should be hanging over the edge.', 'Start out by curling your wrist upwards and exhaling.', 'Slowly lower your wrists back down to the starting position while inhaling.', 'Your forearms should be stationary as your wrist is the only movement needed to perform this exercise.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Palms-Down_Dumbbell_Wrist_Curl_Over_A_Bench', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Palms-Down Wrist Curl Over A Bench', 'Forearms', 'Arms', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Palms-Down_Wrist_Curl_Over_A_Bench/0.jpg', NULL, ARRAY['Start out by placing a barbell on one side of a flat bench.', 'Kneel down on both of your knees so that your body is facing the flat bench.', 'Use your arms to grab the barbell with a pronated grip (palms down) and bring them up so that your forearms are resting against the flat bench. Your wrists should be hanging over the edge.', 'Start out by curling your wrist upwards and exhaling.', 'Slowly lower your wrists back down to the starting position while inhaling.', 'Your forearms should be stationary as your wrist is the only movement needed to perform this exercise.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Palms-Down_Wrist_Curl_Over_A_Bench', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Palms-Up Barbell Wrist Curl Over A Bench', 'Forearms', 'Arms', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Palms-Up_Barbell_Wrist_Curl_Over_A_Bench/0.jpg', NULL, ARRAY['Start out by placing a barbell on one side of a flat bench.', 'Kneel down on both of your knees so that your body is facing the flat bench.', 'Use your arms to grab the barbell with a supinated grip (palms up) and bring them up so that your forearms are resting against the flat bench. Your wrists should be hanging over the edge.', 'Start out by curling your wrist upwards and exhaling.', 'Slowly lower your wrists back down to the starting position while inhaling.', 'Your forearms should be stationary as your wrist is the only movement needed to perform this exercise.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Palms-Up_Barbell_Wrist_Curl_Over_A_Bench', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Palms-Up Dumbbell Wrist Curl Over A Bench', 'Forearms', 'Arms', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Palms-Up_Dumbbell_Wrist_Curl_Over_A_Bench/0.jpg', NULL, ARRAY['Start out by placing two dumbbells on one side of a flat bench.', 'Kneel down on both of your knees so that your body is facing the flat bench.', 'Use your arms to grab both of the dumbbells with a supinated grip (palms up) and bring them up so that your forearms are resting against the flat bench. Your wrists should be hanging over the edge.', 'Start out by curling your wrist upwards and exhaling.', 'Slowly lower your wrists back down to the starting position while inhaling. Make sure to inhale during this part of the exercise.', 'Your forearms should be stationary as your wrist is the only movement needed to perform this exercise.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Palms-Up_Dumbbell_Wrist_Curl_Over_A_Bench', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Parallel Bar Dip', 'Triceps', 'Triceps', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Parallel_Bar_Dip/0.jpg', ARRAY['Chest', 'Shoulders']::TEXT[], ARRAY['Stand between a set of parallel bars. Place a hand on each bar, and then take a small jump to help you get into the starting position with your arms locked out.', 'Begin by flexing the elbow, lowering your body until your arms break 90 degrees. Avoid swinging, and maintain good posture throughout the descent.', 'Reverse the motion by extending the elbow, pushing yourself back up into the starting position.', 'Repeat for the desired number of repetitions.']::TEXT[], 'Parallel_Bar_Dip', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Pelvic Tilt Into Bridge', 'Lower back', 'Back', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Pelvic_Tilt_Into_Bridge/0.jpg', NULL, ARRAY['Lie down with your feet on the floor, heels directly under your knees.', 'Lift only your tailbone to the ceiling to stretch your lower back. (Don''t lift the entire spine yet.) Pull in your stomach.', 'To go into a bridge, lift the entire spine except the neck.']::TEXT[], 'Pelvic_Tilt_Into_Bridge', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Peroneals-SMR', 'Calves', 'Calves', 'Foam roll', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Peroneals-SMR/0.jpg', NULL, ARRAY['Lay on your side, supporting your weight on your forearm and on a foam roller placed on the outside of your lower leg. Your upper leg can either be on top of your lower leg, or you can cross it in front of you. This will be your starting position.', 'Raise your hips off of the ground and begin to roll from below the knee to above the ankle on the side of your leg, pausing at points of tension for 10-30 seconds. Repeat on the other leg.']::TEXT[], 'Peroneals-SMR', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Peroneals Stretch', 'Calves', 'Calves', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Peroneals_Stretch/0.jpg', NULL, ARRAY['In a seated position, loop a belt, rope, or band around one foot. This will be your starting position.', 'With the leg extended and the heel off of the ground, pull on the belt so that the foot is inverted, with the inside of the foot being pulled towards you. Hold for 10-20 seconds, and then switch sides.']::TEXT[], 'Peroneals_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Physioball Hip Bridge', 'Glutes', 'Legs', 'Exercise ball', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Physioball_Hip_Bridge/0.jpg', ARRAY['Hamstrings']::TEXT[], ARRAY['Lay on a ball so that your upper back is on the ball with your hips unsupported. Both feet should be flat on the floor, hip width apart or wider. This will be your starting position.', 'Begin by extending the hips using your glutes and hamstrings, raising your hips upward as you bridge.', 'Pause at the top of the motion and return to the starting position.']::TEXT[], 'Physioball_Hip_Bridge', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Pin Presses', 'Triceps', 'Triceps', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Pin_Presses/0.jpg', ARRAY['Chest', 'Forearms', 'Lats', 'Middle back', 'Shoulders']::TEXT[], ARRAY['Pin presses remove the eccentric phase of the bench press, developing starting strength. They also allow you to train a desired range of motion.', 'The bench should be set up in a power rack. Set the pins to the desired point in your range of motion, whether it just be lockout or an inch off of your chest. The bar should be moved to the pins and prepared for lifting.', 'Begin by lying on the bench, with the bar directly above the contact point during your regular bench. Tuck your feet underneath you and arch your back. Using the bar to help support your weight, lift your shoulder off the bench and retract them, squeezing the shoulder blades together. Use your feet to drive your traps into the bench. Maintain this tight body position throughout the movement.', 'You can take a standard bench grip, or shoulder width to focus on the triceps. The bar, wrist, and elbow should stay in line at all times. Focus on squeezing the bar and trying to pull it apart.', 'Drive the bar up with as much force as possible. The elbows should be tucked in until lockout.', 'Return the bar to the pins, pausing before beginning the next repetition.']::TEXT[], 'Pin_Presses', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Piriformis-SMR', 'Glutes', 'Legs', 'Foam roll', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Piriformis-SMR/0.jpg', NULL, ARRAY['Sit with your buttocks on top of a foam roll. Bend your knees, and then cross one leg so that the ankle is over the knee. This will be your starting position.', 'Shift your weight to the side of the crossed leg, rolling over the buttocks until you feel tension in your upper glute. You may assist the stretch by using one hand to pull the bent knee towards your chest. Hold this position for 10-30 seconds, and then switch sides.']::TEXT[], 'Piriformis-SMR', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Plank', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Plank/0.jpg', NULL, ARRAY['Get into a prone position on the floor, supporting your weight on your toes and your forearms. Your arms are bent and directly below the shoulder.', 'Keep your body straight at all times, and hold this position as long as possible. To increase difficulty, an arm or leg can be raised.']::TEXT[], 'Plank', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Plate Pinch', 'Forearms', 'Arms', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Plate_Pinch/0.jpg', NULL, ARRAY['Grab two wide-rimmed plates and put them together with the smooth sides facing outward', 'Use your fingers to grip the outside part of the plate and your thumb for the other side thus holding both plates together. This is the starting position.', 'Squeeze the plate with your fingers and thumb. Hold this position for as long as you can.', 'Repeat for the recommended amount of sets prescribed in your program.', 'Switch arms and repeat the movements.']::TEXT[], 'Plate_Pinch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Plate Twist', 'Abdominals', 'Other', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Plate_Twist/0.jpg', NULL, ARRAY['Lie down on the floor or an exercise mat with your legs fully extended and your upper body upright. Grab the plate by its sides with both hands out in front of your abdominals with your arms slightly bent.', 'Slowly cross your legs near your ankles and lift them up off the ground. Your knees should also be bent slightly. Note: Move your upper body back slightly to help keep you balanced turning this exercise. This is the starting position.', 'Move the plate to the left side and touch the floor with it. Breathe out as you perform that movement.', 'Come back to the starting position as you breathe in and then repeat the movement but this time to the right side of the body. Tip: Use a slow controlled movement at all times. Jerking motions can injure the back.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Plate_Twist', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Platform Hamstring Slides', 'Hamstrings', 'Hamstrings', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Platform_Hamstring_Slides/0.jpg', ARRAY['Glutes']::TEXT[], ARRAY['For this movement a wooden floor or similar is needed. Lay on your back with your legs extended. Place a gym towel or a light weight underneath your heel. This will be your starting position.', 'Begin the movement by flexing the knee, keeping your other leg straight.', 'Continue bringing the heel closer to you, sliding it on the floor.', 'At full knee flexion, reverse the movement to return to the starting position.']::TEXT[], 'Platform_Hamstring_Slides', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Plie Dumbbell Squat', 'Quadriceps', 'Quads', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Plie_Dumbbell_Squat/0.jpg', ARRAY['Abdominals', 'Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Hold a dumbbell at the base with both hands and stand straight up. Move your legs so that they are wider than shoulder width apart from each other with your knees slightly bent.', 'Your toes should be facing out. Note: Your arms should be stationary while performing the exercise. This is the starting position.', 'Slowly bend the knees and lower your legs until your thighs are parallel to the floor. Make sure to inhale as this is the eccentric part of the exercise.', 'Press mainly with the heel of the foot to bring the body back to the starting position while exhaling.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Plie_Dumbbell_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Plyo Kettlebell Pushups', 'Chest', 'Chest', 'Kettlebells', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Plyo_Kettlebell_Pushups/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Place a kettlebell on the floor. Place yourself in a pushup position, on your toes with one hand on the ground and one hand holding the kettlebell, with your elbows extended. This will be your starting position.', 'Begin by lowering yourself as low as you can, keeping your back straight.', 'Quickly and forcefully reverse direction, pushing yourself up to the other side of the kettlebell, switching hands as you do so. Continue the movement by descending and repeating the movement back and forth.']::TEXT[], 'Plyo_Kettlebell_Pushups', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Plyo Push-up', 'Chest', 'Chest', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Plyo_Push-up/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Move into a prone position on the floor, supporting your weight on your hands and toes.', 'Your arms should be fully extended with the hands around shoulder width. Keep your body straight throughout the movement. This will be your starting position.', 'Descend by flexing at the elbow, lowering your chest towards the ground.', 'At the bottom, reverse the motion by pushing yourself up through elbow extension as quickly as possible. Attempt to push your upper body up until your hands leave the ground.', 'Return to the starting position and repeat the exercise.', 'For added difficulty, add claps into the movement while you are air borne.']::TEXT[], 'Plyo_Push-up', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Posterior Tibialis Stretch', 'Calves', 'Calves', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Posterior_Tibialis_Stretch/0.jpg', NULL, ARRAY['In a seated position, loop a belt, rope, or band around one foot. This will be your starting position.', 'With the leg extended and the heel off of the ground, pull on the belt so that the foot is everted, with the outside of the foot being pulled towards you. Hold for 10-20 seconds, and then switch sides.']::TEXT[], 'Posterior_Tibialis_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Power Clean', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Power_Clean/0.jpg', ARRAY['Calves', 'Forearms', 'Glutes', 'Lower back', 'Middle back', 'Quadriceps', 'Shoulders', 'Traps', 'Triceps']::TEXT[], ARRAY['Stand with your feet slightly wider than shoulder width apart and toes pointing out slightly.', 'Squat down and grasp bar with a closed, pronated grip. Your hands should be slightly wider than shoulder width apart outside knees with elbows fully extended.', 'Place the bar about 1 inch in front of your shins and over the balls of your feet.', 'Your back should be flat or slightly arched, your chest held up and out and your shoulder blades should be retracted.', 'Keep your head in a neutral position (in line with vertebral column and not tilted or rotated) with your eyes focused straight ahead. Inhale during this phase.', 'Lift the bar from the floor by forcefully extending the hips and the knees as you exhale. Tip: The upper torso should maintain the same angle. Do not bend at the waist yet and do not let the hips rise before the shoulders (this would have the effect of pushing the glutes in the air and stretching the hamstrings.', 'Keep elbows fully extended with the head in a neutral position and the shoulders over the bar.', 'As the bar raises keep it as close to the shins as possible.', 'As the bar passes the knees, thrust your hips forward and slightly bend the knees to avoid locking them. Tip: At this point your thighs should be against the bar.', 'Keep the back flat or slightly arched, elbows fully extended and your head neutral. Tip: You will hold your breath until the next phase.', 'Inhale and then forcefully and quickly extend your hips and knees and stand on your toes.', 'Keep the bar as close to your body as possible. Tip: Your back should be flat with the elbows pointed out to the sides and your head in a neutral position. Also, keep your shoulders over the bar and arms straight as long as possible.', 'When your lower body joints are fully extended, shrug the shoulders upward rapidly without letting the elbows flex yet. Exhale during this portion of the movement.', 'As the shoulders reach their highest elevation flex your elbows to begin pulling your body under the bar.', 'Continue to pull the arms as high and as long as possible. Tip: Due to the explosive nature of this phase, your torso will be erect or with an arched back, your head will be tilted back slightly and your feet may lose contact with the floor.', 'After the lower body has fully extended and the bar reaches near maximal height, pull your body under the bar and rotate the arms around and under the bar.', 'Simultaneously, flex the hips and knees into a quarter squat position.', 'Once the arms are under the bar, inhale and then lift your elbows to position the upper arms parallel to the floor. Rack the bar across the front of your collar bones and front shoulder muscles.', 'Catch the bar with an erect and tight torso, a neutral head position and flat feet. Exhale during this movement.', 'Stand up by extending the hips and knees to a fully erect position.', 'Lower the bar by gradually reducing the muscular tension of the arms to allow a controlled descent of the bar to the thighs. Inhale during this movement.', 'Simultaneously flex the hips and knees to cushion the impact of the bar on the thighs.', 'Squat down with the elbows fully extended until the bar touches the floor.', 'Start over at Phase 1 and repeat for the recommended amount of repetitions.']::TEXT[], 'Power_Clean', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Power Clean from Blocks', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Power_Clean_from_Blocks/0.jpg', ARRAY['Quadriceps']::TEXT[], ARRAY['With a barbell on boxes of the desired height, take a grip just outside the legs. Lower your hips with the weight focused on the heels, back straight, head facing forward, chest up, with your shoulders just in front of the bar. This will be your starting position.', 'Begin the first pull by driving through the heels, extending your knees. Your back angle should stay the same, and your arms should remain straight. As the bar approaches the mid-thigh position, begin extending through the hips.', 'In a jumping motion, accelerate by extending the hips, knees, and ankles, using speed to move the bar upward. There should be no need to actively pull through the arms to accelerate the weight. At the end of the second pull, the body should be fully extended, leaning slightly back, with the arms still extended.', 'As full extension is achieved, transition into the third pull by aggressively shrugging and flexing the arms with the elbows up and out. At peak extension, pull yourself under the bar far enough that it can be racked onto the shoulders, rotating your elbows under the bar as you do so. The bar should be racked onto the protracted shoulders, lightly touching the throat with the hands relaxed.', 'Immediately recover by driving through the heels, keeping the torso upright and elbows up. Continue until you have risen to a standing position, and complete the repetition by returning the weight to the boxes.']::TEXT[], 'Power_Clean_from_Blocks', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Power Jerk', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Power_Jerk/0.jpg', ARRAY['Abdominals', 'Calves', 'Glutes', 'Hamstrings', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Standing with the weight racked on the front of the shoulders, begin with the dip. With your feet directly under your hips, flex the knees without moving the hips backward. Go down only slightly, and reverse direction as powerfully as possible.', 'Drive through the heels create as much speed and force as possible, and be sure to move your head out of the way as the bar leaves the shoulders.', 'At this moment as the feet leave the floor, the feet must be placed into the receiving position as quickly as possible. In the brief moment the feet are not actively driving against the platform, the athletes effort to push the bar up will drive them down. The feet should be moved to a slightly wider stance, with the knees partially bent.', 'Receive the bar with the arms locked out overhead.', 'Return to a standing position.']::TEXT[], 'Power_Jerk', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Power Partials', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Power_Partials/0.jpg', NULL, ARRAY['Stand up with your torso upright and a dumbbell on each hand being held at arms length. The elbows should be close to the torso.', 'The palms of the hands should be facing your torso. Your feet should be about shoulder width apart. This will be your starting position.', 'Keeping your arms straight and the torso stationary, lift the weights out to your sides until they are about shoulder level height while exhaling.', 'Feel the contraction for a second and begin to lower the weights back down to the starting position while inhaling. Tip: Keep the palms facing down with the little finger slightly higher while lifting and lowering the weights as it will concentrate the stress on your shoulders mainly.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Power_Partials', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Power Snatch', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Power_Snatch/0.jpg', ARRAY['Calves', 'Glutes', 'Lower back', 'Quadriceps', 'Shoulders', 'Traps', 'Triceps']::TEXT[], ARRAY['Begin with a loaded barbell on the floor. The bar should be close to or touching the shins, and a wide grip should be taken on the bar. The feet should be directly below the hips, with the feet turned out as needed. Lower the hips, with the chest up and the head looking forward. The shoulders should be just in front of the bar. This will be the starting position.', 'Begin the first pull by driving through the front of the heels, raising the bar from the ground. The back angle should stay the same until the bar passes the knees.', 'Transition into the second pull by extending through the hips knees and ankles, driving the bar up as quickly as possible. The bar should be close to the body. At peak extension, shrug the shoulders and allow the elbows to flex to the side.', 'As you move your feet into the receiving position, a slightly wider position, pull yourself below the bar as you elevate the bar overhead. The bar should be received in a partial squat. Continue raising the bar to the overhead position, receiving the bar locked out overhead.', 'Return to a standing position with the weight over head.']::TEXT[], 'Power_Snatch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Power Snatch from Blocks', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Power_Snatch_from_Blocks/0.jpg', ARRAY['Calves', 'Forearms', 'Glutes', 'Hamstrings', 'Lower back', 'Shoulders', 'Traps', 'Triceps']::TEXT[], ARRAY['Begin with a loaded barbell on boxes or stands of the desired height. A wide grip should be taken on the bar. The feet should be directly below the hips, with the feet turned out as needed. Lower the hips, with the chest up and the head looking forward. The shoulders should be just in front of the bar, with the elbows pointed out. This will be the starting position.', 'Begin the first pull by driving through the front of the heels, raising the bar from the boxes.', 'Transition into the second pull by extending through the hips knees and ankles, driving the bar up as quickly as possible. The bar should be close to the body. At peak extension, shrug the shoulders and allow the elbows to flex to the side.', 'As you move your feet into the receiving position, forcefully pull yourself below the bar as you elevate the bar overhead. The feet should move to just outside the hips, turned out as necessary. Receive the bar above a full squat and with the arms fully extended overhead.', 'Keeping the bar aligned over the front of the heels, your head and chest up, drive through heels of the feet to move to a standing position. Carefully return the weight to the boxes.']::TEXT[], 'Power_Snatch_from_Blocks', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Power Stairs', 'Hamstrings', 'Hamstrings', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Power_Stairs/0.jpg', ARRAY['Adductors', 'Calves', 'Glutes', 'Lower back', 'Quadriceps', 'Shoulders', 'Traps']::TEXT[], ARRAY['In the power stairs, implements are moved up a staircase. For training purposes, these can be performed with a tire or box.', 'Begin by taking the implement with both hands. Set your feet wide, with your head and chest up. Drive through the ground with your heels, extending your knees and hips to raise the weight from the ground.', 'As you lean back, attempt to swing the weight onto the stairs, which are usually around 16-18" high. You can use your legs to help push the weight onto the stair.', 'Repeat for 3-5 repetitions, and continue with a heavier weight, moving as fast as possible.']::TEXT[], 'Power_Stairs', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Preacher Curl', 'Biceps', 'Biceps', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Preacher_Curl/0.jpg', NULL, ARRAY['To perform this movement you will need a preacher bench and an E-Z bar. Grab the E-Z curl bar at the close inner handle (either have someone hand you the bar which is preferable or grab the bar from the front bar rest provided by most preacher benches). The palm of your hands should be facing forward and they should be slightly tilted inwards due to the shape of the bar.', 'With the upper arms positioned against the preacher bench pad and the chest against it, hold the E-Z Curl Bar at shoulder length. This will be your starting position.', 'As you breathe in, slowly lower the bar until your upper arm is extended and the biceps is fully stretched.', 'As you exhale, use the biceps to curl the weight up until your biceps is fully contracted and the bar is at shoulder height. Squeeze the biceps hard and hold this position for a second.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Preacher_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Preacher Hammer Dumbbell Curl', 'Biceps', 'Biceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Preacher_Hammer_Dumbbell_Curl/0.jpg', ARRAY['Forearms']::TEXT[], ARRAY['Place the upper part of both arms on top of the preacher bench as you hold a dumbbell in each hand with the palms facing each other (neutral grip).', 'As you breathe in, slowly lower the dumbbells until your upper arm is extended and the biceps is fully stretched.', 'As you exhale, use the biceps to curl the weight up until your biceps is fully contracted and the dumbbells are at shoulder height.', 'Squeeze the biceps hard for a second at the contracted position and repeat for the recommended amount of repetitions.']::TEXT[], 'Preacher_Hammer_Dumbbell_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Press Sit-Up', 'Abdominals', 'Other', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Press_Sit-Up/0.jpg', ARRAY['Chest', 'Shoulders', 'Triceps']::TEXT[], ARRAY['To begin, lie down on a bench with a barbell resting on your chest. Position your legs so they are secure on the extension of the abdominal bench. This is the starting position.', 'While inhaling, tighten your abdominals and glutes. Simultaneously curl your torso as you do when performing a sit-up and press the barbell to an overhead position while exhaling. Tip: Use your arms to push the barbell out as you perform this exercise while still focusing on the abdominal muscles.', 'Lower your upper body back down to the starting position while bringing the barbell back down to your torso. Remember to breathe in while lowering the body.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Press_Sit-Up', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Prone Manual Hamstring', 'Hamstrings', 'Hamstrings', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Prone_Manual_Hamstring/0.jpg', NULL, ARRAY['You will need a partner for this exercise. Lay face down with your legs straight. Your assistant will place their hand on your heel.', 'To begin, flex the knee to curl your leg up. Your partner should provide resistance, starting light and increasing the pressure as the movement is completed. Communicate with your partner to monitor appropriate resistance levels.', 'Pause at the top, returning the leg to the starting position as your partner provides resistance going the other direction.']::TEXT[], 'Prone_Manual_Hamstring', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Prowler Sprint', 'Hamstrings', 'Hamstrings', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Prowler_Sprint/0.jpg', ARRAY['Calves', 'Chest', 'Glutes', 'Quadriceps', 'Shoulders']::TEXT[], ARRAY['Place your sled on an appropriate surface, loaded to a suitable weight. The sled should provide enough resistance to require effort, but not so heavy that you are significantly slowed down.', 'You may use the upright or the low handles for this exercise. Place your hands on the handles with your arms extended, leaning into the implement.', 'With good posture, drive through the ground with alternating, short steps. Move as fast as you can for a short distance.']::TEXT[], 'Prowler_Sprint', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Pull Through', 'Glutes', 'Legs', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Pull_Through/0.jpg', ARRAY['Hamstrings', 'Lower back']::TEXT[], ARRAY['Begin standing a few feet in front of a low pulley with a rope or handle attached. Face away from the machine, straddling the cable, with your feet set wide apart.', 'Begin the movement by reaching through your legs as far as possible, bending at the hips. Keep your knees slightly bent. Keeping your arms straight, extend through the hip to stand straight up. Avoid pulling upward through the shoulders; all of the motion should originate through the hips.']::TEXT[], 'Pull_Through', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Pullups', 'Lats', 'Back', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Pullups/0.jpg', ARRAY['Biceps', 'Middle back']::TEXT[], ARRAY['Grab the pull-up bar with the palms facing forward using the prescribed grip. Note on grips: For a wide grip, your hands need to be spaced out at a distance wider than your shoulder width. For a medium grip, your hands need to be spaced out at a distance equal to your shoulder width and for a close grip at a distance smaller than your shoulder width.', 'As you have both arms extended in front of you holding the bar at the chosen grip width, bring your torso back around 30 degrees or so while creating a curvature on your lower back and sticking your chest out. This is your starting position.', 'Pull your torso up until the bar touches your upper chest by drawing the shoulders and the upper arms down and back. Exhale as you perform this portion of the movement. Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. The upper torso should remain stationary as it moves through space and only the arms should move. The forearms should do no other work other than hold the bar.', 'After a second on the contracted position, start to inhale and slowly lower your torso back to the starting position when your arms are fully extended and the lats are fully stretched.', 'Repeat this motion for the prescribed amount of repetitions.']::TEXT[], 'Pullups', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Push-Up Wide', 'Chest', 'Chest', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Push-Up_Wide/0.jpg', ARRAY['Abdominals', 'Shoulders', 'Triceps']::TEXT[], ARRAY['With your hands wide apart, support your body on your toes and hands in a plank position. Your elbows should be extended and your body straight. Do not allow your hips to sag. This will be your starting position.', 'To begin, allow the elbows to flex, lowering your chest to the floor as you inhale.', 'Using your pectoral muscles, press your upper body back up to the starting position by extending the elbows. Exhale as you perform this step.', 'After pausing at the contracted position, repeat the movement for the prescribed amount of repetitions.']::TEXT[], 'Push-Up_Wide', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Push-Ups - Close Triceps Position', 'Triceps', 'Triceps', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Push-Ups_-_Close_Triceps_Position/0.jpg', ARRAY['Chest', 'Shoulders']::TEXT[], ARRAY['Lie on the floor face down and place your hands closer than shoulder width for a close hand position. Make sure that you are holding your torso up at arms'' length.', 'Lower yourself until your chest almost touches the floor as you inhale.', 'Using your triceps and some of your pectoral muscles, press your upper body back up to the starting position and squeeze your chest. Breathe out as you perform this step.', 'After a second pause at the contracted position, repeat the movement for the prescribed amount of repetitions.']::TEXT[], 'Push-Ups_-_Close_Triceps_Position', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Push-Ups With Feet Elevated', 'Chest', 'Chest', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Push-Ups_With_Feet_Elevated/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Lie on the floor face down and place your hands about 36 inches apart from each other holding your torso up at arms length.', 'Place your toes on top of a flat bench. This will allow your body to be elevated. Note: The higher the elevation of the flat bench, the higher the resistance of the exercise is.', 'Lower yourself until your chest almost touches the floor as you inhale.', 'Using your pectoral muscles, press your upper body back up to the starting position and squeeze your chest. Breathe out as you perform this step.', 'After a second pause at the contracted position, repeat the movement for the prescribed amount of repetitions.']::TEXT[], 'Push-Ups_With_Feet_Elevated', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Push-Ups With Feet On An Exercise Ball', 'Chest', 'Chest', 'Exercise ball', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Push-Ups_With_Feet_On_An_Exercise_Ball/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Lie on the floor face down and place your hands about 36 inches apart from each other holding your torso up at arms length.', 'Place your toes on top of an exercise ball. This will allow your body to be elevated.', 'Lower yourself until your chest almost touches the floor as you inhale.', 'Using your pectoral muscles, press your upper body back up to the starting position and squeeze your chest. Breathe out as you perform this step.', 'After a second pause at the contracted position, repeat the movement for the prescribed amount of repetitions.']::TEXT[], 'Push-Ups_With_Feet_On_An_Exercise_Ball', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Push Press', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Push_Press/0.jpg', ARRAY['Quadriceps', 'Triceps']::TEXT[], NULL, 'Push_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Push Press - Behind the Neck', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Push_Press_-_Behind_the_Neck/0.jpg', ARRAY['Calves', 'Quadriceps', 'Triceps']::TEXT[], ARRAY['Standing with the weight racked on the back of the shoulders, begin with the dip. With your feet directly under your hips, flex the knees without moving the hips backward. Go down only slightly, and reverse direction as powerfully as possible. Drive through the heels create as much speed and force as possible, moving the bar in a vertical path.', 'Using the momentum generated, finish pressing the weight overhead be extending through the arms.', 'Return to the starting position, using your legs to absorb the impact.']::TEXT[], 'Push_Press_-_Behind_the_Neck', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Push Up to Side Plank', 'Chest', 'Chest', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Push_Up_to_Side_Plank/0.jpg', ARRAY['Abdominals', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Get into pushup position on the toes with your hands just outside of shoulder width.', 'Perform a pushup by allowing the elbows to flex. As you descend, keep your body straight.', 'Do one pushup and as you come up, shift your weight on the left side of the body, twist to the side while bringing the right arm up towards the ceiling in a side plank.', 'Lower the arm back to the floor for another pushup and then twist to the other side.', 'Repeat the series, alternating each side, for 10 or more reps.']::TEXT[], 'Push_Up_to_Side_Plank', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Pushups', 'Chest', 'Chest', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Pushups/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Lie on the floor face down and place your hands about 36 inches apart while holding your torso up at arms length.', 'Next, lower yourself downward until your chest almost touches the floor as you inhale.', 'Now breathe out and press your upper body back up to the starting position while squeezing your chest.', 'After a brief pause at the top contracted position, you can begin to lower yourself downward again for as many repetitions as needed.']::TEXT[], 'Pushups', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Pushups (Close and Wide Hand Positions)', 'Chest', 'Chest', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Pushups_Close_and_Wide_Hand_Positions/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Lie on the floor face down and body straight with your toes on the floor and the hands wider than shoulder width for a wide hand position and closer than shoulder width for a close hand position. Make sure you are holding your torso up at arms length.', 'Lower yourself until your chest almost touches the floor as you inhale.', 'Using your pectoral muscles, press your upper body back up to the starting position and squeeze your chest. Breathe out as you perform this step.', 'After a second pause at the contracted position, repeat the movement for the prescribed amount of repetitions.']::TEXT[], 'Pushups_Close_and_Wide_Hand_Positions', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Pyramid', 'Lower back', 'Back', 'Exercise ball', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Pyramid/0.jpg', ARRAY['Shoulders']::TEXT[], ARRAY['Start off by rolling your torso forward onto the ball so your hips rest on top of the ball and become the highest point of your body.', 'Rest your hands and feet on the floor. Your arms and legs can be slightly bent or straight, depending on the size of the ball, your flexibility, and the length of your limbs. This also helps develop stabilizing strength in your torso and shoulders.']::TEXT[], 'Pyramid', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Quad Stretch', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Quad_Stretch/0.jpg', NULL, ARRAY['Lay on your side. Loop a belt, rope, or band around your top foot. Flex the knee and extend your hip, attempting to touch your glutes with your foot, and holding the belt with your hands. This will be your starting position.', 'With the belt being held over the shoulder or overhead, gently pull to increase the stretch in the quadriceps. Hold for 10-20 seconds, and then switch sides.']::TEXT[], 'Quad_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Quadriceps-SMR', 'Quadriceps', 'Quads', 'Foam roll', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Quadriceps-SMR/0.jpg', NULL, ARRAY['Lay facedown on the floor with your weight supported by your hands or forearms. Place a foam roll underneath one leg on the quadriceps, and keep the foot off of the ground. Make sure to relax the leg as much as possible. This will be your starting position.', 'Shifting as much weight onto the leg to be stretched as is tolerable, roll over the foam from above the knee to below the hip, holding points of tension for 10-30 seconds. Switch sides.']::TEXT[], 'Quadriceps-SMR', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Quick Leap', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Quick_Leap/0.jpg', ARRAY['Calves', 'Hamstrings']::TEXT[], ARRAY['You will need a box for this exerise.', 'Begin facing the box standing 1-2 feet from its edge.', 'By utilizing your hips, hop onto the box, landing on both legs. Ensure that you land with your legs bent and your feet flat.', 'Immediately upon landing, fully extend through the entire body and swing your arms overhead to explode off of the box. Use your legs to absorb the impact of landing.']::TEXT[], 'Quick_Leap', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rack Delivery', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rack_Delivery/0.jpg', ARRAY['Forearms', 'Traps']::TEXT[], ARRAY['This drill teaches the delivery of the barbell to the rack position on the shoulders. Begin holding a bar in the scarecrow position, with the upper arms parallel to the floor, and the forearms hanging down. Use a hook grip, with your fingers wrapped over your thumbs.', 'Begin by rotating the elbows around the bar, delivering the bar to the shoulders. As your elbows come forward, relax your grip. The shoulders should be protracted, providing a shelf for the bar, which should lightly contact the throat.', 'It is important that the bar stay close to the body at all times, as with a heavier load any distance will result in an unwanted collision. As the movement becomes smoother, speed and load can be increased before progressing further.']::TEXT[], 'Rack_Delivery', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rack Pull with Bands', 'Lower back', 'Back', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rack_Pull_with_Bands/0.jpg', ARRAY['Forearms', 'Glutes', 'Hamstrings', 'Quadriceps', 'Traps']::TEXT[], ARRAY['Set up in a power rack with the bar on the pins. The pins should be set to the desired point; just below the knees, just above, or in the mid thigh position. Attach bands to the base of the rack, or secure them with dumbbells. Attach the other end to the bar. You may need to choke the bands to provide tension.', 'Position yourself against the bar in proper deadlifting position. Your feet should be under your hips, your grip shoulder width, back arched, and hips back to engage the hamstrings. Since the weight is typically heavy, you may use a mixed grip, a hook grip, or use straps to aid in holding the weight.', 'With your head looking forward, extend through the hips and knees, pulling the weight up and back until lockout. Be sure to pull your shoulders back as you complete the movement. Return the weight to the pins and repeat.']::TEXT[], 'Rack_Pull_with_Bands', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rack Pulls', 'Lower back', 'Back', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rack_Pulls/0.jpg', ARRAY['Forearms', 'Glutes', 'Hamstrings', 'Traps']::TEXT[], ARRAY['Set up in a power rack with the bar on the pins. The pins should be set to the desired point; just below the knees, just above, or in the mid thigh position. Position yourself against the bar in proper deadlifting position. Your feet should be under your hips, your grip shoulder width, back arched, and hips back to engage the hamstrings. Since the weight is typically heavy, you may use a mixed grip, a hook grip, or use straps to aid in holding the weight.', 'With your head looking forward, extend through the hips and knees, pulling the weight up and back until lockout. Be sure to pull your shoulders back as you complete the movement.', 'Return the weight to the pins and repeat.']::TEXT[], 'Rack_Pulls', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rear Leg Raises', 'Quadriceps', 'Quads', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rear_Leg_Raises/0.jpg', NULL, ARRAY['Place yourself on your hands knees on an exercise mat. Your head should be looking forward and the bend of the knees should create a 90-degree angle between the hamstrings and the calves. This will be your starting position.', 'Extend one leg up and behind you. The knee and hip should both extend. Repeat for 5-10 repetitions, and then switch sides.']::TEXT[], 'Rear_Leg_Raises', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Recumbent Bike', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Recumbent_Bike/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['To begin, seat yourself on the bike and adjust the seat to your height.', 'Select the desired option from the menu. You may have to start pedaling to turn it on. You can use the manual setting, or you can select a program to use. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise. The level of resistance can be changed throughout the workout. The handles can be used to monitor your heart rate to help you stay at an appropriate intensity.', 'Recumbent bikes offer convenience, cardiovascular benefits, and have less impact than other activities. A 150 lb person will burn about 230 calories cycling at a moderate rate for 30 minutes, compared to 450 calories or more running.']::TEXT[], 'Recumbent_Bike', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Return Push from Stance', 'Shoulders', 'Shoulders', 'Medicine ball', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Return_Push_from_Stance/0.jpg', ARRAY['Chest', 'Triceps']::TEXT[], ARRAY['You will need a partner for this drill.', 'Begin in an athletic 2 or 3 point stance.', 'At the signal, move into a position to receive the pass from your partner.', 'Catch the medicine ball with both hands and immediately throw it back to your partner.', 'You can modify this drill by running different routes.']::TEXT[], 'Return_Push_from_Stance', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Band Bench Press', 'Triceps', 'Triceps', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Band_Bench_Press/0.jpg', ARRAY['Chest', 'Forearms', 'Lats', 'Middle back', 'Shoulders']::TEXT[], ARRAY['Position a bench inside a power rack, with the bar set to the correct height. Begin by anchoring bands either to band pegs or to the top of the rack. Ensure that you will be position properly under the bands. Attach the other end to the barbell.', 'Lie on the bench, tuck your feet underneath you and arch your back. Using the bar to help support your weight, lift your shoulder off the bench and retract them, squeezing the shoulder blades together. Use your feet to drive your traps into the bench. Maintain this tight body position throughout the movement. However wide your grip, it should cover the ring on the bar.', 'Pull the bar out of the rack without protracting your shoulders. Focus on squeezing the bar and trying to pull it apart. Lower the bar to your lower chest or upper stomach. The bar, wrist, and elbow should stay in line at all times.', 'Pause when the barbell touches your torso, and then drive the bar up with as much force as possible. The elbows should be tucked in until lockout.']::TEXT[], 'Reverse_Band_Bench_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Band Box Squat', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Band_Box_Squat/0.jpg', ARRAY['Abductors', 'Adductors', 'Calves', 'Forearms', 'Glutes', 'Hamstrings', 'Lower back']::TEXT[], ARRAY['Begin in a power rack with a box at the appropriate height behind you. Set up the bands either on band pegs or attached to the top of the rack, ensuring they will be directly above the bar during the squat. Attach the other end to the bar.', 'Begin by stepping under the bar and placing it across the back of the shoulders. Squeeze your shoulder blades together and rotate your elbows forward, attempting to bend the bar across your shoulders. Remove the bar from the rack, creating a tight arch in your lower back, and step back into position. Place your feet wider for more emphasis on the back, glutes, adductors, and hamstrings, or closer together for more quad development. Keep your head facing forward.', 'With your back, shoulders, and core tight, push your knees and butt out and you begin your descent. Sit back with your hips until you are seated on the box. Ideally, your shins should be perpendicular to the ground. Pause when you reach the box, and relax the hip flexors. Never bounce off of a box.', 'Keeping the weight on your heels and pushing your feet and knees out, drive upward off of the box as you lead the movement with your head. Continue upward, maintaining tightness head to toe. Use care to return the barbell to the rack.']::TEXT[], 'Reverse_Band_Box_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Band Deadlift', 'Lower back', 'Back', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Band_Deadlift/0.jpg', ARRAY['Abductors', 'Adductors', 'Calves', 'Glutes', 'Hamstrings', 'Quadriceps']::TEXT[], ARRAY['Set the bar up in a power rack. Attach bands to the top of the rack, using either bands pegs or the frame itself. Attach the other end of the bands to the bar.', 'Approach the bar so that it is centered over your feet. You feet should be about hip width apart. Bend at the hip to grip the bar at shoulder width, allowing your shoulder blades to protract. Typically, you would use an overhand grip or an over/under grip on heavier sets.', 'With your feet, and your grip set, take a big breath and then lower your hips and bend the knees until your shins contact the bar. Look forward with your head, keep your chest up and your back arched, and begin driving through the heels to move the weight upward.', 'After the bar passes the knees, aggressively pull the bar back, pulling your shoulder blades together as you drive your hips forward into the bar.', 'Lower the bar by bending at the hips and guiding it to the floor.']::TEXT[], 'Reverse_Band_Deadlift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Band Power Squat', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Band_Power_Squat/0.jpg', ARRAY['Adductors', 'Calves', 'Glutes', 'Hamstrings', 'Lower back']::TEXT[], ARRAY['Begin in a power rack with the pins and bar set at the appropriate height. After loading the bar, attach bands to the top of the rack, using either pegs or the frame itself. Attach the other end of the bands to the bar.', 'Begin by stepping under the bar and placing it across the back of the shoulders. Squeeze your shoulder blades together and rotate your elbows forward, attempting to bend the bar across your shoulders. Remove the bar from the rack, creating a tight arch in your lower back, and step back into position. Place your feet wide for more emphasis on the back, glutes, adductors, and hamstrings.', 'Keep your head facing forward. With your back, shoulders, and core tight, push your knees and butt out and you begin your descent. Sit back with your hips as much as possible. Ideally, your shins should be perpendicular to the ground. Lower bar position necessitates a greater torso lean to keep the bar over the heels. Continue until you break parallel, which is defined as the crease of the hip being in line with the top of the knee.', 'Keeping the weight on your heels and pushing your feet and knees out, drive upward as you lead the movement with your head. Continue upward, maintaining tightness head to toe, until you have returned to the starting position.']::TEXT[], 'Reverse_Band_Power_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Band Sumo Deadlift', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Band_Sumo_Deadlift/0.jpg', ARRAY['Abductors', 'Adductors', 'Calves', 'Forearms', 'Glutes', 'Lower back', 'Quadriceps', 'Traps']::TEXT[], ARRAY['Begin with a bar loaded on the floor inside of a power rack. Attach bands to the top of the rack, using either pegs or the frame itself. Attach the other end to the barbell.', 'Approach the bar so that the bar intersects the middle of the feet. The feet should be set very wide, near the collars. Bend at the hips to grip the bar. The arms should be directly below the shoulders, inside the legs, and you can use a pronated grip, a mixed grip, or hook grip. Relax the shoulders, which in effect lengthens your arms.', 'Take a breath, and then lower your hips, looking forward with your head with your chest up. Drive through the floor, spreading your feet apart, with your weight on the back half of your feet. Extend through the hips and knees.', 'As the bar passes through the knees, lean back and drive the hips into the bar, pulling your shoulder blades together.', 'Return the weight to the ground by bending at the hips and controlling the weight on the way down.']::TEXT[], 'Reverse_Band_Sumo_Deadlift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Barbell Curl', 'Biceps', 'Biceps', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Barbell_Curl/0.jpg', ARRAY['Forearms']::TEXT[], ARRAY['Stand up with your torso upright while holding a barbell at shoulder width with the elbows close to the torso. The palm of your hands should be facing down (pronated grip). This will be your starting position.', 'While holding the upper arms stationary, curl the weights while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second as you squeeze the muscle.', 'Slowly begin to bring the bar back to starting position as your breathe in.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Reverse_Barbell_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Barbell Preacher Curls', 'Biceps', 'Biceps', 'E-z curl bar', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Barbell_Preacher_Curls/0.jpg', ARRAY['Forearms']::TEXT[], ARRAY['Grab an EZ-bar using a shoulder width and palms down (pronated) grip.', 'Now place the upper part of both arms on top of the preacher bench and have your arms extended. This will be your starting position.', 'As you exhale, use the biceps to curl the weight up until your biceps are fully contracted and the barbell is at shoulder height. Squeeze the biceps hard for a second at the contracted position.', 'As you breathe in, slowly lower the barbell until your upper arms are extended and the biceps is fully stretched.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Reverse_Barbell_Preacher_Curls', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Cable Curl', 'Biceps', 'Biceps', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Cable_Curl/0.jpg', ARRAY['Forearms']::TEXT[], ARRAY['Stand up with your torso upright while holding a bar attachment that is attached to a low pulley using a pronated (palms down) and shoulder width grip. Make sure also that you keep the elbows close to the torso. This will be your starting position.', 'While holding the upper arms stationary, curl the weights while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second as you squeeze the muscle.', 'Slowly begin to bring the bar back to starting position as your breathe in.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Reverse_Cable_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Crunch', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Crunch/0.jpg', NULL, ARRAY['Lie down on the floor with your legs fully extended and arms to the side of your torso with the palms on the floor. Your arms should be stationary for the entire exercise.', 'Move your legs up so that your thighs are perpendicular to the floor and feet are together and parallel to the floor. This is the starting position.', 'While inhaling, move your legs towards the torso as you roll your pelvis backwards and you raise your hips off the floor. At the end of this movement your knees will be touching your chest.', 'Hold the contraction for a second and move your legs back to the starting position while exhaling.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Reverse_Crunch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Flyes', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Flyes/0.jpg', NULL, ARRAY['To begin, lie down on an incline bench with the chest and stomach pressing against the incline. Have the dumbbells in each hand with the palms facing each other (neutral grip).', 'Extend the arms in front of you so that they are perpendicular to the angle of the bench. The legs should be stationary while applying pressure with the ball of your toes. This is the starting position.', 'Maintaining the slight bend of the elbows, move the weights out and away from each other (to the side) in an arc motion while exhaling. Tip: Try to squeeze your shoulder blades together to get the best results from this exercise.', 'The arms should be elevated until they are parallel to the floor.', 'Feel the contraction and slowly lower the weights back down to the starting position while inhaling.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Reverse_Flyes', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Flyes With External Rotation', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Flyes_With_External_Rotation/0.jpg', NULL, ARRAY['To begin, lie down on an incline bench set at a 30-degree angle with the chest and stomach pressing against the incline.', 'Have the dumbbells in each hand with the palms facing down to the floor. Your arms should be in front of you so that they are perpendicular to the angle of the bench. Tip: Your elbows should have a slight bend. The legs should be stationary while applying pressure with the ball of your toes (your heels should not be touching the floor). This is the starting position.', 'Maintaining the slight bend of the elbows, move the weights out and away from each other in an arc motion while exhaling.', 'As you lift the weight, your wrist should externally rotate by 90-degrees so that you go from a palms down (pronated) grip to a palms facing each other (neutral) grip. Tip: Try to squeeze your shoulder blades together to get the best results from this exercise.', 'The arms should be elevated until they are level with the head.', 'Feel the contraction and slowly lower the weights back down to the starting position while inhaling.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Reverse_Flyes_With_External_Rotation', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Grip Bent-Over Rows', 'Middle back', 'Back', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Grip_Bent-Over_Rows/0.jpg', ARRAY['Biceps', 'Lats', 'Shoulders']::TEXT[], ARRAY['Stand erect while holding a barbell with a supinated grip (palms facing up).', 'Bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Tip: Make sure that you keep the head up. The barbell should hang directly in front of you as your arms hang perpendicular to the floor and your torso. This is your starting position.', 'While keeping the torso stationary, lift the barbell as you breathe out, keeping the elbows close to the body and not doing any force with the forearm other than holding the weights. On the top contracted position, squeeze the back muscles and hold for a second.', 'Slowly lower the weight again to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Reverse_Grip_Bent-Over_Rows', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Grip Triceps Pushdown', 'Triceps', 'Triceps', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Grip_Triceps_Pushdown/0.jpg', NULL, ARRAY['Start by setting a bar attachment (straight or e-z) on a high pulley machine.', 'Facing the bar attachment, grab it with the palms facing up (supinated grip) at shoulder width. Lower the bar by using your lats until your arms are fully extended by your sides. Tip: Elbows should be in by your sides and your feet should be shoulder width apart from each other. This is the starting position.', 'Slowly elevate the bar attachment up as you inhale so it is aligned with your chest. Only the forearms should move and the elbows/upper arms should be stationary by your side at all times.', 'Then begin to lower the cable bar back down to the original staring position while exhaling and contracting the triceps hard.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Reverse_Grip_Triceps_Pushdown', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Hyperextension', 'Hamstrings', 'Hamstrings', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Hyperextension/0.jpg', ARRAY['Calves', 'Glutes']::TEXT[], ARRAY['Place your feet between the pads after loading an appropriate weight. Lay on the top pad, allowing your hips to hang off the back, while grasping the handles to hold your position.', 'To begin the movement, flex the hips, pulling the legs forward.', 'Reverse the motion by extending the hips, kicking the leg back. It is very important not to over-extend the hip on this movement, stopping short of your full range of motion.', 'Return by again flexing the hip, pulling the carriage forward as far as you can.', 'Repeat for the desired number of repetitions.']::TEXT[], 'Reverse_Hyperextension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Machine Flyes', 'Shoulders', 'Shoulders', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Machine_Flyes/0.jpg', NULL, ARRAY['Adjust the handles so that they are fully to the rear. Make an appropriate weight selection and adjust the seat height so the handles are at shoulder level. Grasp the handles with your hands facing inwards. This will be your starting position.', 'In a semicircular motion, pull your hands out to your side and back, contracting your rear delts.', 'Keep your arms slightly bent throughout the movement, with all of the motion occurring at the shoulder joint.', 'Pause at the rear of the movement, and slowly return the weight to the starting position.']::TEXT[], 'Reverse_Machine_Flyes', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Plate Curls', 'Biceps', 'Biceps', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Plate_Curls/0.jpg', ARRAY['Forearms']::TEXT[], ARRAY['Start by standing straight with a weighted plate held by both hands and arms fully extended. Use a pronated grip (palms facing down) and make sure your fingers grab the rough side of the plate while your thumb grabs the smooth side. Note: For the best results, grab the weighted plate at an 11:00 and 1:00 o''clock position.', 'Your feet should be shoulder width apart from each other and the weighted plate should be near the groin area. This is the starting position.', 'Slowly lift the plate up while keeping the elbows in and the upper arms stationary until your biceps and forearms touch while exhaling. The plate should be evenly aligned with your torso at this point.', 'Feel the contraction for a second and begin to lower the weight back down to the starting position while inhaling', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Reverse_Plate_Curls', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Reverse Triceps Bench Press', 'Triceps', 'Triceps', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Reverse_Triceps_Bench_Press/0.jpg', ARRAY['Chest', 'Shoulders']::TEXT[], ARRAY['Lie back on a flat bench. Using a close, supinated grip (around shoulder width), lift the bar from the rack and hold it straight over you with your arms locked extended in front of you and perpendicular to the floor. This will be your starting position.', 'As you breathe in, come down slowly until you feel the bar on your middle chest. Tip: Make sure that as opposed to a regular bench press, you keep the elbows close to the torso at all times in order to maximize triceps involvement.', 'After a second pause, bring the bar back to the starting position as you breathe out and push the bar using your triceps muscles. Lock your arms in the contracted position, hold for a second and then start coming down slowly again. Tip: It should take at least twice as long to go down than to come up.', 'Repeat the movement for the prescribed amount of repetitions.', 'When you are done, place the bar back in the rack.']::TEXT[], 'Reverse_Triceps_Bench_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rhomboids-SMR', 'Middle back', 'Back', 'Foam roll', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rhomboids-SMR/0.jpg', ARRAY['Traps']::TEXT[], ARRAY['Lay down with your back on the floor. Place a foam roll underneath your upper back, and cross your arms in front of you, protracting your shoulders. This will be your starting position.', 'Raise your hips off of the ground, placing your weight onto the foam roll. Shift your weight to one side at a time, rolling over your middle and upper back. Pause at points of tension for 10-30 seconds.']::TEXT[], 'Rhomboids-SMR', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rickshaw Carry', 'Forearms', 'Arms', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rickshaw_Carry/0.jpg', ARRAY['Abdominals', 'Calves', 'Glutes', 'Hamstrings', 'Lower back', 'Quadriceps', 'Traps']::TEXT[], ARRAY['Position the frame at the starting point, and load with the appropriate weight. Standing in the center of the frame, begin by gripping the handles and driving through your heels to lift the frame. Ensure your chest and head are up and your back is straight.', 'Immediately begin walking briskly with quick, controlled steps. Keep your chest up and head forward, and make sure you continue breathing. Bring the frame to the ground after you have reached the end point.']::TEXT[], 'Rickshaw_Carry', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rickshaw Deadlift', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rickshaw_Deadlift/0.jpg', ARRAY['Forearms', 'Glutes', 'Hamstrings', 'Lower back', 'Traps']::TEXT[], ARRAY['Load the frame with the desired weight. Center yourself between the handles. You feet should be about hip width apart. Bend at the hips to grip the handles, allowing your shoulder blades to protract.', 'With your feet and your grip set, take a big breath and then lower your hips and flex the knees. Look forward with your head, keep your chest up and your back arched, and begin driving through the heels to move the weight upward. As the weight comes up, pull your shoulder blades together as you drive your hips forward.', 'Lower the weight by bending at the hips and guiding it to the ground.']::TEXT[], 'Rickshaw_Deadlift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Ring Dips', 'Triceps', 'Triceps', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Ring_Dips/0.jpg', ARRAY['Chest', 'Shoulders']::TEXT[], ARRAY['Grip a ring in each hand, and then take a small jump to help you get into the starting position with your arms locked out.', 'Begin by flexing the elbow, lowering your body until your arms break 90 degrees. Avoid swinging, and maintain good posture throughout the descent.', 'Reverse the motion by extending the elbow, pushing yourself back up into the starting position.', 'Repeat for the desired number of repetitions.']::TEXT[], 'Ring_Dips', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;