-- Seed Exercises Library Part 4

INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rocket Jump', 'Quadriceps', 'Quads', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rocket_Jump/0.jpg', ARRAY['Calves', 'Hamstrings']::TEXT[], ARRAY['Begin in a relaxed stance with your feet shoulder width apart and hold your arms close to the body.', 'To initiate the move, squat down halfway and explode back up as high as possible.', 'Fully extend your entire body, reaching overhead as far as possible. As you land, absorb your impact through the legs.']::TEXT[], 'Rocket_Jump', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rocking Standing Calf Raise', 'Calves', 'Calves', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rocking_Standing_Calf_Raise/0.jpg', NULL, ARRAY['This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place it on the back of your shoulders (slightly below the neck).', 'Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.', 'Step away from the rack and position your legs using a shoulder width medium stance with the toes slightly pointed out. Keep your head up at all times as looking down will get you off balance. Also maintain a straight back and keep the knees with a slight bend; never locked. This will be your starting position.', 'Raise your heels as you breathe out by extending your ankles as high as possible and flexing your calf. Ensure that the knee is kept stationary at all times. There should be no bending (other than the slight initial bend we created during positioning) at any time. Hold the contracted position by a second before you start to go back down.', 'Go back slowly to the starting position as you breathe in by lowering your heels as you bend the ankles until calves are stretched.', 'Now lift your toes by contracting the tibia muscles in the front of the calves as you breathe out.', 'Hold for a second and bring them back down as you breathe in.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Rocking_Standing_Calf_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rocky Pull-Ups/Pulldowns', 'Lats', 'Back', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rocky_Pull-Ups_Pulldowns/0.jpg', ARRAY['Biceps', 'Middle back', 'Shoulders']::TEXT[], ARRAY['Grab the pull-up bar with the palms facing forward using a wide grip.', 'As you have both arms extended in front of you holding the bar at the chosen grip width, bring your torso back around 30 degrees or so while creating a curvature on your lower back and sticking your chest out. This is your starting position.', 'Pull your torso up until the bar touches your upper chest by drawing the shoulders and the upper arms down and back. Exhale as you perform this portion of the movement. Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. The upper torso should remain stationary as it moves through space and only the arms should move. The forearms should do no other work other than hold the bar.', 'After a second on the contracted position, start to inhale and slowly lower your torso back to the starting position when your arms are fully extended and the lats are fully stretched.', 'Now repeat the same movements as described above except this time your torso will remain straight as you go up and the bar will touch the back of the neck instead of the upper chest. Tip: Use the head to lean forward slightly as it will help you properly execute this portion of the exercise.', 'Once you have lowered yourself back down to the starting position, repeat the exercise for the prescribed amount of repetitions in your program.']::TEXT[], 'Rocky_Pull-Ups_Pulldowns', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Romanian Deadlift', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Romanian_Deadlift/0.jpg', ARRAY['Calves', 'Glutes', 'Lower back']::TEXT[], ARRAY['Put a barbell in front of you on the ground and grab it using a pronated (palms facing down) grip that a little wider than shoulder width. Tip: Depending on the weight used, you may need wrist wraps to perform the exercise and also a raised platform in order to allow for better range of motion.', 'Bend the knees slightly and keep the shins vertical, hips back and back straight. This will be your starting position.', 'Keeping your back and arms completely straight at all times, use your hips to lift the bar as you exhale. Tip: The movement should not be fast but steady and under control.', 'Once you are standing completely straight up, lower the bar by pushing the hips back, only slightly bending the knees, unlike when squatting. Tip: Take a deep breath at the start of the movement and keep your chest up. Hold your breath as you lower and exhale as you complete the movement.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Romanian_Deadlift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Romanian Deadlift from Deficit', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Romanian_Deadlift_from_Deficit/0.jpg', ARRAY['Forearms', 'Glutes', 'Lower back', 'Traps']::TEXT[], ARRAY['Begin standing while holding a bar at arm''s length in front of you. You can stand on a raised platform to increase the range of motion.', 'Begin by flexing the knees slightly, and then flex at the hip, moving your butt back as far as possible, lowering the torso as far as flexibility allows. The back should remain in absolute extension at all times, and the bar should remain in contact with the legs. If done properly, there should be heavy tension felt in the hamstrings.', 'Reverse the motion to return to the starting position.']::TEXT[], 'Romanian_Deadlift_from_Deficit', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rope Climb', 'Lats', 'Back', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rope_Climb/0.jpg', ARRAY['Biceps', 'Forearms', 'Middle back', 'Shoulders']::TEXT[], ARRAY['Grab the rope with both hands above your head. Pull down on the rope as you take a small jump.', 'Wrap the rope around one leg, using your feet to pinch the rope. Reach up as high as possible with your arms, gripping the rope tightly.', 'Release the rope from your feet as you pull yourself up with your arms, bringing your knees towards your chest.', 'Resecure your feet on the rope, and then stand up to take another high hold on the rope. Continue until you reach the top of the rope.', 'To lower yourself, loosen the grip of your feet on the rope as you slide down using a hand over hand motion.']::TEXT[], 'Rope_Climb', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rope Crunch', 'Abdominals', 'Other', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rope_Crunch/0.jpg', NULL, ARRAY['Kneel 1-2 feet in front of a cable system with a rope attached.', 'After selecting an appropriate weight, grasp the rope with both hands reaching overhead. Your torso should be upright in the starting position.', 'To begin, flex at the spine, attempting to bring your rib cage to your legs as you pull the cable down.', 'Pause at the bottom of the motion, and then slowly return to the starting position.', 'These can be done with twists or to the side to hit the obliques.']::TEXT[], 'Rope_Crunch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rope Jumping', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rope_Jumping/0.jpg', ARRAY['Calves', 'Hamstrings']::TEXT[], ARRAY['Hold an end of the rope in each hand. Position the rope behind you on the ground. Raise your arms up and turn the rope over your head bringing it down in front of you. When it reaches the ground, jump over it. Find a good turning pace that can be maintained. Different speeds and techniques can be used to introduce variation.', 'Rope jumping is exciting, challenges your coordination, and requires a lot of energy. A 150 lb person will burn about 350 calories jumping rope for 30 minutes, compared to over 450 calories running.']::TEXT[], 'Rope_Jumping', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rope Straight-Arm Pulldown', 'Lats', 'Back', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rope_Straight-Arm_Pulldown/0.jpg', NULL, ARRAY['Attach a rope to a high pulley and make your weight selection. Stand a couple feet back from the pulley with your feet staggered and take the rope with both hands. Lean forward from the hip, keeping your back straight, with your arms extended up in front of you. This will be your starting position.', 'Keeping your arms straight, extend the shoulder to pull the rope down to your thighs.', 'Pause at the bottom of the motion, squeezing your lats.', 'Return to the starting position without allowing the weight to fully rest on the stack.']::TEXT[], 'Rope_Straight-Arm_Pulldown', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Round The World Shoulder Stretch', 'Shoulders', 'Shoulders', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Round_The_World_Shoulder_Stretch/0.jpg', ARRAY['Biceps', 'Chest']::TEXT[], ARRAY['Stand up straight with your legs together, holding a bodybar or broomstick.', 'Hold the pole behind your hips with a wider than shoulder width grip. Your palms should be down and your thumbs facing out.', 'Slowly lift your arms up behind your head. Don''t force it if it gets hard to lift further.']::TEXT[], 'Round_The_World_Shoulder_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Rowing, Stationary', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Rowing_Stationary/0.jpg', ARRAY['Biceps', 'Calves', 'Glutes', 'Hamstrings', 'Lower back', 'Middle back']::TEXT[], ARRAY['To begin, seat yourself on the rower. Make sure that your heels are resting comfortably against the base of the foot pedals and that the straps are secured. Select the program that you wish to use, if applicable. Sit up straight and bend forward at the hips.', 'There are three phases of movement when using a rower. The first phase is when you come forward on the rower. Your knees are bent and against your chest. Your upper body is leaning slightly forward while still maintaining good posture. Next, push against the foot pedals and extend your legs while bringing your hands to your upper abdominal area, squeezing your shoulders back as you do so. To avoid straining your back, use primarily your leg and hip muscles.', 'The recovery phase simply involves straightening your arms, bending the knees, and bringing your body forward again as you transition back into the first phase.']::TEXT[], 'Rowing_Stationary', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Runner''s Stretch', 'Hamstrings', 'Hamstrings', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Runners_Stretch/0.jpg', ARRAY['Calves']::TEXT[], ARRAY['It''s easiest to get into this stretch if you start standing up, put one leg behind you, and slowly lower your torso down to the floor.', 'Keep the front heel on the floor (if it lifts up, scoot your other leg further back).', 'Place your hands on either side of your front leg. To get more out of this stretch, push your butt up toward the ceiling, and then gradually lower it back toward the floor. You''ll Stretch the hip flexor of the back leg and the hamstring and buttocks of the front.']::TEXT[], 'Runners_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Running, Treadmill', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Running_Treadmill/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['To begin, step onto the treadmill and select the desired option from the menu. Most treadmills have a manual setting, or you can select a program to run. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise. Elevation can be adjusted to change the intensity of the workout.', 'Treadmills offer convenience, cardiovascular benefits, and usually have less impact than running outside. A 150 lb person will burn over 450 calories running 8 miles per hour for 30 minutes. Maintain proper posture as you run, and only hold onto the handles when necessary, such as when dismounting or checking your heart rate.']::TEXT[], 'Running_Treadmill', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Russian Twist', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Russian_Twist/0.jpg', ARRAY['Lower back']::TEXT[], ARRAY['Lie down on the floor placing your feet either under something that will not move or by having a partner hold them. Your legs should be bent at the knees.', 'Elevate your upper body so that it creates an imaginary V-shape with your thighs. Your arms should be fully extended in front of you perpendicular to your torso and with the hands clasped. This is the starting position.', 'Twist your torso to the right side until your arms are parallel with the floor while breathing out.', 'Hold the contraction for a second and move back to the starting position while breathing out. Now move to the opposite side performing the same techniques you applied to the right side.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Russian_Twist', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sandbag Load', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sandbag_Load/0.jpg', ARRAY['Abdominals', 'Biceps', 'Calves', 'Forearms', 'Glutes', 'Hamstrings', 'Lower back', 'Middle back', 'Shoulders', 'Traps']::TEXT[], ARRAY['To load sandbags or other objects, begin with the implements placed a distance from the loading platform, typically 50 feet.', 'Begin by lifting the sandbag. Sandbags are extremely awkward, and the manner of lifting them can vary depending on the particular sandbag used. Reach as far around it as possible, extending through the hips and knees to pull it up high. Shouldering is usually not allowed.', 'Move as quickly as possible to the platform, and load it, extending through your hips, knees, and ankles to get it as high as possible. Place it onto the platform, ensuring it doesn''t fall off.', 'Return to the starting position to retrieve the next sandbag, and repeat until the event is completed.']::TEXT[], 'Sandbag_Load', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Scapular Pull-Up', 'Traps', 'Back', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Scapular_Pull-Up/0.jpg', ARRAY['Lats', 'Middle back']::TEXT[], ARRAY['Take a pronated grip on a pull-up bar.', 'From a hanging position, raise yourself a few inches without using your arms. Do this by depressing your shoulder girdle in a reverse shrugging motion.', 'Pause at the completion of the movement, and then slowly return to the starting position before performing more repetitions.']::TEXT[], 'Scapular_Pull-Up', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Scissor Kick', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Scissor_Kick/0.jpg', NULL, ARRAY['To begin, lie down with your back pressed against the floor or on an exercise mat (optional). Your arms should be fully extended to the sides with your palms facing down. Note: The arms should be stationary the entire time.', 'With a slight bend at the knees, lift your legs up so that your heels are about 6 inches off the ground. This is the starting position.', 'Now lift your left leg up to about a 45 degree angle while your right leg is lowered until the heel is about 2-3 inches from the ground.', 'Switch movements by raising your right leg up and lowering your left leg. Remember to breathe while performing this exercise.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Scissor_Kick', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Scissors Jump', 'Quadriceps', 'Quads', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Scissors_Jump/0.jpg', ARRAY['Glutes', 'Hamstrings']::TEXT[], ARRAY['Assume a lunge stance position with one foot forward with the knee bent, and the rear knee nearly touching the ground.', 'Ensure that the front knee is over the midline of the foot. Extending through both legs, jump as high as possible, swinging your arms to gain lift.', 'As you jump as high as you can, switch the position of your legs, moving your front leg to the back and the rear leg to the front.', 'As you land, absorb the impact through the legs by adopting the lunge position, and repeat.']::TEXT[], 'Scissors_Jump', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Band Hamstring Curl', 'Hamstrings', 'Hamstrings', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Band_Hamstring_Curl/0.jpg', NULL, ARRAY['Secure a band close to the ground and place a bench a couple feet away from it.', 'Seat yourself on the bench and secure the band behind your ankles, beginning with your legs straight. This will be your starting position.', 'Flex the knees, bringing your feet towards the bench. You may need to lean back slightly to keep your feet from striking the floor.', 'Pause at the completion of the movement, and then slowly return to the starting position.']::TEXT[], 'Seated_Band_Hamstring_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Barbell Military Press', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Barbell_Military_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Sit on a Military Press Bench with a bar behind your head and either have a spotter give you the bar (better on the rotator cuff this way) or pick it up yourself carefully with a pronated grip (palms facing forward). Tip: Your grip should be wider than shoulder width and it should create a 90-degree angle between the forearm and the upper arm as the barbell goes down.', 'Once you pick up the barbell with the correct grip length, lift the bar up over your head by locking your arms. Hold at about shoulder level and slightly in front of your head. This is your starting position.', 'Lower the bar down to the collarbone slowly as you inhale.', 'Lift the bar back up to the starting position as you exhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Barbell_Military_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Barbell Twist', 'Abdominals', 'Other', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Barbell_Twist/0.jpg', NULL, ARRAY['Start out by sitting at the end of a flat bench with a barbell placed on top of your thighs. Your feet should be shoulder width apart from each other.', 'Grip the bar with your palms facing down and make sure your hands are wider than shoulder width apart from each other. Begin to lift the barbell up over your head until your arms are fully extended.', 'Now lower the barbell behind your head until it is resting along the base of your neck. This is the starting position.', 'While keeping your feet and head stationary, move your waist from side to side so that your oblique muscles feel the contraction. Only move from side to side as far as your waist will allow you to go. Stretching or moving too far can cause an injury to occur. Tip: Use a slow and controlled motion.', 'Remember to breathe out while twisting your body to the side and in when moving back to the starting position.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Barbell_Twist', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Bent-Over One-Arm Dumbbell Triceps Extension', 'Triceps', 'Triceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Bent-Over_One-Arm_Dumbbell_Triceps_Extension/0.jpg', NULL, ARRAY['Sit down at the end of a flat bench with a dumbbell in one arm using a neutral grip (palms of the hand facing you).', 'Bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Make sure that you keep the head up.', 'The upper arm with the dumbbell should be close to the torso and aligned with it (lifted up until it is parallel to the floor while the forearms are pointing towards the floor as the hands hold the weights). Tip: There should be a 90-degree angle between the forearms and the upper arm. This is your starting position.', 'Keeping the upper arm stationary, use the triceps to lift the weight as you exhale until the forearm is parallel to the floor and the whole arm is extended. Like many other arm exercises, only the forearm moves.', 'After a second contraction at the top, slowly lower the dumbbell back to the starting position as you inhale.', 'Repeat the movement for the prescribed amount of repetitions.', 'Switch arms and repeat the exercise.']::TEXT[], 'Seated_Bent-Over_One-Arm_Dumbbell_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Bent-Over Rear Delt Raise', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Bent-Over_Rear_Delt_Raise/0.jpg', NULL, ARRAY['Place a couple of dumbbells looking forward in front of a flat bench.', 'Sit on the end of the bench with your legs together and the dumbbells behind your calves.', 'Bend at the waist while keeping the back straight in order to pick up the dumbbells. The palms of your hands should be facing each other as you pick them. This will be your starting position.', 'Keeping your torso forward and stationary, and the arms slightly bent at the elbows, lift the dumbbells straight to the side until both arms are parallel to the floor. Exhale as you lift the weights. (Note: avoid swinging the torso or bringing the arms back as opposed to the side.)', 'After a one second contraction at the top, slowly lower the dumbbells back to the starting position.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Bent-Over_Rear_Delt_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Bent-Over Two-Arm Dumbbell Triceps Extension', 'Triceps', 'Triceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Bent-Over_Two-Arm_Dumbbell_Triceps_Extension/0.jpg', NULL, ARRAY['Sit down at the end of a flat bench with a dumbbell in both arms using a neutral grip (palms of the hand facing you).', 'Bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Make sure that you keep the head up.', 'The upper arms with the dumbbells should be close to the torso and aligned with it (lifted up until they are parallel to the floor while the forearms are pointing towards the floor as the hands hold the weights). Tip: There should be a 90-degree angle between the forearms and the upper arm. This is your starting position.', 'Keeping the upper arms stationary, use the triceps to lift the weight as you exhale until the forearms are parallel to the floor and the whole arm is extended. Like many other arm exercises, only the forearm moves.', 'After a second contraction at the top, slowly lower the dumbbells back to the starting position as you inhale.', 'Repeat the movement for the prescribed amount of repetitions.']::TEXT[], 'Seated_Bent-Over_Two-Arm_Dumbbell_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Biceps', 'Biceps', 'Biceps', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Biceps/0.jpg', ARRAY['Chest', 'Shoulders']::TEXT[], ARRAY['Sit on the floor with your knees bent and your partner standing behind you. Extend your arms straight behind you with your palms facing each other. Your partner will hold your wrists for you. This will be the starting position.', 'Attempt to flex your elbows, while your partner prevents any actual movement.', 'After 10-20 seconds, relax your arms while your partner gently pulls your wrists up to stretch your biceps. Be sure to let your partner know when the stretch is appropriate to prevent injury or overstretching.']::TEXT[], 'Seated_Biceps', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Cable Rows', 'Middle back', 'Back', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Cable_Rows/0.jpg', ARRAY['Biceps', 'Lats', 'Shoulders']::TEXT[], ARRAY['For this exercise you will need access to a low pulley row machine with a V-bar. Note: The V-bar will enable you to have a neutral grip where the palms of your hands face each other. To get into the starting position, first sit down on the machine and place your feet on the front platform or crossbar provided making sure that your knees are slightly bent and not locked.', 'Lean over as you keep the natural alignment of your back and grab the V-bar handles.', 'With your arms extended pull back until your torso is at a 90-degree angle from your legs. Your back should be slightly arched and your chest should be sticking out. You should be feeling a nice stretch on your lats as you hold the bar in front of you. This is the starting position of the exercise.', 'Keeping the torso stationary, pull the handles back towards your torso while keeping the arms close to it until you touch the abdominals. Breathe out as you perform that movement. At that point you should be squeezing your back muscles hard. Hold that contraction for a second and slowly go back to the original position while breathing in.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Cable_Rows', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Cable Shoulder Press', 'Shoulders', 'Shoulders', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Cable_Shoulder_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Adjust the weight to an appropriate amount and be seated, grasping the handles. Your upper arms should be about 90 degrees to the body, with your head and chest up. The elbows should also be bent to about 90 degrees. This will be your starting position.', 'Begin by extending through the elbow, pressing the handles together above your head.', 'After pausing at the top, return the handles to the starting position. Ensure that you maintain tension on the cables.', 'You can also execute this movement with your back off the pad and alternate hands.']::TEXT[], 'Seated_Cable_Shoulder_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Calf Raise', 'Calves', 'Calves', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Calf_Raise/0.jpg', NULL, ARRAY['Sit on the machine and place your toes on the lower portion of the platform provided with the heels extending off. Choose the toe positioning of your choice (forward, in, or out) as per the beginning of this chapter.', 'Place your lower thighs under the lever pad, which will need to be adjusted according to the height of your thighs. Now place your hands on top of the lever pad in order to prevent it from slipping forward.', 'Lift the lever slightly by pushing your heels up and release the safety bar. This will be your starting position.', 'Slowly lower your heels by bending at the ankles until the calves are fully stretched. Inhale as you perform this movement.', 'Raise the heels by extending the ankles as high as possible as you contract the calves and breathe out. Hold the top contraction for a second.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Calf_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Calf Stretch', 'Calves', 'Calves', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Calf_Stretch/0.jpg', ARRAY['Hamstrings', 'Lower back']::TEXT[], ARRAY['Sit up straight on an exercise mat.', 'Bend one knee and put that foot on the floor to stabilize the torso.', 'Straighten your other leg and flex your ankle.', 'Using a band, towel, or your hand if you can reach, pull the toes toward you. Hold for 10 to 20 seconds, then switch sides.']::TEXT[], 'Seated_Calf_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Close-Grip Concentration Barbell Curl', 'Biceps', 'Biceps', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Close-Grip_Concentration_Barbell_Curl/0.jpg', NULL, ARRAY['Sit down on a flat bench with a barbell or E-Z Bar in front of you in between your legs. Your legs should be spread with the knees bent and the feet on the floor.', 'Use your arms to pick the barbell up and place the back of your upper arms on top of your inner thighs (around three and a half inches away from the front of the knee). A supinated grip closer than shoulder width is needed to perform this exercise. Tip: Your arm should be extended at arms length and the barbell should be above the floor. This will be your starting position.', 'While holding the upper arms stationary, curl the weights forward while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a second as you squeeze the biceps.', 'Slowly begin to bring the barbell back to starting position as your breathe in. Tip: Avoid swinging motions at any time.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Close-Grip_Concentration_Barbell_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Dumbbell Curl', 'Biceps', 'Biceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Dumbbell_Curl/0.jpg', NULL, ARRAY['Sit on a flat bench with a dumbbell on each hand being held at arms length. The elbows should be close to the torso.', 'Rotate the palms of the hands so that they are facing your torso. This will be your starting position.', 'While holding the upper arm stationary, curl the weights and start twisting the wrists once the dumbbells pass your thighs so that the palms of your hands face forward at the end of the movement. Make sure that you contract the biceps as you breathe out and make sure that only the forearms move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a second as you squeeze the biceps.', 'Slowly begin to bring the dumbbells back to the starting position as your breathe in and as you rotate the wrists back to a neutral grip.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Dumbbell_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Dumbbell Inner Biceps Curl', 'Biceps', 'Biceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Dumbbell_Inner_Biceps_Curl/0.jpg', NULL, ARRAY['Sit on the end of a flat bench with a dumbbell in each hand being held at arms length. The elbows should be close to the torso.', 'Rotate the palms of the hands so that they are facing inward in a neutral position. This will be your starting position.', 'While holding the upper arms stationary, curl the dumbbells out and up, turning the palms out as you lift and keeping your forearms in line with your outer deltoids. Tips:', 'Only the forearms should move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a second as you squeeze the biceps.', 'Slowly begin to bring the dumbbells back to the starting position as your breathe in. Remember to rotate your arms as you lower the dumbbells so that you can switch back to a neutral grip.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Dumbbell_Inner_Biceps_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Dumbbell Palms-Down Wrist Curl', 'Forearms', 'Arms', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Dumbbell_Palms-Down_Wrist_Curl/0.jpg', NULL, ARRAY['Start out by placing two dumbbells on the floor in front of a flat bench.', 'Sit down on the edge of the flat bench with your legs at about shoulder width apart. Make sure to keep your feet on the floor.', 'Use your arms to grab both of the dumbbells and bring them up so that your forearms are resting against your thighs with the palms of the hands facing down. Your wrists should be hanging over the edge of your thighs.', 'Start out by curling your wrist upwards and exhaling.', 'Slowly lower your wrists back down to the starting position while inhaling. Make sure to inhale during this part of the exercise. Tip: Your forearms should be stationary as your wrist is the only movement needed to perform this exercise.', 'Repeat for the recommended amount of repetitions.', 'When finished, simply lower the dumbbells to the floor.']::TEXT[], 'Seated_Dumbbell_Palms-Down_Wrist_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Dumbbell Palms-Up Wrist Curl', 'Forearms', 'Arms', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Dumbbell_Palms-Up_Wrist_Curl/0.jpg', NULL, ARRAY['Start out by placing two dumbbells on the floor in front of a flat bench.', 'Sit down on the edge of the flat bench with your legs at about shoulder width apart. Make sure to keep your feet on the floor.', 'Use your arms to grab both of the dumbbells and bring them up so that your forearms are resting against your thighs with the palms of the hands facing up. Your wrists should be hanging over the edge of your thighs.', 'Start out by curling your wrist upwards and exhaling.', 'Slowly lower your wrists back down to the starting position while inhaling. Make sure to inhale during this part of the exercise. Tip: Your forearms should be stationary as your wrist is the only movement needed to perform this exercise.', 'Repeat for the recommended amount of repetitions.', 'When finished, simply lower the dumbbells to the floor.']::TEXT[], 'Seated_Dumbbell_Palms-Up_Wrist_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Dumbbell Press', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Dumbbell_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Grab a couple of dumbbells and sit on a military press bench or a utility bench that has a back support on it as you place the dumbbells upright on top of your thighs.', 'Clean the dumbbells up one at a time by using your thighs to bring the dumbbells up to shoulder height at each side.', 'Rotate the wrists so that the palms of your hands are facing forward. This is your starting position.', 'As you exhale, push the dumbbells up until they touch at the top.', 'After a second pause, slowly come down back to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Dumbbell_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Flat Bench Leg Pull-In', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Flat_Bench_Leg_Pull-In/0.jpg', NULL, ARRAY['Sit on a bench with the legs stretched out in front of you slightly below parallel and your arms holding on to the sides of the bench. Your torso should be leaning backwards around a 45-degree angle from the bench. This will be your starting position.', 'Bring the knees in toward you as you move your torso closer to them at the same time. Breathe out as you perform this movement.', 'After a second pause, go back to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Flat_Bench_Leg_Pull-In', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Floor Hamstring Stretch', 'Hamstrings', 'Hamstrings', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Floor_Hamstring_Stretch/0.jpg', ARRAY['Calves']::TEXT[], ARRAY['Sit on a mat with your right leg extended in front of you and your left leg bent with your foot against your right inner thigh.', 'Lean forward from your hips and reach for your ankle until you feel a stretch in your hamstring. Hold for 15 seconds, then repeat for your other side.']::TEXT[], 'Seated_Floor_Hamstring_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Front Deltoid', 'Shoulders', 'Shoulders', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Front_Deltoid/0.jpg', ARRAY['Chest']::TEXT[], ARRAY['Sit upright on the floor with your legs bent, your partner standing behind you. Stick your arms straight out to your sides, with your palms facing the ground. Attempt to move them as far behind you as possible, as your assistant holds your wrists. This will be your starting position.', 'Keeping your elbows straight, attempt to move your arms to the front, with your partner gently restraining you to prevent any actual movement for 10-20 seconds.', 'Now, relax your muscles and allow your partner to gently increase the stretch on the shoulders and chest. Hold for 10 to 20 seconds.']::TEXT[], 'Seated_Front_Deltoid', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Glute', 'Glutes', 'Legs', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Glute/0.jpg', ARRAY['Adductors']::TEXT[], ARRAY['In a seated position with your knees bent, cross one ankle over the opposite knee. Your partner will stand behind you. Now, lean forward as your partner braces your shoulders with their hands. This will be your starting position.', 'Attempt to push your torso back for 10-20 seconds, as your partner prevents any actual movement of your torso.', 'Now relax your muscles as your partner increases the stretch by gently pushing your torso forward for 10-20 seconds.']::TEXT[], 'Seated_Glute', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Good Mornings', 'Lower back', 'Back', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Good_Mornings/0.jpg', ARRAY['Glutes']::TEXT[], ARRAY['Set up a box in a power rack. The pins should be set at an appropriate height. Begin by stepping under the bar and placing it across the back of the shoulders, not on top of your traps. Squeeze your shoulder blades together and rotate your elbows forward, attempting to bend the bar across your shoulders.', 'Remove the bar from the rack, creating a tight arch in your lower back. Keep your head facing forward. With your back, shoulders, and core tight, push your knees and butt out and you begin your descent. Sit back with your hips until you are seated on the box. This will be your starting position.', 'Keeping the bar tight, bend forward at the hips as much as possible. If you set the pins to what would be parallel, you not only have a safety if you fail, but know when to stop.', 'Pause just above the pins and reverse the motion until your torso it upright.']::TEXT[], 'Seated_Good_Mornings', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Hamstring', 'Hamstrings', 'Hamstrings', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Hamstring/0.jpg', ARRAY['Calves']::TEXT[], ARRAY['In a seated position with your legs extended, have your partner stand behind you. Now, lean forward as your partner braces your shoulders with their hands. This will be your starting position.', 'Attempt to push your torso back for 10-20 seconds, as your partner prevents any actual movement of your torso.', 'Now relax your muscles as your partner increases the stretch by gently pushing your torso forward for 10-20 seconds.']::TEXT[], 'Seated_Hamstring', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Hamstring and Calf Stretch', 'Hamstrings', 'Hamstrings', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Hamstring_and_Calf_Stretch/0.jpg', ARRAY['Calves']::TEXT[], ARRAY['Loop a belt, rope, or band around one foot. Sit down with both legs extended . This will be your starting position.', 'Leaning forward slightly, pull on the belt to draw the toes of your foot back. Hold this position for 10-20 seconds and then repeat with the other leg.']::TEXT[], 'Seated_Hamstring_and_Calf_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Head Harness Neck Resistance', 'Neck', 'Other', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Head_Harness_Neck_Resistance/0.jpg', NULL, ARRAY['Place a neck strap on the floor at the end of a flat bench. Once you have selected the weights, sit at the end of the flat bench with your feet wider than shoulder width apart from each other. Your toes should be pointed out.', 'Slowly move your torso forward until it is almost parallel with the floor. Using both hands, securely position the neck strap around your head. Tip: Make sure the weights are still lying on the floor to prevent any strain on the neck. Now grab the weight with both hands while elevating your torso back until it is almost perpendicular to the floor. Note: Your head and torso needs to be slightly tilted forward to perform this exercise.', 'Now place both hands on top of your knees. This is the starting position.', 'Slowly lower your neck down until your chin touches the upper part of your chest while breathing in.', 'While exhaling, bring your neck back to the starting position.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Head_Harness_Neck_Resistance', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Leg Curl', 'Hamstrings', 'Hamstrings', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Leg_Curl/0.jpg', NULL, ARRAY['Adjust the machine lever to fit your height and sit on the machine with your back against the back support pad.', 'Place the back of lower leg on top of padded lever (just a few inches under the calves) and secure the lap pad against your thighs, just above the knees. Then grasp the side handles on the machine as you point your toes straight (or you can also use any of the other two stances) and ensure that the legs are fully straight right in front of you. This will be your starting position.', 'As you exhale, pull the machine lever as far as possible to the back of your thighs by flexing at the knees. Keep your torso stationary at all times. Hold the contracted position for a second.', 'Slowly return to the starting position as you breathe in.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Leg_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Leg Tucks', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Leg_Tucks/0.jpg', NULL, ARRAY['Sit on a bench with the legs stretched out in front of you slightly below parallel and your arms holding on to the sides of the bench. Your torso should be leaning backwards around a 45-degree angle from the bench. This will be your starting position.', 'Bring the knees in toward you as you move your torso closer to them at the same time. Breathe out as you perform this movement.', 'After a second pause, go back to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Leg_Tucks', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated One-Arm Dumbbell Palms-Down Wrist Curl', 'Forearms', 'Arms', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_One-Arm_Dumbbell_Palms-Down_Wrist_Curl/0.jpg', NULL, ARRAY['Sit on a flat bench with a dumbbell in your right hand.', 'Place your feet flat on the floor, at a distance that is slightly wider than shoulder width apart.', 'Lean forward and place your right forearm on top of your upper right thigh with your palm down. Tip: Make sure that the back of the wrist lies on top of your knees. This will be your starting position.', 'Lower the dumbbell as far as possible as you keep a tight grip on the dumbbell. Inhale as you perform this movement.', 'Now curl the dumbbell as high as possible as you contract the forearms and as you exhale. Keep the contraction for a second before you lower again. Tip: The only movement should happen at the wrist.', 'Perform for the recommended amount of repetitions, switch arms and repeat the movement.']::TEXT[], 'Seated_One-Arm_Dumbbell_Palms-Down_Wrist_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated One-Arm Dumbbell Palms-Up Wrist Curl', 'Forearms', 'Arms', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_One-Arm_Dumbbell_Palms-Up_Wrist_Curl/0.jpg', NULL, ARRAY['Sit on a flat bench with a dumbbell in your right hand.', 'Place your feet flat on the floor, at a distance that is slightly wider than shoulder width apart.', 'Lean forward and place your right forearm on top of your upper right thigh with your palm up. Tip: Make sure that the front of the wrist lies on top of your knees. This will be your starting position.', 'Lower the dumbbell as far as possible as you keep a tight grip on the dumbbell. Inhale as you perform this movement.', 'Now curl the dumbbell as high as possible as you contract the forearms and as you exhale. Keep the contraction for a second before you lower again. Tip: The only movement should happen at the wrist.', 'Perform for the recommended amount of repetitions, switch arms and repeat the movement.']::TEXT[], 'Seated_One-Arm_Dumbbell_Palms-Up_Wrist_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated One-arm Cable Pulley Rows', 'Middle back', 'Back', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_One-arm_Cable_Pulley_Rows/0.jpg', ARRAY['Biceps', 'Lats', 'Traps']::TEXT[], ARRAY['To get into the starting position, first sit down on the machine and place your feet on the front platform or crossbar provided making sure that your knees are slightly bent and not locked.', 'Lean over as you keep the natural alignment of your back and grab the single handle attachment with your left arm using a palms-down grip.', 'With your arm extended pull back until your torso is at a 90-degree angle from your legs. Your back should be slightly arched and your chest should be sticking out. You should be feeling a nice stretch on your lat as you hold the bar in front of you. The right arm can be kept by the waist. This is the starting position of the exercise.', 'Keeping the torso stationary, pull the handles back towards your torso while keeping the arms close to it as you rotate the wrist, so that by the time your hand is by your abdominals it is in a neutral position (palms facing the torso). Breathe out as you perform that movement. At that point you should be squeezing your back muscles hard.', 'Hold that contraction for a second and slowly go back to the original position while breathing in. Tip: Remember to rotate the wrist as you go back to the starting position so that the palms are facing down again.', 'Repeat for the recommended amount of repetitions and then perform the same movement with the right hand.']::TEXT[], 'Seated_One-arm_Cable_Pulley_Rows', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Overhead Stretch', 'Abdominals', 'Other', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Overhead_Stretch/0.jpg', NULL, ARRAY['Sit up straight on an exercise mat.', 'Touch the soles of your feet together with your feet six to eight inches in front of your hips.', 'Place one hand on the floor beside you and your other hand behind your head.', 'Lift your elbow to the ceiling as you incline your torso to the other side. Hold for 10 to 20 seconds, then switch sides.']::TEXT[], 'Seated_Overhead_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Palm-Up Barbell Wrist Curl', 'Forearms', 'Arms', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Palm-Up_Barbell_Wrist_Curl/0.jpg', NULL, ARRAY['Hold a barbell with both hands and your palms facing up; hands spaced about shoulder width.', 'Place your feet flat on the floor, at a distance that is slightly wider than shoulder width apart.', 'Lean forward and place your forearms on top of your upper thighs with your palms up. Tip: Make sure that the front of the wrists lay on top of your knees. This will be your starting position.', 'Lower the bar as far as possible while inhaling and keeping a tight grip.', 'Now curl bar up as high as possible while flexing the forearms and exhaling. Hold the contraction at the top for a second and Tip: Only the wrist should move.']::TEXT[], 'Seated_Palm-Up_Barbell_Wrist_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Palms-Down Barbell Wrist Curl', 'Forearms', 'Arms', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Palms-Down_Barbell_Wrist_Curl/0.jpg', NULL, ARRAY['Hold a barbell with both hands and your palms facing down; hands spaced about shoulder width.', 'Place your feet flat on the floor, at a distance that is slightly wider than shoulder width apart.', 'Lean forward and place your forearms on top of your upper thighs with your palms down. Tip: Make sure that the back of the wrists lay on top of your knees. This will be your starting position.', 'Lower the bar as far as possible while inhaling and keeping a tight grip.', 'Now curl bar up as high as possible while flexing the forearms and exhaling. Hold the contraction at the top for a second and Tip: Only the wrist should move.']::TEXT[], 'Seated_Palms-Down_Barbell_Wrist_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Side Lateral Raise', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Side_Lateral_Raise/0.jpg', NULL, ARRAY['Pick a couple of dumbbells and sit at the end of a flat bench with your feet firmly on the floor. Hold the dumbbells with your palms facing in and your arms straight down at your sides at arms'' length. This will be your starting position.', 'While maintaining the torso stationary (no swinging), lift the dumbbells to your side with a slight bend on the elbow and the hands slightly tilted forward as if pouring water in a glass. Continue to go up until you arms are parallel to the floor. Exhale as you execute this movement and pause for a second at the top.', 'Lower the dumbbells back down slowly to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Side_Lateral_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Triceps Press', 'Triceps', 'Triceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Triceps_Press/0.jpg', NULL, ARRAY['Sit down on a bench with back support and grasp a dumbbell with both hands and hold it overhead at arm''s length. Tip: a better way is to have somebody hand it to you especially if it is very heavy. The resistance should be resting in the palms of your hands with your thumbs around it. The palm of the hand should be facing inward. This will be your starting position.', 'Keeping your upper arms close to your head (elbows in) and perpendicular to the floor, lower the resistance in a semi-circular motion behind your head until your forearms touch your biceps. Tip: The upper arms should remain stationary and only the forearms should move. Breathe in as you perform this step.', 'Go back to the starting position by using the triceps to raise the dumbbell. Breathe out as you perform this step.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Triceps_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Seated Two-Arm Palms-Up Low-Pulley Wrist Curl', 'Forearms', 'Arms', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Seated_Two-Arm_Palms-Up_Low-Pulley_Wrist_Curl/0.jpg', NULL, ARRAY['Put a bench in front of a low pulley machine that has a barbell or EZ Curl attachment on it.', 'Move the bench far enough away so that when you bring the handle to the top of your thighs tension is created on the cable due to the weight stack being moved up.', 'Now hold the handle with both hands, palms up, using a shoulder-width grip.', 'Step back and sit on the bench with your feet about shoulder width apart, firmly on the floor.', 'Lean forward and place the forearms on your thighs with the back of your wrists over your knees. This will be your starting position.', 'Lower the bar as far as possible, while inhaling and keeping a tight grip.', 'Now curl the bar up as high as possible while contracting the forearms. Tip: Only the wrist should move; not the forearms.', 'After a second contraction at the top go back to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Seated_Two-Arm_Palms-Up_Low-Pulley_Wrist_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('See-Saw Press (Alternating Side Press)', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/See-Saw_Press_Alternating_Side_Press/0.jpg', ARRAY['Abdominals', 'Triceps']::TEXT[], ARRAY['Grab a dumbbell with each hand and stand up erect.', 'Clean (lift) the dumbbells to the chest/shoulder level and then rotate your wrists so that your palms are facing towards you as if you were getting ready to perform an Arnold Press. This will be your starting position.', 'Now start extending your left arm overhead as you rotate the wrist so that the palm of your hand faces forward as you go up. Your elbows should come out also as you lift the weight. Simultaneously, you will also be bending from your hip to your opposite side. Tip: If you perform the exercise correctly, is should look as if you are trying to reach for something overhead on the right hand side of your body, but with your left arm. Breathe out as you perform this movement.', 'Once you reach the top position breathe in. Then, with the weight fully extended overhead and you bent over to your right hand side, begin the movement to the left side.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'See-Saw_Press_Alternating_Side_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Shotgun Row', 'Lats', 'Back', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Shotgun_Row/0.jpg', ARRAY['Biceps', 'Middle back']::TEXT[], ARRAY['Attach a single handle to a low cable.', 'After selecting the correct weight, stand a couple feet back with a wide-split stance. Your arm should be extended and your shoulder forward. This will be your starting position.', 'Perform the movement by retracting the shoulder and flexing the elbow. As you pull, supinate the wrist, turning the palm upward as you go.', 'After a brief pause, return to the starting position.']::TEXT[], 'Shotgun_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Shoulder Circles', 'Shoulders', 'Shoulders', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Shoulder_Circles/0.jpg', ARRAY['Traps']::TEXT[], ARRAY['With shoulders relaxed and arms resting loosely at your sides (or in your lap if you''re seated), gently roll your shoulders forward, up, back, and down.', 'Reverse direction. You can do this exercise alternating shoulders or both at the same time.']::TEXT[], 'Shoulder_Circles', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Shoulder Press - With Bands', 'Shoulders', 'Shoulders', 'Bands', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Shoulder_Press_-_With_Bands/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['To begin, stand on an exercise band so that tension begins at arm''s length. Grasp the handles and lift them so that the hands are at shoulder height at each side.', 'Rotate the wrists so that the palms of your hands are facing forward. Your elbows should be bent, with the upper arms and forearms in line to the torso. This is your starting position.', 'As you exhale, lift the handles up until your arms are fully extended overhead.']::TEXT[], 'Shoulder_Press_-_With_Bands', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Shoulder Raise', 'Shoulders', 'Shoulders', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Shoulder_Raise/0.jpg', ARRAY['Lats']::TEXT[], ARRAY['Relax your arms to your sides and raise your shoulders up toward your ears, then back down.']::TEXT[], 'Shoulder_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Shoulder Stretch', 'Shoulders', 'Shoulders', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Shoulder_Stretch/0.jpg', NULL, ARRAY['Reach your left arm across your body and hold it straight.']::TEXT[], 'Shoulder_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side-Lying Floor Stretch', 'Lats', 'Back', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side-Lying_Floor_Stretch/0.jpg', NULL, ARRAY['First lie on your left side, bending your left knee in front of you to stabilize your torso (use your abdominal muscles as well to hold you upright).', 'Straighten your right leg and rest the right foot on the floor behind your left. Straighten your right arm over your head and gently pull on your right wrist to stretch the entire right side of the body. Switch sides.']::TEXT[], 'Side-Lying_Floor_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side Bridge', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_Bridge/0.jpg', ARRAY['Shoulders']::TEXT[], NULL, 'Side_Bridge', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side Hop-Sprint', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_Hop-Sprint/0.jpg', ARRAY['Abductors', 'Adductors', 'Calves', 'Hamstrings']::TEXT[], ARRAY['Stand to the side of a cone or hurdle.', 'Begin this drill by hopping sideways over the obstacle, rebounding out of your landing to hop back to where you started.', 'Hop for a prescribed number or repetitions as quickly as possible, and finish this drill by sprinting a short distance upon landing the last hop.']::TEXT[], 'Side_Hop-Sprint', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side Jackknife', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_Jackknife/0.jpg', NULL, NULL, 'Side_Jackknife', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side Lateral Raise', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_Lateral_Raise/0.jpg', NULL, ARRAY['Pick a couple of dumbbells and stand with a straight torso and the dumbbells by your side at arms length with the palms of the hand facing you. This will be your starting position.', 'While maintaining the torso in a stationary position (no swinging), lift the dumbbells to your side with a slight bend on the elbow and the hands slightly tilted forward as if pouring water in a glass. Continue to go up until you arms are parallel to the floor. Exhale as you execute this movement and pause for a second at the top.', 'Lower the dumbbells back down slowly to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Side_Lateral_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side Laterals to Front Raise', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_Laterals_to_Front_Raise/0.jpg', ARRAY['Traps']::TEXT[], ARRAY['In a standing position, hold a pair of dumbbells at your side. This will be your starting position.', 'Keeping your elbows slightly bent, raise the weights directly in front of you to shoulder height, avoiding any swinging or cheating.', 'At the top of the exercise move the weights out in front of you, keeping your arms extended.', 'Lower the weights with a controlled motion.', 'On the next repetition, raise the weights in front of you to shoulder height before moving the weights laterally to your sides.', 'Lower the weights to the starting position.']::TEXT[], 'Side_Laterals_to_Front_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side Leg Raises', 'Adductors', 'Legs', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_Leg_Raises/0.jpg', NULL, ARRAY['Stand next to a chair, which you may hold onto as a support. Stand on one leg. This will be your starting position.', 'Keeping your leg straight, raise it as far out to the side as possible, and swing it back down, allowing it to cross the opposite leg.', 'Repeat this swinging motion 5-10 times, increasing the range of motion as you do so.']::TEXT[], 'Side_Leg_Raises', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side Lying Groin Stretch', 'Adductors', 'Legs', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_Lying_Groin_Stretch/0.jpg', ARRAY['Hamstrings']::TEXT[], ARRAY['Start off by lying on your right side and bend your right knee in front of you to stabilize the torso.', 'Rest your head on your right hand or shoulder. Lift your left leg upward and hold it by the back of the knee (easier) or the foot (harder).', 'Pull your left knee in toward your left shoulder and simultaneously press your foot or knee down to the floor. To intensify this stretch, straighten your left leg. Switch sides.']::TEXT[], 'Side_Lying_Groin_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side Neck Stretch', 'Neck', 'Other', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_Neck_Stretch/0.jpg', NULL, ARRAY['Start with your shoulders relaxed, gently tilt your head towards your shoulder.', 'Assist stretch with a gentle pull on the side of the head.']::TEXT[], 'Side_Neck_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side Standing Long Jump', 'Quadriceps', 'Quads', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_Standing_Long_Jump/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Begin standing with your feet hip width apart in an athletic stance. Your head and chest should be up, knees and hips slightly bent. This will be your starting position.', 'Leaning to your right, extend through your hips, knees, and ankles to jump into the air. Block with the arms to lead the movement, jumping as far to your right as you can.', 'Land facing the same direction with your feet hip width apart, absorbing the impact through your lower body.']::TEXT[], 'Side_Standing_Long_Jump', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side To Side Chins', 'Lats', 'Back', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_To_Side_Chins/0.jpg', ARRAY['Biceps', 'Forearms', 'Middle back', 'Shoulders']::TEXT[], ARRAY['Grab the pull-up bar with the palms facing forward using a wide grip.', 'As you have both arms extended in front of you holding the bar at a wide grip, bring your torso back around 30 degrees or so while creating a curvature on your lower back and sticking your chest out. This is your starting position.', 'Pull your torso up while leaning to the left hand side until the bar almost touches your upper chest by drawing the shoulders and the upper arms down and back. Exhale as you perform this portion of the movement. Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. The upper torso should remain stationary as it moves through space (no swinging) and only the arms should move. The forearms should do no other work other than hold the bar.', 'After a second of contraction, inhale as you go back to the starting position.', 'Now, pull your torso up while leaning to the right hand side until the bar almost touches your upper chest by drawing the shoulders and the upper arms down and back. Exhale as you perform this portion of the movement. Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. The upper torso should remain stationary as it moves through space and only the arms should move. The forearms should do no other work other than hold the bar.', 'After a second of contraction, inhale as you go back to the starting position.', 'Repeat steps 3-6 until you have performed the prescribed amount of repetitions for each side.']::TEXT[], 'Side_To_Side_Chins', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side Wrist Pull', 'Shoulders', 'Shoulders', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_Wrist_Pull/0.jpg', ARRAY['Forearms', 'Lats']::TEXT[], ARRAY['This stretch works best standing. Cross your left arm over the midline of your body and hold the left wrist in your right hand down at the level of your hips. Start the stretch with a bent left arm.', 'Slowly straighten, pull, and lift it up to shoulder height, as pictured. Feel this stretch originate in your back, not your shoulders, and don''t pull too hard on the shoulders joint. Switch sides.']::TEXT[], 'Side_Wrist_Pull', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Side to Side Box Shuffle', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Side_to_Side_Box_Shuffle/0.jpg', ARRAY['Abductors', 'Adductors', 'Calves', 'Hamstrings']::TEXT[], ARRAY['Stand to one side of the box with your left foot resting on the middle of it.', 'To begin, jump up and over to the other side of the box, landing with your right foot on top of the box and your left foot on the floor. Swing your arms to aid your movement.', 'Continue shuffling back and forth across the box.']::TEXT[], 'Side_to_Side_Box_Shuffle', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single-Arm Cable Crossover', 'Chest', 'Chest', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single-Arm_Cable_Crossover/0.jpg', NULL, ARRAY['Begin by moving the pulleys to the high position, select the resistance to be used, and take a handle in each hand.', 'Step forward in front of both pulleys with your arms extended in front of you, bringing your hands together. Your head and chest should be up as you lean forward, while your feet should be staggered. This will be your starting position.', 'Keeping your left arm in place, allow your right arm to extend out to the side, maintaining a slight bend at the elbow. The right arm should be perpendicular to the body at approximately shoulder level.', 'Return your arm back to the starting position by pulling your hand back to the midline of the body.', 'Hold for a second at the starting position and repeat the movement on the opposite side. Continue alternating back and forth for the prescribed number of repetitions.']::TEXT[], 'Single-Arm_Cable_Crossover', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single-Arm Linear Jammer', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single-Arm_Linear_Jammer/0.jpg', ARRAY['Chest', 'Triceps']::TEXT[], ARRAY['Position a bar into a landmine or securely anchor it in a corner. Load the bar to an appropriate weight.', 'Raise the bar from the floor, taking it to your shoulders with one or both hands. Adopt a wide stance. This will be your starting position.', 'Perform the movement by extending the elbow, pressing the weight up. Move explosively, extending the hips and knees fully to produce maximal force.', 'Return to the starting position.']::TEXT[], 'Single-Arm_Linear_Jammer', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single-Arm Push-Up', 'Chest', 'Chest', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single-Arm_Push-Up/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Begin laying prone on the ground. Move yourself into a position supporting your weight on your toes and one arm. Your working arm should be placed directly under the shoulder, fully extended. Your legs should be extended, and for this movement you may need a wider base, placing your feet further apart than in a normal push-up.', 'Maintain good posture, and place your free hand behind your back. This will be your starting position.', 'Lower yourself by allowing the elbow to flex until you touch the ground.', 'Descend slowly, and reverse direction be extending the arm to return to the starting position.']::TEXT[], 'Single-Arm_Push-Up', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single-Cone Sprint Drill', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single-Cone_Sprint_Drill/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['This drill teaches quick foot action. You need a single cone. Begin standing next to the cone with one arm back and one arm forward.', 'Chop the feet as quickly as possible, blocking with the arms. Circle the cone, keep your knees up, with violent foot action.', 'Rest after three trips around the cone.']::TEXT[], 'Single-Cone_Sprint_Drill', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single-Leg High Box Squat', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single-Leg_High_Box_Squat/0.jpg', ARRAY['Glutes', 'Hamstrings']::TEXT[], ARRAY['Position a box in a rack. Secure a band or rope in place above the box.', 'Standing in front of it, step onto the box to a full standing position, letting your other leg remain unsupported. Hold onto the band for balance', '. Continue stepping up and down on the same leg before switching to the opposite side.']::TEXT[], 'Single-Leg_High_Box_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single-Leg Hop Progression', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single-Leg_Hop_Progression/0.jpg', ARRAY['Abductors', 'Adductors', 'Calves', 'Hamstrings']::TEXT[], ARRAY['Arrange a line of cones in front of you. Assume a relaxed standing position, balanced on one leg. Raise the knee of your opposite leg. This will be your starting position.', 'Hop forward, jumping and landing with the same leg over the cone.', 'Use a countermovement jump to hop from cone to cone.', 'At the end, turn around and go back on the other leg.']::TEXT[], 'Single-Leg_Hop_Progression', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single-Leg Lateral Hop', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single-Leg_Lateral_Hop/0.jpg', ARRAY['Abductors', 'Adductors', 'Calves', 'Hamstrings']::TEXT[], ARRAY['Stand to the side of a cone or hurdle. To get into the start position, stand on one leg with your knee slightly bent.', 'To begin, execute a counterjump to hop sideways over the cone.', 'Land on your jumping leg, and immediately rebound out of it by jumping back to the start position.', 'Continue hopping back and forth.']::TEXT[], 'Single-Leg_Lateral_Hop', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single-Leg Leg Extension', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single-Leg_Leg_Extension/0.jpg', NULL, ARRAY['Seat yourself in the machine and adjust it so that you are positioned properly. The pad should be against the lower part of the shin but not in contact with the ankle. Adjust the seat so that the pivot point is in line with your knee. Select a weight appropriate for your abilities.', 'Maintaining good posture, fully extend one leg, pausing at the top of the motion.', 'Return to the starting position without letting the weight stop, keeping tension on the muscle.', 'Repeat for the desired number of repetitions.']::TEXT[], 'Single-Leg_Leg_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single-Leg Stride Jump', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single-Leg_Stride_Jump/0.jpg', ARRAY['Abductors', 'Adductors', 'Calves', 'Hamstrings']::TEXT[], ARRAY['Stand to the side of a box with your inside foot on top of it, close to the edge.', 'Begin by swinging the arms upward as you push through the top leg, jumping upward as high as possible. Attempt to drive the opposite knee upward.', 'Land in the same position that you started, using your inside leg to decelerate the impact.']::TEXT[], 'Single-Leg_Stride_Jump', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single Dumbbell Raise', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single_Dumbbell_Raise/0.jpg', ARRAY['Forearms', 'Traps']::TEXT[], ARRAY['With a wide stance, hold a dumbell with both hands, grasping the head of the dumbbell instead of the handle. Your arms should be extended and hanging at the waist. This will be your starting position.', 'Raise the weight until it is above shoulder level, keeping your arms extended. Your torso and hips should remain stationary throughout the movement.', 'Return to the starting position and repeat for the recommended amount of repetitions.']::TEXT[], 'Single_Dumbbell_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single Leg Butt Kick', 'Quadriceps', 'Quads', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single_Leg_Butt_Kick/0.jpg', ARRAY['Calves', 'Hamstrings']::TEXT[], ARRAY['Begin by standing on one leg, with the bent knee raised. This will be your start position.', 'Using a countermovement jump, take off upward by extending the hip, knee, and ankle of the grounded leg.', 'Immediately flex the knee and attempt to touch your butt with the heel of your jumping leg.', 'Return the leg to a partially bent position underneath the hips and land. Your opposite leg should stay in relatively the same position throughout the drill.']::TEXT[], 'Single_Leg_Butt_Kick', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single Leg Glute Bridge', 'Glutes', 'Legs', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single_Leg_Glute_Bridge/0.jpg', ARRAY['Hamstrings']::TEXT[], ARRAY['Lay on the floor with your feet flat and knees bent.', 'Raise one leg off of the ground, pulling the knee to your chest. This will be your starting position.', 'Execute the movement by driving through the heel, extending your hip upward and raising your glutes off of the ground.', 'Extend as far as possible, pause and then return to the starting position.']::TEXT[], 'Single_Leg_Glute_Bridge', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Single Leg Push-off', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Single_Leg_Push-off/0.jpg', ARRAY['Calves', 'Hamstrings']::TEXT[], ARRAY['Stand on the ground with one foot resting on the box, heel close to the edge.', 'Push off with your foot on top of the box, trying to gain as much height as possible by extending through the hip and knee.', 'Land with the same foot on top of the box, returning your other foot back to the start position.']::TEXT[], 'Single_Leg_Push-off', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sit-Up', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sit-Up/0.jpg', NULL, ARRAY['Lie down on the floor placing your feet either under something that will not move or by having a partner hold them. Your legs should be bent at the knees.', 'Place your hands behind your head and lock them together by clasping your fingers. This is the starting position.', 'Elevate your upper body so that it creates an imaginary V-shape with your thighs. Breathe out when performing this part of the exercise.', 'Once you feel the contraction for a second, lower your upper body back down to the starting position while inhaling.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Sit-Up', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sit Squats', 'Quadriceps', 'Quads', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sit_Squats/0.jpg', ARRAY['Abductors', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Stand with your feet shoulder width apart. This will be your starting position.', 'Begin the movement by flexing your knees and hips, sitting back with your hips.', 'Continue until you have squatted a portion of the way down, but are above parallel, and quickly reverse the motion until you return to the starting position. Repeat for 5-10 repetitions.']::TEXT[], 'Sit_Squats', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Skating', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Skating/0.jpg', ARRAY['Abductors', 'Adductors', 'Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Roller skating is a fun activity which can be effective in improving cardiorespiratory fitness and muscular endurance. It requires relatively good balance and coordination. It is necessary to learn the basics of skating including turning and stopping and to wear protective gear to avoid possible injury.', 'You can skate at a comfortable pace for 30 minutes straight. If you want a cardio challenge, do interval skating — speed skate two minutes of every five minutes, using the remaining three minutes to recover. A 150 lb person will typically burn about 175 calories in 30 minutes skating at a comfortable pace, similar to brisk walking.']::TEXT[], 'Skating', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sled Drag - Harness', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sled_Drag_-_Harness/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['To begin, load the sled with the desired weight and attach the pulling strap. You can pull with handles, use a harness, or attach the pulling strap to a weight belt.', 'Whether pulling forwards or backwards, lean in the direction of travel and progress by extending through the hips and knees.']::TEXT[], 'Sled_Drag_-_Harness', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sled Overhead Backward Walk', 'Shoulders', 'Shoulders', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sled_Overhead_Backward_Walk/0.jpg', ARRAY['Calves', 'Middle back', 'Quadriceps']::TEXT[], ARRAY['Attach dual handles to a sled connected by a rope or chain. Load the sled to a light weight.', 'Face the sled, backing up until there is some tension in the line. Hold your hands directly above your head with your elbows extended. This will be your starting position.', 'Walk backwards, keeping your arms raised above your head. Avoid jerky movements.']::TEXT[], 'Sled_Overhead_Backward_Walk', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sled Overhead Triceps Extension', 'Triceps', 'Triceps', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sled_Overhead_Triceps_Extension/0.jpg', NULL, ARRAY['Attach dual handles to a sled using a chain or rope. Load the sled to an appropriate load.', 'Facing away from the sled, step away until there is tension in the line. Raise your hands above your head, keeping them together, palms facing each other. Your elbows should be pointed upward with the elbows flexed. This will be your starting position.', 'Extend through the elbow to straighten the arm. Ensure that your upper arm stays in position to isolate the triceps.', 'Upon full extension, step forward to take the slack out of the line. You may keep your feet staggered for more stability.']::TEXT[], 'Sled_Overhead_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sled Push', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sled_Push/0.jpg', ARRAY['Calves', 'Chest', 'Glutes', 'Hamstrings', 'Triceps']::TEXT[], ARRAY['Load your pushing sled with the desired weight.', 'Take an athletic posture, leaning into the sled with your arms fully extended, grasping the handles. Push the sled as fast as possible, focusing on extending your hips and knees to strengthen your posterior chain.']::TEXT[], 'Sled_Push', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sled Reverse Flye', 'Shoulders', 'Shoulders', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sled_Reverse_Flye/0.jpg', NULL, ARRAY['Attach dual handles to a sled connected by a rope or chain. Load the sled to a light weight.', 'Face the sled, backing up until there is some tension in the line. Take both handles at arms length at about waist level. Bend the knees slightly and keep your chest and head up. This will be your starting position.', 'Without flexing the elbow, pull the handles upward and apart, performing a reverse fly with some external rotation. Your palms should be facing forward as you do this.', 'Return to the starting position, taking a couple steps back to take the slack out of the line.']::TEXT[], 'Sled_Reverse_Flye', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sled Row', 'Middle back', 'Back', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sled_Row/0.jpg', ARRAY['Biceps', 'Lats']::TEXT[], ARRAY['Attach dual handles to a sled connected by a rope or chain. Load the sled to an appropriate weight. Face the sled, backing up until there is some tension in the line.', 'With a handle in each hand, bend the knees slightly, keep your head and chest up, and begin with your arms extended.', 'To initiate the movement, flex the elbow as you retract your shoulder blades, pulling the sled towards you.', 'Take a step or two back to get tension in the line and repeat.']::TEXT[], 'Sled_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sledgehammer Swings', 'Abdominals', 'Other', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sledgehammer_Swings/0.jpg', ARRAY['Calves', 'Forearms', 'Lats', 'Middle back', 'Shoulders']::TEXT[], ARRAY['You will need a tire and a sledgehammer for this exercise. Stand in front of the tire about two feet away from it with a staggered stance. Grip the sledgehammer.', 'If you are right handed, your left hand should be at the bottom of the handle, and your right hand should be choking up closer to the head.', 'As you bring the sledge up, your right hand slides toward the head; as you swing down, your right hand will slide down to join your left hand. Slam it down as hard as you can against the tire. Control the bounce of the hammer off of the tire.', 'Repeat on the other side.']::TEXT[], 'Sledgehammer_Swings', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Incline Shoulder Raise', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Incline_Shoulder_Raise/0.jpg', ARRAY['Chest']::TEXT[], ARRAY['Place an incline bench underneath the smith machine. Place the barbell at a height that you can reach when lying down and your arms are almost fully extended. Once the weight you need is selected, lie down on the incline bench and make sure your shoulders are aligned right under the barbell.', 'Using a shoulder width pronated (palms forward) grip, lift the bar from the rack and hold it straight over you with a slight bend at the elbows. This will be your starting position.', 'As you breathe out, lift the bar up until your arms are fully extended. Note: The contraction should be felt around the shoulders.', 'After a second pause, bring the bar back down to the starting position as you breathe in.', 'Repeat the movement for the prescribed amount of repetitions.', 'When you are done, place the bar back in the rack.']::TEXT[], 'Smith_Incline_Shoulder_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Behind the Back Shrug', 'Traps', 'Back', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Behind_the_Back_Shrug/0.jpg', ARRAY['Shoulders']::TEXT[], ARRAY['With the bar at thigh level, load an appropriate weight.', 'Stand with the bar behind you, taking a shoulder-width, pronated grip on the bar and unhook the weight. You should be standing up straight with your head and chest up and your arms extended. This will be your starting position.', 'Initiate the movement by shrugging your shoulders straight up. Do not flex the arms or wrist during the movement.', 'After a brief pause return the weight to the starting position.', 'Repeat for the desired number of repetitions before engaging the hooks to rack the weight.']::TEXT[], 'Smith_Machine_Behind_the_Back_Shrug', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Bench Press', 'Chest', 'Chest', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Bench_Press/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Place a flat bench underneath the smith machine. Now place the barbell at a height that you can reach when lying down and your arms are almost fully extended. Once the weight you need is selected, lie down on the flat bench. Using a pronated grip that is wider than shoulder width, unlock the bar from the rack and hold it straight over you with your arms locked. This will be your starting position.', 'As you breathe in, come down slowly until you feel the bar on your middle chest.', 'After a second pause, bring the bar back to the starting position as you breathe out and push the bar using your chest muscles. Lock your arms in the contracted position, hold for a second and then start coming down slowly again. Tip: It should take at least twice as long to go down than to come up.', 'Repeat the movement for the prescribed amount of repetitions.', 'When you are done, lock the bar back in the rack.']::TEXT[], 'Smith_Machine_Bench_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Bent Over Row', 'Middle back', 'Back', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Bent_Over_Row/0.jpg', ARRAY['Biceps', 'Lats', 'Shoulders']::TEXT[], ARRAY['Set the barbell attached to the smith machine to a height that is about 2 inches below your knees.', 'Bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Tip: Make sure that you keep the head up.', 'Now grasp the barbell using an overhand (pronated) grip and unlock it from the smith machine rack. Then let it hang directly in front of you as your arms hang extended perpendicular to the floor and your torso. This is your starting position.', 'While keeping the torso stationary, lift the barbell as you breathe out, keeping the elbows close to the body and not doing any force with the forearm other than holding the weights. On the top contracted position, squeeze the back muscles and hold for a second.', 'Slowly lower the weight again to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Smith_Machine_Bent_Over_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Calf Raise', 'Calves', 'Calves', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Calf_Raise/0.jpg', NULL, ARRAY['Place a block or weight plate below the bar on the Smith machine. Set the bar to a position that best matches your height. Once the correct height is chosen and the bar is loaded, step onto the plates with the balls of your feet and place the bar on the back of your shoulders.', 'Take the bar with both hands facing forward. Rotate the bar to unrack it. This will be your starting position.', 'Raise your heels as high as possible by pushing off of the balls of your feet, flexing your calf at the top of the contraction. Your knees should remain extended. Hold the contracted position for a second before you start to go back down.', 'Return slowly to the starting position as you breathe in while lowering your heels.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Smith_Machine_Calf_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Close-Grip Bench Press', 'Triceps', 'Triceps', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Close-Grip_Bench_Press/0.jpg', ARRAY['Chest', 'Shoulders']::TEXT[], ARRAY['Place a flat bench underneath the smith machine. Place the barbell at a height that you can reach when lying down and your arms are almost fully extended. Once the weight you need is selected, lie down on the flat bench. Using a close and pronated grip (palms facing forward) that is around shoulder width, unlock the bar from the rack and hold it straight over you with your arms locked. This will be your starting position.', 'As you breathe in, come down slowly until you feel the bar on your middle chest. Tip: Make sure that as opposed to a regular bench press, you keep the elbows close to the torso at all times in order to maximize triceps involvement.', 'After a second pause, bring the bar back to the starting position as you breathe out and push the bar using your triceps muscles. Lock your arms in the contracted position, hold for a second and then start coming down slowly again. Tip: It should take at least twice as long to go down than to come up.', 'Repeat the movement for the prescribed amount of repetitions.', 'When you are done, lock the bar back in the rack.']::TEXT[], 'Smith_Machine_Close-Grip_Bench_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Decline Press', 'Chest', 'Chest', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Decline_Press/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Position a decline bench in the rack so that the bar will be above your chest. Load an appropriate weight and take your place on the bench.', 'Rotate the bar to unhook it from the rack and fully extend your arms. Your back should be slightly arched and your shoulder blades retracted. This will be your starting position.', 'Begin the movement by flexing your arms, lowering the bar to your chest.', 'Pause briefly, and then extend your arms to push the weight back to the starting position.', 'After completing the desired number of repetitions, rotate the bar to rack the weight.']::TEXT[], 'Smith_Machine_Decline_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Hang Power Clean', 'Hamstrings', 'Hamstrings', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Hang_Power_Clean/0.jpg', ARRAY['Glutes', 'Lower back', 'Quadriceps', 'Shoulders', 'Traps']::TEXT[], ARRAY['Position the bar at knee height and load it to an appropriate weight.', 'Take a pronated grip on the bar outside of shoulder width and unhook the bar from the machine. Your arms should be fully extended with your head and chest up. Your elbows should be pointed out with your shoulders back and down. Your hips should be back, loading the tension into the hamstrings. This will be your starting position.', 'Initate the movement by forcefully extending the hips and knees, accelerating into the bar. Ensure that you keep your arms straight during this part of the motion.', 'Upon full extension, rebend the hips and knees to lower your receiving position.', 'Allow the arms to flex at this point, rotating the elbows around the bar to receive it on your shoulders.', 'Extend through the hips and knees to come to a standing position with the bar racked on your shoulders to complete the movement.']::TEXT[], 'Smith_Machine_Hang_Power_Clean', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Hip Raise', 'Abdominals', 'Other', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Hip_Raise/0.jpg', NULL, ARRAY['Position a bench in the rack and load the bar to an appropriate weight. Lie down on the bench, placing the bottom of your feet against the bar. Unlock the bar and extend your legs. You may need to use your hands to assist you. For added stability grasp the sides of the Smith Machine. This will be your starting position.', 'Initiate the movement by rotating your pelvis, flexing your spine to raise your hips off of the bench. Maintain a slight bend in the knees throughout the motion.', 'After a brief pause, return the hips to the bench.', 'Repeat for the desired number of repetitions.']::TEXT[], 'Smith_Machine_Hip_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Incline Bench Press', 'Chest', 'Chest', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Incline_Bench_Press/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Place an incline bench underneath the smith machine. Place the barbell at a height that you can reach when lying down and your arms are almost fully extended. Once the weight you need is selected, lie down on the incline bench and make sure your upper chest is aligned with the barbell. Using a pronated grip (palms facing forward) that is wider than shoulder width, unlock the bar from the rack and hold it straight over you with your arms locked. This will be your starting position.', 'As you breathe in, come down slowly until you feel the bar on your upper chest.', 'After a second pause, bring the bar back to the starting position as you breathe out and push the bar using your chest muscles. Lock your arms in the contracted position, hold for a second and then start coming down slowly again. Tip: It should take at least twice as long to go down than to come up.', 'Repeat the movement for the prescribed amount of repetitions.', 'When you are done, place the bar back in the rack.']::TEXT[], 'Smith_Machine_Incline_Bench_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Leg Press', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Leg_Press/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Position a Smith machine bar a couple feet off of the ground. Ensure that it is resting on the safeties. After loading the bar to an appropriate weight, lie underneath the bar. Place the middle of your feet on the bar, tucking your knees to your chest. This will be your starting position.', 'Begin the movement by driving through your feet to move the bar upward, extending the hips and knees. Do not lock out your knees.', 'At the top of the motion, pause briefly before returning to the starting position.']::TEXT[], 'Smith_Machine_Leg_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine One-Arm Upright Row', 'Shoulders', 'Shoulders', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_One-Arm_Upright_Row/0.jpg', ARRAY['Biceps', 'Traps']::TEXT[], ARRAY['With the bar at thigh level, load an appropriate weight.', 'Take a wide grip on the bar and unhook the weight, removing your off hand from the bar. Your arm should be extended as you stand up straight with your head and chest up. This will be your starting position.', 'Begin the movement by flexing the elbow, raising the upper arm with the elbow pointed out. Continue until your upper arm is parallel to the floor.', 'After a brief pause, return the weight to the starting position.', 'Repeat for the desired number of repetitions before engaging the hooks to rack the weight.']::TEXT[], 'Smith_Machine_One-Arm_Upright_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Overhead Shoulder Press', 'Shoulders', 'Shoulders', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Overhead_Shoulder_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['To begin, place a flat bench (or preferably one with back support) underneath a smith machine. Position the barbell at a height so that when seated on the flat bench, the arms must be almost fully extended to reach the barbell.', 'Once you have the correct height, sit slightly in behind the barbell so that there is an imaginary straight line from the tip of your nose to the barbell. Your feet should be stationary. Grab the barbell with the palms facing forward, unlock it and lift it up so that your arms are fully extended. This is the starting position.', 'Slowly begin to lower the barbell until it is level with your chin while inhaling.', 'Then lift the barbell back to the starting position using your shoulders while exhaling.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Smith_Machine_Overhead_Shoulder_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Pistol Squat', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Pistol_Squat/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['To begin, first set the bar to a position that best matches your height. Step under it and position the bar across the back of your shoulders.', 'Take the bar with your hands facing forward, unlock it and lift it off the rack by extending your legs. 3', 'Move one foot forward about 12 inches in front of the bar. Extend the other leg out in front of you, holding it off the ground. Look forward at all times and maintain a neutral or slightly arched spine. This will be your starting position.', 'Maintaining good posture, lower yourself by flexing the knee and hip, going down as far as flexibility allows.', 'Pause briefly at the bottom and then return to the starting position by driving through the heel of your foot, extending the knee and hip.']::TEXT[], 'Smith_Machine_Pistol_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Reverse Calf Raises', 'Calves', 'Calves', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Reverse_Calf_Raises/0.jpg', NULL, ARRAY['Adjust the barbell on the smith machine to fit your height and align a raised platform right under the bar.', 'Stand on the platform with the heels of your feet secured on top of it with the balls of your feet extending off it. Position your toes facing forward with a shoulder width stance.', 'Now, place your shoulders under the barbell while maintaining the foot positioning described and push the barbell up by extending your hips and knees until your torso is standing erect. The knees should be kept with a slight bend; never locked. This will be your starting position. Tip: The barbell on your back is only for balance purposes.', 'Raise the balls of your feet as you breathe out by extending your toes as high as possible and flexing your calf. Ensure that the knee is kept stationary at all times. There should be no bending at any time. Hold the contracted position for a second before you start to go back down.', 'Slowly go back down to the starting position as you breathe in by lowering the balls of your feet and toes.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Smith_Machine_Reverse_Calf_Raises', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Squat', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Squat/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings', 'Lower back']::TEXT[], ARRAY['To begin, first set the bar on the height that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place the back of your shoulders (slightly below the neck) across it.', 'Hold on to the bar using both arms at each side (palms facing forward), unlock it and lift it off the rack by first pushing with your legs and at the same time straightening your torso.', 'Position your legs using a shoulder width medium stance with the toes slightly pointed out. Keep your head up at all times and also maintain a straight back. This will be your starting position. (Note: For the purposes of this discussion we will use the medium stance which targets overall development; however you can choose any of the three stances discussed in the foot stances section).', 'Begin to slowly lower the bar by bending the knees as you maintain a straight posture with the head up. Continue down until the angle between the upper leg and the calves becomes slightly less than 90-degrees (which is the point in which the upper legs are below parallel to the floor). Inhale as you perform this portion of the movement. Tip: If you performed the exercise correctly, the front of the knees should make an imaginary straight line with the toes that is perpendicular to the front. If your knees are past that imaginary line (if they are past your toes) then you are placing undue stress on the knee and the exercise has been performed incorrectly.', 'Begin to raise the bar as you exhale by pushing the floor with the heel of your foot as you straighten the legs again and go back to the starting position.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Smith_Machine_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Stiff-Legged Deadlift', 'Hamstrings', 'Hamstrings', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Stiff-Legged_Deadlift/0.jpg', ARRAY['Glutes', 'Lower back']::TEXT[], ARRAY['To begin, set the bar on the smith machine to a height that is around the middle of your thighs. Once the correct height is chosen and the bar is loaded, grasp the bar using a pronated (palms forward) grip that is shoulder width apart. You may need some wrist wraps if using a significant amount of weight.', 'Lift the bar up by fully extending your arms while keeping your back straight. Stand with your torso straight and your legs spaced using a shoulder width or narrower stance. The knees should be slightly bent. This is your starting position.', 'Keeping the knees stationary, lower the barbell to over the top of your feet by bending at the waist while keeping your back straight. Keep moving forward as if you were going to pick something from the floor until you feel a stretch on the hamstrings. Exhale as you perform this movement', 'Start bringing your torso up straight again as soon as you feel the hamstrings stretch by extending your hips and waist until you are back at the starting position. Inhale as you perform this movement.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Smith_Machine_Stiff-Legged_Deadlift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Machine Upright Row', 'Traps', 'Back', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Machine_Upright_Row/0.jpg', ARRAY['Biceps', 'Middle back', 'Shoulders']::TEXT[], ARRAY['To begin, set the bar on the smith machine to a height that is around the middle of your thighs. Once the correct height is chosen and the bar is loaded, grasp the bar using a pronated (palms forward) grip that is shoulder width apart. You may need some wrist wraps if using a significant amount of weight.', 'Lift the barbell up and fully extend your arms with your back straight. There should be a slight bend at the elbows. This is the starting position.', 'Use your side shoulders to lift the bar as you exhale. The bar should be close to the body as you move it up. Continue to lift it until it nearly touches your chin. Tip: Your elbows should drive the motion. As you lift the bar, your elbows should always be higher than your forearms. Also, keep your torso stationary and pause for a second at the top of the movement.', 'Lower the bar back down slowly to the starting position. Inhale as you perform this portion of the movement.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Smith_Machine_Upright_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Smith Single-Leg Split Squat', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Smith_Single-Leg_Split_Squat/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['To begin, place a flat bench 2-3 feet behind the smith machine. Then, set the bar on the height that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place the back of your shoulders (slightly below the neck) across it.', 'Hold on to the bar using both arms at each side (palms facing forward), unlock it and lift it off the rack by first pushing with your legs and at the same time straightening your torso.', 'Position your legs by placing one foot slightly forward under the bar and extending your other leg back and place the top of your foot on the bench. This will be your starting position', 'Begin to slowly lower the bar by bending the knee as you maintain a straight posture with the head up. Continue down until the angle between the upper leg and the calf becomes slightly less than 90-degrees (which is the point in which the upper legs are below parallel to the floor). Inhale as you perform this portion of the movement. Tip: If you performed the exercise correctly, the front of the knee should make an imaginary straight line with the toes that is perpendicular to the front. If your knee is past that imaginary line (if it is past your toes) then you are placing undue stress on the knee and the exercise has been performed incorrectly.', 'Begin to raise the bar as you exhale by pushing the floor with the heel of your foot mainly as you straighten your leg again and go back to the starting position.', 'Repeat for the recommended amount of repetitions.', 'Switch legs and repeat the movement.']::TEXT[], 'Smith_Single-Leg_Split_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Snatch', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Snatch/0.jpg', ARRAY['Biceps', 'Glutes', 'Hamstrings', 'Lower back', 'Shoulders', 'Traps', 'Triceps']::TEXT[], ARRAY['Place your feet at a shoulder width stance with the barbell resting right above the connection between the toes and the rest of the foot.', 'With a palms facing down grip, bend at the knees and keeping the back flat grab the bar using a wider than shoulder width grip. Bring the hips down and make sure that your body drops as if you were going to sit on a chair. This will be your starting position.', 'Start pushing the floor as if it were a moving platform with your feet and simultaneously start lifting the barbell keeping it close to your legs.', 'As the bar reaches the middle of your thighs, push the floor with your legs and lift your body to a complete extension in an explosive motion.', 'Lift your shoulders back in a shrugging movement as you bring the bar up while lifting your elbows out to the side and keeping them above the bar for as long as possible.', 'Now in a very quick but powerful motion, you have to get your body under the barbell when it has reached a high enough point where it can be controlled and drop while locking your arms and holding the barbell overhead as you assume a squat position.', 'Finalize the movement by rising up out of the squat position to finish the lift. At the end of the lift both feet should be on line and the arms fully extended holding the barbell overhead.']::TEXT[], 'Snatch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Snatch Balance', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Snatch_Balance/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Begin with the feet in the pulling position, the bar racked across the back of the shoulders, and the hands placed in a wide snatch grip.', 'Pop the bar with an abrupt dip and drive of the knees, and aggressively drive under the bar, transitioning the feet into the receiving position.', 'Receive the bar locked out overhead near the bottom of the squat. The torso should remain vertical, lowering the hips between the legs.', 'Continue to descend to full depth, and return to a standing position. Carefully lower the weight.']::TEXT[], 'Snatch_Balance', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Snatch Deadlift', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Snatch_Deadlift/0.jpg', ARRAY['Forearms', 'Glutes', 'Hamstrings', 'Lower back', 'Quadriceps', 'Traps']::TEXT[], ARRAY['The snatch deadlift strengthens the first pull of the snatch. Begin with a wide snatch grip with the barbell placed on the platform. The feet should be directly under the hips, with the feet turned out. Squat down to the bar, keeping the back in absolute extension with the head facing forward.', 'Initiate the movement by driving through the heels, raising the hips. The back angle should remain the same until the bar passes the knees.', 'At that point, drive your hips through the bar as you lay back. Return the bar to the platform by reversing the motion.']::TEXT[], 'Snatch_Deadlift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Snatch Pull', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Snatch_Pull/0.jpg', ARRAY['Calves', 'Glutes', 'Lower back', 'Quadriceps', 'Traps']::TEXT[], ARRAY['With a barbell on the floor close to the shins, take a wide snatch grip. Lower your hips with the weight focused on the heels, back straight, head facing forward, chest up, with your shoulders just in front of the bar. This will be your starting position.', 'Begin the first pull by driving through the heels, extending your knees. Your back angle should stay the same, and your arms should remain straight. Move the weight with control as you continue to above the knees.', 'Next comes the second pull, the main source of acceleration for the pull. As the bar approaches the mid-thigh position, begin extending through the hips. In a jumping motion, accelerate by extending the hips, knees, and ankles, using speed to move the bar upward.', 'There should be no need to actively pull through the arms to accelerate the weight; at the end of the second pull, the body should be fully extended, leaning slightly back. Full extension should be violent and abrupt, and ensure that you do not prolong the extension for longer than necessary.']::TEXT[], 'Snatch_Pull', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Snatch Shrug', 'Traps', 'Back', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Snatch_Shrug/0.jpg', ARRAY['Forearms', 'Shoulders']::TEXT[], ARRAY['Begin with a wide grip, with the bar hanging at the mid thigh position. You can use a hook or overhand grip. Your back should be straight and inclined slightly forward.', 'Shrug your shoulders towards your ears. While this exercise can usually by loaded with heavier weight than a snatch, avoid overloading to the point that the execution slows down.']::TEXT[], 'Snatch_Shrug', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Snatch from Blocks', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Snatch_from_Blocks/0.jpg', ARRAY['Calves', 'Forearms', 'Glutes', 'Hamstrings', 'Lower back', 'Shoulders', 'Traps', 'Triceps']::TEXT[], ARRAY['Begin with a loaded barbell on boxes or stands of the desired height. A wide grip should be taken on the bar. The feet should be directly below the hips, with the feet turned out as needed. Lower the hips, with the chest up and the head looking forward. The shoulders should be just in front of the bar, with the elbows pointed out. This will be the starting position.', 'Begin the first pull by driving through the front of the heels, raising the bar from the boxes.', 'Transition into the second pull by extending through the hips knees and ankles, driving the bar up as quickly as possible. The bar should be close to the body. At peak extension, shrug the shoulders and allow the elbows to flex to the side.', 'As you move your feet into the receiving position, forcefully pull yourself below the bar as you elevate the bar overhead. The feet should move to just outside the hips, turned out as necessary. Receive the bar with your body as low as possible and the arms fully extended overhead.', 'Keeping the bar aligned over the front of the heels, your head and chest up, drive through heels of the feet to move to a standing position. Carefully return the weight to the boxes.']::TEXT[], 'Snatch_from_Blocks', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Speed Band Overhead Triceps', 'Triceps', 'Triceps', 'Bands', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Speed_Band_Overhead_Triceps/0.jpg', NULL, ARRAY['For this exercise anchor a band to the ground. We used an incline bench and anchored the band to the base, standing over the bench. Alternatively, this could be performed standing on the band.', 'To begin, pull the band behind your head, holding it with a pronated grip and your elbows up. This will be your starting position.', 'To perform the movement, extend through the elbow to to straighten your arms, ensuring that you keep your upper arm in place.', 'Pause, and then return to the starting position.']::TEXT[], 'Speed_Band_Overhead_Triceps', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Speed Box Squat', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Speed_Box_Squat/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Attach bands to the bar that are securely anchored near the ground. You may need to choke the bands to get adequate tension.', 'Use a box of an appropriate height for this exercise. Load the bar to a weight that still requires effort, but isn''t so heavy that speed is compromised. Typically, that will be between 50-70% of your one rep max.', 'Position the bar on your upper back, shoulder blades retracted, back arched and everything tight head to toe. This will be the starting position.', 'Unrack the bar and position yourself in front of the box. Sit back with your hips until you are seated on the box, ensuring that you descend under control and don''t crash onto the surface.', 'Pause briefly, and explode off of the box, extending through the hips and knees.']::TEXT[], 'Speed_Box_Squat', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Speed Squats', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Speed_Squats/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings', 'Lower back']::TEXT[], ARRAY['This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place the back of your shoulders (slightly below the neck) across it.', 'Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.', 'Step away from the rack and position your legs using a shoulder width medium stance with the toes slightly pointed out. Keep your head up at all times as looking down will get you off balance and also maintain a straight back. This will be your starting position. (Note: For the purposes of this discussion we will use the medium stance which targets overall development; however you can choose any of the three stances discussed in the foot stances section).', 'Begin to lower the bar by bending the knees as you maintain a straight posture with the head up. Continue down until the angle between the upper leg and the calves becomes slightly less than 90-degrees (which is the point in which the upper legs are below parallel to the floor). Inhale as you perform this portion of the movement. Tip: If you performed the exercise correctly, the front of the knees should make an imaginary straight line with the toes that is perpendicular to the front. If your knees are past that imaginary line (if they are past your toes) then you are placing undue stress on the knee and the exercise has been performed incorrectly.', 'Begin to raise the bar as fast as possible without involving momentum as you exhale by pushing the floor with the heel of your foot mainly as you straighten the legs again and go back to the starting position. Note: You should perform these exercises as fast as possible but without breaking perfect form and without involving momentum.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Speed_Squats', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Spell Caster', 'Abdominals', 'Other', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Spell_Caster/0.jpg', ARRAY['Glutes', 'Shoulders']::TEXT[], ARRAY['Hold a dumbbell in each hand with a pronated grip. Your feet should be wide with your hips and knees extended. This will be your starting position.', 'Begin the movement by pulling both of the dumbbells to one side next to your hip, rotating your torso.', 'Keeping your arms straight and the dumbbells parallel to the ground, rotate your torso to swing the weights to your opposite side.', 'Continue alternating, rotating from one side to the other until the set is complete.']::TEXT[], 'Spell_Caster', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Spider Crawl', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Spider_Crawl/0.jpg', ARRAY['Chest', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Begin in a prone position on the floor. Support your weight on your hands and toes, with your feet together and your body straight. Your arms should be bent to 90 degrees. This will be your starting position.', 'Initiate the movement by raising one foot off of the ground. Externally rotate the leg and bring the knee toward your elbow, as far forward as possible.', 'Return this leg to the starting position and repeat on the opposite side.']::TEXT[], 'Spider_Crawl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Spider Curl', 'Biceps', 'Biceps', 'E-z curl bar', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Spider_Curl/0.jpg', NULL, ARRAY['Start out by setting the bar on the part of the preacher bench that you would normally sit on. Make sure to align the barbell properly so that it is balanced and will not fall off.', 'Move to the front side of the preacher bench (the part where the arms usually lay) and position yourself to lay at a 45 degree slant with your torso and stomach pressed against the front side of the preacher bench.', 'Make sure that your feet (especially the toes) are well positioned on the floor and place your upper arms on top of the pad located on the inside part of the preacher bench.', 'Use your arms to grab the barbell with a supinated grip (palms facing up) at about shoulder width apart or slightly closer from each other.', 'Slowly begin to lift the barbell upwards and exhale. Hold the contracted position for a second as you squeeze the biceps.', 'Slowly begin to bring the barbell back to the starting position as your breathe in. .', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Spider_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Spinal Stretch', 'Middle back', 'Back', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Spinal_Stretch/0.jpg', ARRAY['Lats', 'Lower back', 'Neck', 'Traps']::TEXT[], ARRAY['Sit in a chair so your back is straight and your feet planted on the floor.', 'Interlace your fingers behind your head, elbows out and your chin down.', 'Twist your upper body to one side about 3 times as far as you can. Then lean forward and twist your torso to reach your elbow to the floor on the inside of your knee.', 'Return to upright position and then repeat for your other side.']::TEXT[], 'Spinal_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Split Clean', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Split_Clean/0.jpg', ARRAY['Calves', 'Forearms', 'Glutes', 'Hamstrings', 'Lower back', 'Shoulders', 'Traps']::TEXT[], ARRAY['With a barbell on the floor close to the shins, take an overhand grip just outside the legs. Lower your hips with the weight focused on the heels, back straight, head facing forward, chest up, with your shoulders just in front of the bar. This will be your starting position.', 'Begin the first pull by driving through the heels, extending your knees. Your back angle should stay the same, and your arms should remain straight. Move the weight with control as you continue to above the knees.', 'Next comes the second pull, the main source of acceleration for the clean. As the bar approaches the mid-thigh position, begin extending through the hips. In a jumping motion, accelerate by extending the hips, knees, and ankles, using speed to move the bar upward. There should be no need to actively pull through the arms to accelerate the weight; at the end of the second pull, the body should be fully extended, leaning slightly back, with the arms still extended.', 'As full extension is achieved, transition into the third pull by aggressively shrugging and flexing the arms with the elbows up and out. At peak extension, aggressively pull yourself down, rotating your elbows under the bar as you do so.', 'Receive the bar with the feet split, aggressively moving one foot forward and one foot back. The bar should be racked onto the protracted shoulders, lightly touching the throat with the hands relaxed. Continue to descend to the bottom position, which will help in the recovery.', 'Immediately recover by driving through the heels, keeping the torso upright and elbows up. Bring the feet together as you stand up.']::TEXT[], 'Split_Clean', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Split Jerk', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Split_Jerk/0.jpg', ARRAY['Glutes', 'Hamstrings', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Standing with the weight racked on the front of the shoulders, begin with the dip. With your feet directly under your hips, flex the knees without moving the hips backward.', 'Go down only slightly, and reverse direction as powerfully as possible. Drive through the heels create as much speed and force as possible, and be sure to move your head out of the way as the bar leaves the shoulders. At this moment as the feet leave the floor, the feet must be placed into the receiving position as quickly as possible.', 'In the brief moment the feet are not actively driving against the platform, the athlete''s effort to push the bar up will drive them down. The feet should be moved to a split stance, one foot forward, one foot back, with the knees partially bent. Receive the bar with the arms locked out overhead.', 'Return to a standing position, bringing the feet together.']::TEXT[], 'Split_Jerk', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Split Jump', 'Quadriceps', 'Quads', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Split_Jump/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['Assume a lunge stance position with one foot forward with the knee bent, and the rear knee nearly touching the ground.', 'Ensure that the front knee is over the midline of the foot.', 'Extending through both legs, jump as high as possible, swinging your arms to gain lift.', 'As you jump, bring your feet together, and move them back to their initial positions as you land.', 'Absorb the impact by reverting back to the starting position.']::TEXT[], 'Split_Jump', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Split Snatch', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Split_Snatch/0.jpg', ARRAY['Calves', 'Forearms', 'Glutes', 'Hamstrings', 'Lower back', 'Quadriceps', 'Shoulders', 'Traps', 'Triceps']::TEXT[], ARRAY['Begin with a loaded barbell on the floor. The bar should be close to or touching the shins, and a wide grip should be taken on the bar. The feet should be directly below the hips, with the feet turned out as needed. Lower the hips, with the chest up and the head looking forward. The shoulders should be just in front of the bar. This will be the starting position.', 'Begin the first pull by driving through the front of the heels, raising the bar from the ground. The back angle should stay the same until the bar passes the knees.', 'Transition into the second pull by extending through the hips knees and ankles, driving the bar up as quickly as possible. The bar should be close to the body. At peak extension, shrug the shoulders and allow the elbows to flex to the side.', 'As you move your feet into the receiving position, forcefully pull yourself below the bar as you elevate the bar overhead. The feet should move forcefully to a split position, one foot forward one foot back. Receive the bar with your body as low as possible and the arms fully extended overhead.', 'Keeping the bar aligned over the front of the heels, your head and chest up, drive through heels of the feet to move to a standing position, bringing your feet together.', 'Carefully return the weight to floor.']::TEXT[], 'Split_Snatch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Split Squat with Dumbbells', 'Quadriceps', 'Quads', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Split_Squat_with_Dumbbells/0.jpg', ARRAY['Glutes', 'Hamstrings']::TEXT[], ARRAY['Position yourself into a staggered stance with the rear foot elevated and front foot forward.', 'Hold a dumbbell in each hand, letting them hang at the sides. This will be your starting position.', 'Begin by descending, flexing your knee and hip to lower your body down. Maintain good posture througout the movement. Keep the front knee in line with the foot as you perform the exercise.', 'At the bottom of the movement, drive through the heel to extend the knee and hip to return to the starting position.']::TEXT[], 'Split_Squat_with_Dumbbells', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Split Squats', 'Hamstrings', 'Hamstrings', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Split_Squats/0.jpg', ARRAY['Calves', 'Glutes', 'Quadriceps']::TEXT[], ARRAY['Being in a standing position. Jump into a split leg position, with one leg forward and one leg back, flexing the knees and lowering your hips slightly as you do so.', 'As you descend, immediately reverse direction, standing back up and jumping, reversing the position of your legs. Repeat 5-10 times on each leg.']::TEXT[], 'Split_Squats', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Squat Jerk', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Squat_Jerk/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Standing with the weight racked on the front of the shoulders, begin with the dip. With your feet directly under your hips, flex the knees without moving the hips backward. Go down only slightly, and reverse direction as powerfully as possible. Drive through the heels create as much speed and force as possible, and be sure to move your head out of the way as the bar leaves the shoulders.', 'At this moment as the feet leave the floor, the feet must be placed into the receiving position as quickly as possible. In the brief moment the feet are not actively driving against the platform, the athlete''s effort to push the bar up will drive them down. The feet should move forcefully to just outside the hips, turned out as necessary. Receive the bar with your body in a full squat and the arms fully extended overhead.', 'Keeping the bar aligned over the front of the heels, your head and chest up, drive throught heels of the feet to move to a standing position. Carefully return the weight to floor.']::TEXT[], 'Squat_Jerk', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Squat with Bands', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Squat_with_Bands/0.jpg', ARRAY['Adductors', 'Calves', 'Glutes', 'Hamstrings', 'Lower back']::TEXT[], ARRAY['Set up the bands on the sleeves, secured to either band pegs, the rack, or dumbbells so that there is appropriate tension.', 'Begin by stepping under the bar and placing it across the back of the shoulders. Squeeze your shoulder blades together and rotate your elbows forward, attempting to bend the bar across your shoulders. Remove the bar from the rack, creating a tight arch in your lower back, and step back into position. Place your feet wide for more emphasis on the back, glutes, adductors, and hamstrings. Keep your head facing forward.', 'With your back, shoulders, and core tight, push your knees and butt out and you begin your descent. Sit back with your hips as much as possible. Ideally, your shins should be perpendicular to the ground. Lower bar position necessitates a greater torso lean to keep the bar over the heels. Continue until you break parallel, which is defined as the crease of the hip being in line with the top of the knee.', 'Keeping the weight on your heels and pushing your feet and knees out, drive upward as you lead the movement with your head. Continue upward, maintaining tightness head to toe, until you have returned to the starting position.']::TEXT[], 'Squat_with_Bands', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Squat with Chains', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Squat_with_Chains/0.jpg', ARRAY['Adductors', 'Calves', 'Glutes', 'Hamstrings', 'Lower back']::TEXT[], ARRAY['To set up the chains, begin by looping the leader chain over the sleeves of the bar. The heavy chain should be attached using a snap hook. Adjust the length of the lead chain so that a few links are still on the floor at the top of the movement.', 'Begin by stepping under the bar and placing it across the back of the shoulders. Squeeze your shoulder blades together and rotate your elbows forward, attempting to bend the bar across your shoulders. Remove the bar from the rack, creating a tight arch in your lower back, and step back into position. Place your feet wide for more emphasis on the back, glutes, adductors, and hamstrings. Keep your head facing forward.', 'With your back, shoulders, and core tight, push your knees and butt out and you begin your descent. Sit back with your hips as much as possible. Ideally, your shins should be perpendicular to the ground. Lower bar position necessitates a greater torso lean to keep the bar over the heels. Continue until you break parallel, which is defined as the crease of the hip being in line with the top of the knee.', 'Keeping the weight on your heels and pushing your feet and knees out, drive upward as you lead the movement with your head. Continue upward, maintaining tightness head to toe, until you have returned to the starting position.']::TEXT[], 'Squat_with_Chains', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Squat with Plate Movers', 'Quadriceps', 'Quads', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Squat_with_Plate_Movers/0.jpg', ARRAY['Abductors', 'Adductors', 'Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['To begin, first set the bar on a rack to just below shoulder level. Position a weight plate on the ground a couple feet back from the rack. Once the bar is loaded, step under it and place the back of your shoulders across it.', 'Hold on to the bar with both hands and lift it off the rack by first pushing with your legs and at the same time straighten your torso.', 'Step away from the rack and adopt a wide stance with the toes slightly pointed out, with one foot on the weight plate. Keep your head up at all times. This will be your starting position.', 'Begin to slowly lower the bar by bending the knees and hips. Continue down until the angle between the upper leg and the calves becomes slightly less than 90-degrees.', 'Raise the bar as you exhale by pushing the floor with the heels of your feet as you extend the hips and knees.', 'At the top of the movement, side step, bringing your feet together on the opposite side of the plate.', 'Using your inside foot, push the weight plate, sliding it across the floor to where you were just standing.', 'Place your inside foot on the weight plate, adopting a wide stance for the next repetition.']::TEXT[], 'Squat_with_Plate_Movers', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Squats - With Bands', 'Quadriceps', 'Quads', 'Bands', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Squats_-_With_Bands/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings', 'Lower back']::TEXT[], ARRAY['To start out, make sure that the exercise band is at an even split between both the left and right side of the body. To do this, use your hands to grab both sides of the band and place both feet in the middle of the band. Your feet should be shoulder width apart from each other.', 'When holding the bands, they should be the same height on each side. You should be using a pronated grip (palms facing forward) and have the handles of the bands next to your face for this exercise. This is the starting position.', 'Slowly start to bend the knees and lower the legs so that your thighs are parallel to the floor while exhaling.', 'Use the heel of your feet to push your body up to the starting position as you exhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Squats_-_With_Bands', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Stairmaster', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Stairmaster/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['To begin, step onto the stairmaster and select the desired option from the menu. You can choose a manual setting, or you can select a program to run. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise.', 'Pump your legs up and down in an established rhythm, driving the pedals down but not all the way to the floor. It is recommended that you maintain your grip on the handles so that you don''t fall. The handles can be used to monitor your heart rate to help you stay at an appropriate intensity.', 'Stairmasters offer convenience, cardiovascular benefits, and usually have less impact than running outside. They are typically much harder than other cardio equipment. A 150 lb person will typically burn over 300 calories in 30 minutes, compared to about 175 calories walking.']::TEXT[], 'Stairmaster', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Alternating Dumbbell Press', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Alternating_Dumbbell_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Stand with a dumbbell in each hand. Raise the dumbbells to your shoulders with your palms facing forward and your elbows pointed out. This will be your starting position.', 'Extend one arm to press the dumbbell straight up, keeping your off hand in place. Do not lean or jerk the weight during the movement.', 'After a brief pause, return the weight to the starting position.', 'Repeat for the opposite side, continuing to alternate between arms.']::TEXT[], 'Standing_Alternating_Dumbbell_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Barbell Calf Raise', 'Calves', 'Calves', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Barbell_Calf_Raise/0.jpg', NULL, ARRAY['This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place the bar on the back of your shoulders (slightly below the neck).', 'Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.', 'Step away from the rack and position your legs using a shoulder width medium stance with the toes slightly pointed out. Keep your head up at all times as looking down will get you off balance and also maintain a straight back. The knees should be kept with a slight bend; never locked. This will be your starting position. Tip: For better range of motion you may also place the ball of your feet on a wooden block but be careful as this option requires more balance and a sturdy block.', 'Raise your heels as you breathe out by extending your ankles as high as possible and flexing your calf. Ensure that the knee is kept stationary at all times. There should be no bending at any time. Hold the contracted position by a second before you start to go back down.', 'Go back slowly to the starting position as you breathe in by lowering your heels as you bend the ankles until calves are stretched.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Barbell_Calf_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Barbell Press Behind Neck', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Barbell_Press_Behind_Neck/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['This exercise is best performed inside a squat rack for easier pick up of the bar. To begin, first set the bar on a rack that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place the back of your shoulders (slightly below the neck) across it.', 'Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.', 'Step away from the rack and position your legs using a shoulder width medium stance with the toes slightly pointed out. Your back should be kept straight while performing this exercise. This will be your starting position.', 'Elevate the barbell overhead by fully extending your arms while breathing out.', 'Hold the contraction for a second and lower the barbell back down to the starting position by inhaling.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Barbell_Press_Behind_Neck', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Bent-Over One-Arm Dumbbell Triceps Extension', 'Triceps', 'Triceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Bent-Over_One-Arm_Dumbbell_Triceps_Extension/0.jpg', ARRAY['Shoulders']::TEXT[], ARRAY['With a dumbbell in one hand and the palm facing your torso, bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Make sure that you keep the head up.', 'The upper arm should be close to the torso and parallel to the floor while the forearm is pointing towards the floor as the hand holds the weight. Tip: There should be a 90-degree angle between the forearm and the upper arm. This is your starting position.', 'Keeping the upper arms stationary, use the triceps to lift the weights as you exhale until the forearms are parallel to the floor and the whole arm is extended. Like many other arm exercises, only the forearm moves.', 'After a second contraction at the top, slowly lower the dumbbell back to the starting position as you inhale.', 'Repeat the movement for the prescribed amount of repetitions.', 'Switch arms and repeat the exercise.']::TEXT[], 'Standing_Bent-Over_One-Arm_Dumbbell_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Bent-Over Two-Arm Dumbbell Triceps Extension', 'Triceps', 'Triceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Bent-Over_Two-Arm_Dumbbell_Triceps_Extension/0.jpg', NULL, ARRAY['With a dumbbell in each hand and the palms facing your torso, bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Make sure that you keep the head up. The upper arms should be close to the torso and parallel to the floor while the forearms are pointing towards the floor as the hands hold the weights. Tip: There should be a 90-degree angle between the forearms and the upper arm. This is your starting position.', 'Keeping the upper arms stationary, use the triceps to lift the weights as you exhale until the forearms are parallel to the floor and the whole arms are extended. Like many other arm exercises, only the forearm moves.', 'After a second contraction at the top, slowly lower the dumbbells back to their starting position as you inhale.', 'Repeat the movement for the prescribed amount of repetitions.']::TEXT[], 'Standing_Bent-Over_Two-Arm_Dumbbell_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Biceps Cable Curl', 'Biceps', 'Biceps', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Biceps_Cable_Curl/0.jpg', NULL, ARRAY['Stand up with your torso upright while holding a cable curl bar that is attached to a low pulley. Grab the cable bar at shoulder width and keep the elbows close to the torso. The palm of your hands should be facing up (supinated grip). This will be your starting position.', 'While holding the upper arms stationary, curl the weights while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second as you squeeze the muscle.', 'Slowly begin to bring the curl bar back to starting position as your breathe in.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Biceps_Cable_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Biceps Stretch', 'Biceps', 'Biceps', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Biceps_Stretch/0.jpg', ARRAY['Chest', 'Shoulders']::TEXT[], ARRAY['Clasp your hands behind your back with your palms together, straighten arms and then rotate them so your palms face downward.', 'Raise your arms up and hold until you feel a stretch in your biceps.']::TEXT[], 'Standing_Biceps_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Bradford Press', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Bradford_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Place a loaded bar at shoulder level in a rack. With a pronated grip at shoulder width, begin with the bar racked across the front of your shoulders. This is your starting position.', 'Initiate the lift by extending the elbows to press the bar overhead. Avoid locking out the elbow as you move the weight behind your head.', 'Lower the bar down to the back of the head until your elbow forms a right angle.', 'Lift the bar back over your head by extending the elbows', 'Lower the bar down to the starting position.', 'Alternate in this manner until you complete the recommended amount of repetitions.']::TEXT[], 'Standing_Bradford_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Cable Chest Press', 'Chest', 'Chest', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Cable_Chest_Press/0.jpg', ARRAY['Shoulders', 'Triceps']::TEXT[], ARRAY['Position dual pulleys to chest height and select an appropriate weight. Stand a foot or two in front of the cables, holding one in each hand. You can stagger your stance for better stability.', 'Position the upper arm at a 90 degree angle with the shoulder blades together. This will be your starting position.', 'Keeping the rest of the body stationary, extend through the elbows to press the handles forward, drawing them together in front of you.', 'Pause at the top of the motion, and return to the starting position.']::TEXT[], 'Standing_Cable_Chest_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Cable Lift', 'Abdominals', 'Other', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Cable_Lift/0.jpg', ARRAY['Shoulders']::TEXT[], ARRAY['Connect a standard handle on a tower, and move the cable to the lowest pulley position.', 'With your side to the cable, grab the handle with one hand and step away from the tower. You should be approximately arm''s length away from the pulley, with the tension of the weight on the cable. Your outstretched arm should be aligned with the cable.', 'With your feet positioned shoulder width apart, squat down and grab the handle with both hands. Your arms should still be fully extended.', 'In one motion, pull the handle up and across your body until your arms are in a fully-extended position above your head.', 'Keep your back straight and your arms close to your body as you pivot your back foot and straighten your legs to get a full range of motion.', 'Retract your arms and then your body. Return to the neutral position in a slow and controlled manner.', 'Repeat to failure.', 'Then, reposition and repeat the same series of movements on the opposite side.']::TEXT[], 'Standing_Cable_Lift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Cable Wood Chop', 'Abdominals', 'Other', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Cable_Wood_Chop/0.jpg', ARRAY['Shoulders']::TEXT[], ARRAY['Connect a standard handle to a tower, and move the cable to the highest pulley position.', 'With your side to the cable, grab the handle with one hand and step away from the tower. You should be approximately arm''s length away from the pulley, with the tension of the weight on the cable. Your outstretched arm should be aligned with the cable.', 'With your feet positioned shoulder width apart, reach upward with your other hand and grab the handle with both hands. Your arms should still be fully extended.', 'In one motion, pull the handle down and across your body to your front knee while rotating your torso.', 'Keep your back and arms straight and core tight while you pivot your back foot and bend your knees to get a full range of motion.', 'Maintain your stance and straight arms. Return to the neutral position in a slow and controlled manner.', 'Repeat to failure.', 'Then, reposition and repeat the same series of movements on the opposite side.']::TEXT[], 'Standing_Cable_Wood_Chop', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Calf Raises', 'Calves', 'Calves', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Calf_Raises/0.jpg', NULL, ARRAY['Adjust the padded lever of the calf raise machine to fit your height.', 'Place your shoulders under the pads provided and position your toes facing forward (or using any of the two other positions described at the beginning of the chapter). The balls of your feet should be secured on top of the calf block with the heels extending off it. Push the lever up by extending your hips and knees until your torso is standing erect. The knees should be kept with a slight bend; never locked. Toes should be facing forward, outwards or inwards as described at the beginning of the chapter. This will be your starting position.', 'Raise your heels as you breathe out by extending your ankles as high as possible and flexing your calf. Ensure that the knee is kept stationary at all times. There should be no bending at any time. Hold the contracted position by a second before you start to go back down.', 'Go back slowly to the starting position as you breathe in by lowering your heels as you bend the ankles until calves are stretched.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Calf_Raises', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Concentration Curl', 'Biceps', 'Biceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Concentration_Curl/0.jpg', ARRAY['Forearms']::TEXT[], ARRAY['Taking a dumbbell in your working hand, lean forward. Allow your working arm to hang perpendicular to the ground with the elbow pointing out. This will be your starting position.', 'Flex the elbow to curl the weight, keeping the upper arm stationary. At the top of the repetition, flex the biceps and pause.', 'Lower the dumbbell back to the starting position.', 'Repeat the movement for the prescribed amount of repetitions.']::TEXT[], 'Standing_Concentration_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Dumbbell Calf Raise', 'Calves', 'Calves', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Dumbbell_Calf_Raise/0.jpg', NULL, ARRAY['Stand with your torso upright holding two dumbbells in your hands by your sides. Place the ball of the foot on a sturdy and stable wooden board (that is around 2-3 inches tall) while your heels extend off and touch the floor. This will be your starting position.', 'With the toes pointing either straight (to hit all parts equally), inwards (for emphasis on the outer head) or outwards (for emphasis on the inner head), raise the heels off the floor as you exhale by contracting the calves. Hold the top contraction for a second.', 'As you inhale, go back to the starting position by slowly lowering the heels.', 'Repeat for the recommended amount of times.']::TEXT[], 'Standing_Dumbbell_Calf_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Dumbbell Press', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Dumbbell_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Standing with your feet shoulder width apart, take a dumbbell in each hand. Raise the dumbbells to head height, the elbows out and about 90 degrees. This will be your starting position.', 'Maintaining strict technique with no leg drive or leaning back, extend through the elbow to raise the weights together directly above your head.', 'Pause, and slowly return the weight to the starting position.']::TEXT[], 'Standing_Dumbbell_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Dumbbell Reverse Curl', 'Biceps', 'Biceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Dumbbell_Reverse_Curl/0.jpg', ARRAY['Forearms']::TEXT[], ARRAY['To begin, stand straight with a dumbbell in each hand using a pronated grip (palms facing down). Your arms should be fully extended while your feet are shoulder width apart from each other. This is the starting position.', 'While holding the upper arms stationary, curl the weights while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a second as you squeeze the muscle.', 'Slowly begin to bring the dumbbells back to starting position as your breathe in.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Dumbbell_Reverse_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Dumbbell Straight-Arm Front Delt Raise Above Head', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Dumbbell_Straight-Arm_Front_Delt_Raise_Above_Head/0.jpg', NULL, ARRAY['Hold the dumbbells in front of your thighs, palms facing your thighs.', 'Keep your arms straight with a slight bend at the elbows but keep them locked. This will be your starting position.', 'Raise the dumbbells in a semicircular motion to arm''s length overhead as you exhale.', 'Slowly return to the starting position using the same path as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Dumbbell_Straight-Arm_Front_Delt_Raise_Above_Head', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Dumbbell Triceps Extension', 'Triceps', 'Triceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Dumbbell_Triceps_Extension/0.jpg', NULL, ARRAY['To begin, stand up with a dumbbell held by both hands. Your feet should be about shoulder width apart from each other. Slowly use both hands to grab the dumbbell and lift it over your head until both arms are fully extended.', 'The resistance should be resting in the palms of your hands with your thumbs around it. The palm of the hands should be facing up towards the ceiling. This will be your starting position.', 'Keeping your upper arms close to your head with elbows in and perpendicular to the floor, lower the resistance in a semicircular motion behind your head until your forearms touch your biceps. Tip: The upper arms should remain stationary and only the forearms should move. Breathe in as you perform this step.', 'Go back to the starting position by using the triceps to raise the dumbbell. Breathe out as you perform this step.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Dumbbell_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Dumbbell Upright Row', 'Traps', 'Back', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Dumbbell_Upright_Row/0.jpg', ARRAY['Biceps', 'Shoulders']::TEXT[], ARRAY['Grasp a dumbbell in each hand with a pronated (palms forward) grip that is slightly less than shoulder width. The dumbbells should be resting on top of your thighs. Your arms should be extended with a slight bend at the elbows and your back should be straight. This will be your starting position.', 'Use your side shoulders to lift the dumbbells as you exhale. The dumbbells should be close to the body as you move it up and the elbows should drive the motion. Continue to lift them until they nearly touch your chin. Tip: Your elbows should drive the motion. As you lift the dumbbells, your elbows should always be higher than your forearms. Also, keep your torso stationary and pause for a second at the top of the movement.', 'Lower the dumbbells back down slowly to the starting position. Inhale as you perform this portion of the movement.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Dumbbell_Upright_Row', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Elevated Quad Stretch', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Elevated_Quad_Stretch/0.jpg', NULL, ARRAY['Start by standing with your back about two to three feet away from a bench or step.', 'Lift one leg behind you and rest your foot on the step,either on your instep or the ball of your foot, whichever you find most comfortable.', 'Keep your supporting knee slightly bent and avoid letting that knee extend out beyond your toes. Switch sides.']::TEXT[], 'Standing_Elevated_Quad_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Front Barbell Raise Over Head', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Front_Barbell_Raise_Over_Head/0.jpg', NULL, ARRAY['To begin, stand straight with a barbell in your hands. You should grip the bar with palms facing down and a closer than shoulder width grip apart from each other.', 'Your feet should be shoulder width apart from each other. Your elbows should be slightly bent. This is the starting position.', 'Lift the barbell up until it is directly over your head while exhaling. Make sure to keep your elbows slightly bent when performing each repetition.', 'Once you feel the contraction, begin to lower the barbell back down to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Front_Barbell_Raise_Over_Head', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Gastrocnemius Calf Stretch', 'Calves', 'Calves', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Gastrocnemius_Calf_Stretch/0.jpg', ARRAY['Hamstrings']::TEXT[], ARRAY['Place your right heel on a step with your knee extended and lean forward to grab your right toe with your right hand. Your left knee should be slightly bent and your back should be straight.', 'Support your weight on your left leg and place your left hand on your left thigh.', 'Pull your right toes toward your knee until you feel a stretch in your calf.']::TEXT[], 'Standing_Gastrocnemius_Calf_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Hamstring and Calf Stretch', 'Hamstrings', 'Hamstrings', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Hamstring_and_Calf_Stretch/0.jpg', NULL, ARRAY['Being by looping a belt, band, or rope around one foot. While standing, place that foot forward.', 'Bend your back leg, while keeping the front one straight. Now raise the toes of your front foot off of the ground and lean forward.', 'Using the belt, pull on the top of the foot to increase the stretch in the calf. Hold for 10-20 seconds and repeat with the other foot.']::TEXT[], 'Standing_Hamstring_and_Calf_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Hip Circles', 'Abductors', 'Legs', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Hip_Circles/0.jpg', ARRAY['Adductors']::TEXT[], ARRAY['Begin standing on one leg, holding to a vertical support.', 'Raise the unsupported knee to 90 degrees. This will be your starting position.', 'Open the hip as far as possible, attempting to make a big circle with your knee.', 'Perform this movement slowly for a number of repetitions, and repeat on the other side.']::TEXT[], 'Standing_Hip_Circles', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Hip Flexors', 'Quadriceps', 'Quads', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Hip_Flexors/0.jpg', NULL, ARRAY['Stand up straight with the spine vertical, the left foot slightly in front of the right.', 'Bend both knees and lift the back heel off the floor as you press the right hip forward. You can''t get a thorough, deep stretch in this position, however, because it''s hard to relax the hip flexor and stand on it at the same time. Switch sides.']::TEXT[], 'Standing_Hip_Flexors', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Inner-Biceps Curl', 'Biceps', 'Biceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Inner-Biceps_Curl/0.jpg', NULL, ARRAY['Stand up with a dumbbell in each hand being held at arms length. The elbows should be close to the torso. Your legs should be at about shoulder''s width apart from each other.', 'Rotate the palms of the hands so that they are facing inward in a neutral position. This will be your starting position.', 'While holding the upper arms stationary, curl the weights out while contracting the biceps as you breathe out. Your wrist should turn so that when the weights are fully elevated you have supinated grip (palms facing up).', 'Only the forearms should move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Tip: Keep the forearms aligned with your outer deltoids.', 'Hold the contracted position for a second as you squeeze the biceps.', 'Slowly begin to bring the dumbbells back to the starting position as your breathe in. Remember to rotate the wrists as you lower the weight in order to switch back to a neutral grip.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Inner-Biceps_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Lateral Stretch', 'Abdominals', 'Other', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Lateral_Stretch/0.jpg', NULL, ARRAY['Take a slightly wider than hip distance stance with your knees slightly bent.', 'Place your right hand on your right hip to support the spine.', 'Raise your left arm in a vertical line and place your left hand behind your head. Keep it there as you incline your torso to the right.', 'Keep your weight evenly distributed between both legs (don''t lean into your left hip). Switch sides.']::TEXT[], 'Standing_Lateral_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Leg Curl', 'Hamstrings', 'Hamstrings', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Leg_Curl/0.jpg', NULL, ARRAY['Adjust the machine lever to fit your height and lie with your torso bent at the waist facing forward around 30-45 degrees (since an angled position is more favorable for hamstrings recruitment) with the pad of the lever on the back of your right leg (just a few inches under the calves) and the front of the right leg on top of the machine pad.', 'Keeping the torso bent forward, ensure your leg is fully stretched and grab the side handles of the machine. Position your toes straight. This will be your starting position.', 'As you exhale, curl your right leg up as far as possible without lifting the upper leg from the pad. Once you hit the fully contracted position, hold it for a second.', 'As you inhale, bring the legs back to the initial position. Repeat for the recommended amount of repetitions.', 'Perform the same exercise now for the left leg.']::TEXT[], 'Standing_Leg_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Long Jump', 'Quadriceps', 'Quads', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Long_Jump/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['This drill is best done in sand or other soft landing surface. Ensure that you are able to measure distance. Stand in a partial squat stance with feet shoulder width apart.', 'Utilizing a big arm swing and a countermovement of the legs, jump forward as far as you can.', 'Attempt to land with your feet out in front you, reaching as far as possible with your legs.', 'Measure the distance from your landing point to the starting point and track results.']::TEXT[], 'Standing_Long_Jump', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Low-Pulley Deltoid Raise', 'Shoulders', 'Shoulders', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Low-Pulley_Deltoid_Raise/0.jpg', ARRAY['Forearms']::TEXT[], ARRAY['Start by standing to the right side of a low pulley row. Use your left hand to come across the body and grab a single handle attached to the low pulley with a pronated grip (palms facing down). Rest your arm in front of you. Your right hand should grab the machine for better support and balance.', 'Make sure that your back is erect and your feet are shoulder width apart from each other. This is the starting position.', 'Begin to use the left hand and come across your body out until it is elevated to shoulder height while exhaling.', 'Feel the contraction at the top for a second and begin to slowly lower the handle back down to the original starting position while inhaling.', 'Repeat for the recommended amount of repetitions.', 'Switch arms and repeat the exercise.']::TEXT[], 'Standing_Low-Pulley_Deltoid_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Low-Pulley One-Arm Triceps Extension', 'Triceps', 'Triceps', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Low-Pulley_One-Arm_Triceps_Extension/0.jpg', ARRAY['Chest', 'Shoulders']::TEXT[], ARRAY['Grab a single handle with your left arm next to the low pulley machine. Turn away from the machine keeping the handle to the side of your body with your arm fully extended. Now use both hands to elevate the single handle directly above the head with the palm facing forward. Keep your upper arm completely vertical (perpendicular to the floor) and put your right hand on your left elbow to help keep it steady. This is the starting position.', 'Keeping your upper arms close to your head (elbows in) and perpendicular to the floor, lower the resistance in a semicircular motion behind your head until your forearms touch your biceps. Tip: The upper arms should remain stationary and only the forearms should move. Breathe in as you perform this step.', 'Go back to the starting position by using the triceps to raise the single handle. Breathe out as you perform this step.', 'Repeat for the recommended amount of repetitions.', 'Switch arms and repeat the exercise.']::TEXT[], 'Standing_Low-Pulley_One-Arm_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Military Press', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Military_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Start by placing a barbell that is about chest high on a squat rack. Once you have selected the weights, grab the barbell using a pronated (palms facing forward) grip. Make sure to grip the bar wider than shoulder width apart from each other.', 'Slightly bend the knees and place the barbell on your collar bone. Lift the barbell up keeping it lying on your chest. Take a step back and position your feet shoulder width apart from each other.', 'Once you pick up the barbell with the correct grip length, lift the bar up over your head by locking your arms. Hold at about shoulder level and slightly in front of your head. This is your starting position.', 'Lower the bar down to the collarbone slowly as you inhale.', 'Lift the bar back up to the starting position as you exhale.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Military_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Olympic Plate Hand Squeeze', 'Forearms', 'Arms', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Olympic_Plate_Hand_Squeeze/0.jpg', ARRAY['Biceps']::TEXT[], ARRAY['To begin, stand straight while holding a weight plate by the ridge at arm''s length in each hand using a neutral grip (palms facing in). You feet should be shoulder width apart from each other. This will be your starting position.', 'Lower the plates until the fingers are nearly extended but can still hold weights. Inhale as you lower the plates.', 'Now raise the plates back to the starting position as you exhale by closing your hands.', 'Repeat for the recommended amount of repetitions prescribed in your program.']::TEXT[], 'Standing_Olympic_Plate_Hand_Squeeze', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing One-Arm Cable Curl', 'Biceps', 'Biceps', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_One-Arm_Cable_Curl/0.jpg', NULL, ARRAY['Start out by grabbing single handle next to the low pulley machine. Make sure you are far enough from the machine so that your arm is supporting the weight.', 'Make sure that your upper arm is stationary, perpendicular to the floor with elbows in and palms facing forward. Your non lifting arm should be grabbing your waist. This will allow you to keep your balance.', 'Slowly begin to curl the single handle upwards while keeping the upper arm stationary until your forearm touches your bicep while exhaling. Tip: Only the forearm should move.', 'Hold the contraction position as you squeeze the bicep and then lower the single handle back down to the starting position as you inhale.', 'Repeat for the recommended amount of repetitions.', 'Switch arms while performing this exercise.']::TEXT[], 'Standing_One-Arm_Cable_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing One-Arm Dumbbell Curl Over Incline Bench', 'Biceps', 'Biceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_One-Arm_Dumbbell_Curl_Over_Incline_Bench/0.jpg', NULL, ARRAY['Stand on the back side of an incline bench as if you were going to be a spotter for someone. Have a dumbbell in one hand and rest it across the incline bench with a supinated (palms up) grip.', 'Position your non lifting hand at the corner or side of the incline bench. The chest should be pressed against the top part of the incline and your feet should be pressed against the floor at a wide stance. This is the starting position.', 'While holding the upper arm stationary, curl the dumbbell upward while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the dumbbell is at shoulder level. Hold the contracted position for a second.', 'Slowly begin to bring the dumbbells back to starting position as your breathe in.', 'Repeat for the recommended amount of repetitions.', 'Switch arms while performing this exercise.']::TEXT[], 'Standing_One-Arm_Dumbbell_Curl_Over_Incline_Bench', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing One-Arm Dumbbell Triceps Extension', 'Triceps', 'Triceps', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_One-Arm_Dumbbell_Triceps_Extension/0.jpg', ARRAY['Chest', 'Shoulders']::TEXT[], ARRAY['To begin, stand up with a dumbbell held in one hand. Your feet should be about shoulder width apart from each other. Now fully extend the arm with the dumbbell over your head. Tip: The small finger of your hand should be facing the ceiling and the palm of your hand should be facing forward. The dumbbell should be above your head.', 'This will be your starting position.', 'Keeping your upper arm close to your head (elbows in) and perpendicular to the floor, lower the resistance in a semicircular motion behind your head until your forearm touch your bicep. Tip: The upper arm should remain stationary and only the forearm should move. Breathe in as you perform this step.', 'Go back to the starting position by using the triceps to raise the dumbbell. Breathe out as you perform this step.', 'Repeat for the recommended amount of repetitions.', 'Switch arms and repeat the exercise.']::TEXT[], 'Standing_One-Arm_Dumbbell_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Overhead Barbell Triceps Extension', 'Triceps', 'Triceps', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Overhead_Barbell_Triceps_Extension/0.jpg', ARRAY['Shoulders']::TEXT[], ARRAY['To begin, stand up holding a barbell or e-z bar using a pronated grip (palms facing forward) with your hands closer than shoulder width apart from each other. Your feet should be about shoulder width apart.', 'Now elevate the barbell above your head until your arms are fully extended. Keep your elbows in. This will be your starting position.', 'Keeping your upper arms close to your head and elbows in, perpendicular to the floor, lower the resistance in a semicircular motion behind your head until your forearms touch your biceps. Tip: The upper arms should remain stationary and only the forearms should move. Breathe in as you perform this step.', 'Go back to the starting position by using the triceps to raise the barbell. Breathe out as you perform this step.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Overhead_Barbell_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Palm-In One-Arm Dumbbell Press', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Palm-In_One-Arm_Dumbbell_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Start by having a dumbbell in one hand with your arm fully extended to the side using a neutral grip. Use your other arm to hold on to an incline bench to keep your balance.', 'Your feet should be shoulder width apart from each other. Now slowly lift the dumbbell up until you create a 90 degree angle with your arm. Note: Your forearm should be perpendicular to the floor. Continue to maintain a neutral grip throughout the entire exercise.', 'Slowly lift the dumbbell up until your arm is fully extended. This the starting position.', 'While inhaling lower the weight down until your arm is at a 90 degree angle again.', 'Feel the contraction for a second and then lift the weight back up towards the starting position while exhaling. Remember to hold on to the incline bench and keep your feet positioned to keep balance during the exercise.', 'Repeat for the recommended amount of repetitions.', 'Switch arms and repeat the exercise.']::TEXT[], 'Standing_Palm-In_One-Arm_Dumbbell_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Palms-In Dumbbell Press', 'Shoulders', 'Shoulders', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Palms-In_Dumbbell_Press/0.jpg', ARRAY['Triceps']::TEXT[], ARRAY['Start by having a dumbbell in each hand with your arm fully extended to the side using a neutral grip. Your feet should be shoulder width apart from each other. Now slowly lift the dumbbells up until you create a 90 degree angle with your arms. Note: Your forearms should be perpendicular to the floor. This the starting position.', 'Continue to maintain a neutral grip throughout the entire exercise. Slowly lift the dumbbells up until your arms are fully extended.', 'While inhaling lower the weights down until your arm is at a 90 degree angle again.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Palms-In_Dumbbell_Press', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Palms-Up Barbell Behind The Back Wrist Curl', 'Forearms', 'Arms', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Palms-Up_Barbell_Behind_The_Back_Wrist_Curl/0.jpg', NULL, ARRAY['Start by standing straight and holding a barbell behind your glutes at arm''s length while using a pronated grip (palms will be facing back away from the glutes) and having your hands shoulder width apart from each other.', 'You should be looking straight forward while your feet are shoulder width apart from each other. This is the starting position.', 'While exhaling, slowly elevate the barbell up by curling your wrist in a semi-circular motion towards the ceiling. Note: Your wrist should be the only body part moving for this exercise.', 'Hold the contraction for a second and lower the barbell back down to the starting position while inhaling.', 'Repeat for the recommended amount of repetitions.', 'When finished, lower the barbell down to the squat rack or the floor by bending the knees. Tip: It is easiest to either pick it up from a squat rack or have a partner hand it to you.']::TEXT[], 'Standing_Palms-Up_Barbell_Behind_The_Back_Wrist_Curl', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Pelvic Tilt', 'Lower back', 'Back', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Pelvic_Tilt/0.jpg', ARRAY['Glutes']::TEXT[], ARRAY['Start off with your feet hip-distance apart.', 'Bend your knees slightly to keep them soft and springy.', 'You may want to move your pelvis forward and backward and back few times before holding the tailbone forward in this stretch.']::TEXT[], 'Standing_Pelvic_Tilt', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Rope Crunch', 'Abdominals', 'Other', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Rope_Crunch/0.jpg', NULL, ARRAY['Attach a rope to a high pulley and select an appropriate weight.', 'Stand with your back to the cable tower. Take the rope with both hands over your shoulders, holding it to your upper chest. This will be your starting position.', 'Perform the movement by flexing the spine, crunching the weight down as far as you can.', 'Hold the peak contraction for a moment before returning to the starting position.']::TEXT[], 'Standing_Rope_Crunch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Soleus And Achilles Stretch', 'Calves', 'Calves', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Soleus_And_Achilles_Stretch/0.jpg', NULL, ARRAY['Stand with your feet hip-distance apart, one foot slightly in front of the other.', 'Bend both knees, keeping your back heel on the floor. Switch sides.']::TEXT[], 'Standing_Soleus_And_Achilles_Stretch', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Toe Touches', 'Hamstrings', 'Hamstrings', '', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Toe_Touches/0.jpg', ARRAY['Calves']::TEXT[], ARRAY['Stand with some space in front and behind you.', 'Bend at the waist, keeping your legs straight, until you can relax and let your upper body hang down in front of you. Let your arms and hands hang down naturally. Hold for 10 to 20 seconds.']::TEXT[], 'Standing_Toe_Touches', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Towel Triceps Extension', 'Triceps', 'Triceps', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Towel_Triceps_Extension/0.jpg', NULL, ARRAY['To begin, stand up with both arms fully extended above the head holding one end of a towel with both hands. Your elbows should be in and the arms perpendicular to the floor with the palms facing each other while your feet should be shoulder width apart from each other. This is the starting position.', 'Now communicate with your partner so that he/she can grip the other side of the towel to apply resistance. Keeping your upper arms close to your head (elbows in) and perpendicular to the floor, lower the resistance in a semicircular motion behind your head until your forearms touch your biceps. Tip: The upper arms should remain stationary and only the forearms should move. Breathe in as you perform this step.', 'Go back to the starting position by using the triceps to raise the towel. Breathe out as you perform this step.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Standing_Towel_Triceps_Extension', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Standing Two-Arm Overhead Throw', 'Shoulders', 'Shoulders', 'Medicine ball', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Standing_Two-Arm_Overhead_Throw/0.jpg', ARRAY['Chest', 'Lats']::TEXT[], ARRAY['Stand with your feet shoulder width apart holding a medicine ball in both hands. To begin, reach the medicine ball deep behind your head as you bend the knees slightly and lean back.', 'Violently throw the ball forward, flexing at the hip and using your whole body to complete the movement.', 'The medicine ball can be thrown to a partner or to a wall, receiving it as it bounces back.']::TEXT[], 'Standing_Two-Arm_Overhead_Throw', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Star Jump', 'Quadriceps', 'Quads', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Star_Jump/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings', 'Shoulders']::TEXT[], ARRAY['Begin in a relaxed stance with your feet shoulder width apart and hold your arms close to the body.', 'To initiate the move, squat down halfway and explode back up as high as possible. Fully extend your entire body, spreading your legs and arms away from the body.', 'As you land, bring your limbs back in and absorb your impact through the legs.']::TEXT[], 'Star_Jump', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Step-up with Knee Raise', 'Glutes', 'Legs', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Step-up_with_Knee_Raise/0.jpg', ARRAY['Hamstrings', 'Quadriceps']::TEXT[], ARRAY['Stand facing a box or bench of an appropriate height with your feet together. This will be your starting position.', 'Begin the movement by stepping up, putting your left foot on the top of the bench. Extend through the hip and knee of your front leg to stand up on the box. As you stand on the box with your left leg, flex your right knee and hip, bringing your knee as high as you can.', 'Reverse this motion to step down off the box, and then repeat the sequence on the opposite leg.']::TEXT[], 'Step-up_with_Knee_Raise', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Step Mill', 'Quadriceps', 'Quads', 'Machine', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Step_Mill/0.jpg', ARRAY['Calves', 'Glutes', 'Hamstrings']::TEXT[], ARRAY['To begin, step onto the stepmill and select the desired option from the menu. You can choose a manual setting, or you can select a program to run. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise. Use caution so that you don''t trip as you climb the stairs. It is recommended that you maintain your grip on the handles so that you don''t fall.', 'Stepmills offer convenience, cardiovascular benefits, and usually have less impact than running outside while offering a similar rate of calories burned. They are typically much harder than other cardio equipment. A 150 lb person will typically burn over 300 calories in 30 minutes, compared to about 175 calories walking.']::TEXT[], 'Step_Mill', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Stiff-Legged Barbell Deadlift', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Stiff-Legged_Barbell_Deadlift/0.jpg', ARRAY['Glutes', 'Lower back']::TEXT[], ARRAY['Grasp a bar using an overhand grip (palms facing down). You may need some wrist wraps if using a significant amount of weight.', 'Stand with your torso straight and your legs spaced using a shoulder width or narrower stance. The knees should be slightly bent. This is your starting position.', 'Keeping the knees stationary, lower the barbell to over the top of your feet by bending at the hips while keeping your back straight. Keep moving forward as if you were going to pick something from the floor until you feel a stretch on the hamstrings. Inhale as you perform this movement.', 'Start bringing your torso up straight again by extending your hips until you are back at the starting position. Exhale as you perform this movement.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Stiff-Legged_Barbell_Deadlift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Stiff-Legged Dumbbell Deadlift', 'Hamstrings', 'Hamstrings', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Stiff-Legged_Dumbbell_Deadlift/0.jpg', ARRAY['Glutes', 'Lower back']::TEXT[], ARRAY['Grasp a couple of dumbbells holding them by your side at arm''s length.', 'Stand with your torso straight and your legs spaced using a shoulder width or narrower stance. The knees should be slightly bent. This is your starting position.', 'Keeping the knees stationary, lower the dumbbells to over the top of your feet by bending at the waist while keeping your back straight. Keep moving forward as if you were going to pick something from the floor until you feel a stretch on the hamstrings. Exhale as you perform this movement', 'Start bringing your torso up straight again by extending your hips and waist until you are back at the starting position. Inhale as you perform this movement.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Stiff-Legged_Dumbbell_Deadlift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Stiff Leg Barbell Good Morning', 'Lower back', 'Back', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Stiff_Leg_Barbell_Good_Morning/0.jpg', ARRAY['Glutes', 'Hamstrings']::TEXT[], ARRAY['This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place the back of your shoulders (slightly below the neck) across it.', 'Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.', 'Step away from the rack and position your legs using a shoulder width medium stance. Keep your head up at all times as looking down will get you off balance and also maintain a straight back. This will be your starting position.', 'Keeping your legs stationary, move your torso forward by bending at the hips while inhaling. Lower your torso until it is parallel with the floor.', 'Begin to raise the bar as you exhale by elevating your torso back to the starting position.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Stiff_Leg_Barbell_Good_Morning', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Stomach Vacuum', 'Abdominals', 'Other', 'Body only', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Stomach_Vacuum/0.jpg', NULL, ARRAY['To begin, stand straight with your feet shoulder width apart from each other. Place your hands on your hips. This is the starting position.', 'Now slowly inhale as much air as possible and then start to exhale as much as possible while bringing your stomach in as much as possible and hold this position. Try to visualize your navel touching your backbone.', 'One isometric contraction is around 20 seconds. During the 20 second hold, try to breathe normally. Then inhale and bring your stomach back to the starting position.', 'Once you have practiced this exercise, try to perform this exercise for longer than 20 seconds. Tip: You can work your way up to 40-60 seconds.', 'Repeat for the recommended amount of sets.']::TEXT[], 'Stomach_Vacuum', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Straight-Arm Dumbbell Pullover', 'Chest', 'Chest', 'Dumbbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Straight-Arm_Dumbbell_Pullover/0.jpg', ARRAY['Lats', 'Shoulders', 'Triceps']::TEXT[], ARRAY['Place a dumbbell standing up on a flat bench.', 'Ensuring that the dumbbell stays securely placed at the top of the bench, lie perpendicular to the bench (torso across it as in forming a cross) with only your shoulders lying on the surface. Hips should be below the bench and legs bent with feet firmly on the floor. The head will be off the bench as well.', 'Grasp the dumbbell with both hands and hold it straight over your chest at arms length. Both palms should be pressing against the underside one of the sides of the dumbbell. This will be your starting position.
Caution: Always ensure that the dumbbell used for this exercise is secure. Using a dumbbell with loose plates can result in the dumbbell falling apart and falling on your face.', 'While keeping your arms straight, lower the weight slowly in an arc behind your head while breathing in until you feel a stretch on the chest.', 'At that point, bring the dumbbell back to the starting position using the arc through which the weight was lowered and exhale as you perform this movement.', 'Hold the weight on the initial position for a second and repeat the motion for the prescribed number of repetitions.']::TEXT[], 'Straight-Arm_Dumbbell_Pullover', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Straight-Arm Pulldown', 'Lats', 'Back', 'Cable', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Straight-Arm_Pulldown/0.jpg', NULL, ARRAY['You will start by grabbing the wide bar from the top pulley of a pulldown machine and using a wider than shoulder-width pronated (palms down) grip. Step backwards two feet or so.', 'Bend your torso forward at the waist by around 30-degrees with your arms fully extended in front of you and a slight bend at the elbows. If your arms are not fully extended then you need to step a bit more backwards until they are. Once your arms are fully extended and your torso is slightly bent at the waist, tighten the lats and then you are ready to begin.', 'While keeping the arms straight, pull the bar down by contracting the lats until your hands are next to the side of the thighs. Breathe out as you perform this step.', 'While keeping the arms straight, go back to the starting position while breathing in.', 'Repeat for the recommended amount of repetitions.']::TEXT[], 'Straight-Arm_Pulldown', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Straight Bar Bench Mid Rows', 'Middle back', 'Back', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Straight_Bar_Bench_Mid_Rows/0.jpg', ARRAY['Biceps', 'Lats']::TEXT[], ARRAY['Place a loaded barbell on the end of a bench. Standing on the bench behind the bar, take a medium, pronated grip. Stand with your hips back and chest up, maintaining a neutral spine. This will be your starting position.', 'Row the bar to your torso by retracting the shoulder blades and flexing the elbows. Use a controlled movement with no jerking.', 'After a brief pause, slowly return the bar to the starting position, ensuring to go all the way down.']::TEXT[], 'Straight_Bar_Bench_Mid_Rows', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Straight Raises on Incline Bench', 'Shoulders', 'Shoulders', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Straight_Raises_on_Incline_Bench/0.jpg', ARRAY['Traps']::TEXT[], ARRAY['Place a bar on the ground behind the head of an incline bench.', 'Lay on the bench face down. With a pronated grip, pick the barbell up from the floor, keeping your arms straight. Allow the bar to hang straight down. This will be your starting position.', 'To begin, raise the barbell out in front of your head while keeping your arms extended.', 'Return to the starting position.']::TEXT[], 'Straight_Raises_on_Incline_Bench', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Stride Jump Crossover', 'Quadriceps', 'Quads', 'Other', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Stride_Jump_Crossover/0.jpg', ARRAY['Abductors', 'Adductors', 'Calves', 'Hamstrings']::TEXT[], ARRAY['Stand to the side of a box with your inside foot on top of it, close to the edge.', 'Begin by swinging the arms upward as you push through the top leg, jumping upward as high as possible. Attempt to drive the opposite knee upward.', 'Land in the opposite position that you started, on the opposite side of the box. The foot that was initially on the box will now be on the ground, with the opposite foot now on the box.', 'Repeat the movement, crossing back over to the other side.']::TEXT[], 'Stride_Jump_Crossover', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sumo Deadlift', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sumo_Deadlift/0.jpg', ARRAY['Adductors', 'Forearms', 'Glutes', 'Lower back', 'Middle back', 'Quadriceps', 'Traps']::TEXT[], ARRAY['Begin with a bar loaded on the ground. Approach the bar so that the bar intersects the middle of the feet. The feet should be set very wide, near the collars. Bend at the hips to grip the bar. The arms should be directly below the shoulders, inside the legs, and you can use a pronated grip, a mixed grip, or hook grip. Relax the shoulders, which in effect lengthens your arms.', 'Take a breath, and then lower your hips, looking forward with your head with your chest up. Drive through the floor, spreading your feet apart, with your weight on the back half of your feet. Extend through the hips and knees.', 'As the bar passes through the knees, lean back and drive the hips into the bar, pulling your shoulder blades together.', 'Return the weight to the ground by bending at the hips and controlling the weight on the way down.']::TEXT[], 'Sumo_Deadlift', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;
INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ('Sumo Deadlift with Bands', 'Hamstrings', 'Hamstrings', 'Barbell', 'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/Sumo_Deadlift_with_Bands/0.jpg', ARRAY['Adductors', 'Forearms', 'Glutes', 'Lower back', 'Middle back', 'Quadriceps', 'Traps']::TEXT[], ARRAY['To deadlift with short bands, simply loop them over the bar before you start, and step into them to set up. Ensure that they under the back half of your foot, directly where you are driving into the floor.', 'Begin with a bar loaded on the ground. Approach the bar so that the bar intersects the middle of the feet. The feet should be set very wide, near the collars. Bend at the hips to grip the bar. The arms should be directly below the shoulders, inside the legs, and you can use a pronated grip, a mixed grip, or hook grip.', 'Take a breath, and then lower your hips, looking forward with your head with your chest up. Drive through the floor, spreading your feet apart, with your weight on the back half of your feet. Extend through the hips and knees.', 'As the bar passes through the knees, lean back and drive the hips into the bar, pulling your shoulder blades together.', 'Return the weight to the ground by bending at the hips and controlling the weight on the way down.']::TEXT[], 'Sumo_Deadlift_with_Bands', NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;