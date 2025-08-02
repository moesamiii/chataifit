import 'package:flutter/material.dart';

final Map<String, IconData> categories = {
  "Shoulders": Icons.accessibility_new,
  "Biceps": Icons.fitness_center,
  "Triceps": Icons.sports_gymnastics,
  "Back": Icons.accessibility,
  "Chest": Icons.favorite,
  "Abs": Icons.grid_view,
  "Lower Back": Icons.back_hand,
  "Glutes": Icons.directions_walk,
  "Quadriceps": Icons.run_circle,
  "Hamstrings": Icons.directions_run,
};

final Map<String, List<Map<String, dynamic>>> workouts = {
  "Shoulders": [
    {
      "name": "Dumbbell Shoulder Press",
      "duration": 10,
      "howTo": "Hold dumbbells at shoulder height, palms facing forward. Press up overhead and lower slowly.",
      "videoUrl": "https://www.youtube.com/watch?v=qEwKCR5JCog"
    },
    {
      "name": "Dumbbell Lateral Raise",
      "duration": 8,
      "howTo": "Raise dumbbells to the sides until shoulder height, then lower slowly.",
      "videoUrl": "https://www.youtube.com/watch?v=3VcKaXpzqRo"
    },
    {
      "name": "Dumbbell Front Raise",
      "duration": 8,
      "howTo": "Raise dumbbells straight in front to shoulder level, then lower slowly.",
      "videoUrl": "https://www.youtube.com/watch?v=-t7fuZ0KhDA"
    },
    {
      "name": "Dumbbell Upright Row",
      "duration": 10,
      "howTo": "Pull dumbbells up along the body to chest height, elbows leading.",
      "videoUrl": "https://www.youtube.com/watch?v=7xwGzLMqSTg"
    },
    {
      "name": "Arnold Press",
      "duration": 12,
      "howTo": "Start palms facing you, rotate dumbbells outward while pressing overhead.",
      "videoUrl": "https://www.youtube.com/watch?v=vj2w851ZHRM"
    },
  ],
  "Biceps": [
    {
      "name": "Dumbbell Curls",
      "duration": 12,
      "howTo": "Curl the dumbbells upward while keeping elbows tight. Lower under control.",
      "videoUrl": "https://www.youtube.com/watch?v=ykJmrZ5v0Oo"
    },
    {
      "name": "Hammer Curls",
      "duration": 10,
      "howTo": "Keep palms facing inward as you curl the dumbbells up and down.",
      "videoUrl": "https://www.youtube.com/watch?v=zC3nLlEvin4"
    },
    {
      "name": "Concentration Curls",
      "duration": 10,
      "howTo": "Sit down, rest elbow on thigh and curl dumbbell in controlled motion.",
      "videoUrl": "https://www.youtube.com/watch?v=soxrZlIl35U"
    },
    {
      "name": "Zottman Curls",
      "duration": 12,
      "howTo": "Curl up with palms up, rotate palms down on the way down.",
      "videoUrl": "https://www.youtube.com/watch?v=vAUAkzK2dUw"
    },
    {
      "name": "Incline Dumbbell Curls",
      "duration": 10,
      "howTo": "Lie on incline bench and curl dumbbells from fully extended arms.",
      "videoUrl": "https://www.youtube.com/watch?v=soxrZlIl35U"
    },
  ],
  "Triceps": [
    {
      "name": "Overhead Dumbbell Extension",
      "duration": 10,
      "howTo": "Hold one dumbbell overhead with both hands. Lower it behind your head and extend back up.",
      "videoUrl": "https://www.youtube.com/watch?v=_gsUck-7M74"
    },
    {
      "name": "Dumbbell Kickbacks",
      "duration": 8,
      "howTo": "Lean forward, extend dumbbells back by straightening the elbows.",
      "videoUrl": "https://www.youtube.com/watch?v=6SS1-UXVdvc"
    },
    {
      "name": "Lying Triceps Extension",
      "duration": 10,
      "howTo": "Lie down and lower dumbbells from above chest to behind head.",
      "videoUrl": "https://www.youtube.com/watch?v=ir5PsbniVSc"
    },
    {
      "name": "Close Grip Dumbbell Press",
      "duration": 12,
      "howTo": "Hold dumbbells together and press straight up from chest.",
      "videoUrl": "https://www.youtube.com/watch?v=Qj2KBEWzUBI"
    },
    {
      "name": "One Arm Overhead Extension",
      "duration": 8,
      "howTo": "Hold dumbbell overhead with one hand, lower behind head, extend.",
      "videoUrl": "https://www.youtube.com/watch?v=2i6nH9tOQGk"
    },
  ],
  "Back": [
    {
      "name": "Dumbbell Rows",
      "duration": 12,
      "howTo": "Pull dumbbells towards your sides while keeping your back flat.",
      "videoUrl": "https://www.youtube.com/watch?v=pYcpY20QaE8"
    },
    {
      "name": "Renegade Rows",
      "duration": 10,
      "howTo": "In pushup position, row one dumbbell at a time to your side.",
      "videoUrl": "https://www.youtube.com/watch?v=roCP6wCXPqo"
    },
    {
      "name": "Reverse Fly",
      "duration": 10,
      "howTo": "Bend over, raise dumbbells out to the sides in a T-shape.",
      "videoUrl": "https://www.youtube.com/watch?v=6YMdEzv2YwI"
    },
    {
      "name": "Single Arm Row",
      "duration": 10,
      "howTo": "Place one knee on bench, row dumbbell to your side.",
      "videoUrl": "https://www.youtube.com/watch?v=pYcpY20QaE8"
    },
    {
      "name": "Deadlifts",
      "duration": 12,
      "howTo": "Lower dumbbells from hips with straight back, stand up straight.",
      "videoUrl": "https://www.youtube.com/watch?v=ytGaGIn3SjE"
    },
  ],
  "Chest": [
    {
      "name": "Dumbbell Chest Press",
      "duration": 12,
      "howTo": "Lie on back and press dumbbells from chest straight up. Lower slowly.",
      "videoUrl": "https://www.youtube.com/watch?v=VmB1G1K7v94"
    },
    {
      "name": "Dumbbell Fly",
      "duration": 10,
      "howTo": "Lie on bench, open arms wide then bring together over chest.",
      "videoUrl": "https://www.youtube.com/watch?v=eozdVDA78K0"
    },
    {
      "name": "Incline Dumbbell Press",
      "duration": 12,
      "howTo": "Press dumbbells from upper chest while lying on incline bench.",
      "videoUrl": "https://www.youtube.com/watch?v=8iPEnn-ltC8"
    },
    {
      "name": "Decline Dumbbell Press",
      "duration": 10,
      "howTo": "Press dumbbells upward while lying on a decline bench.",
      "videoUrl": "https://www.youtube.com/watch?v=Y6T6xC3ZRnQ"
    },
    {
      "name": "Pullover",
      "duration": 10,
      "howTo": "Hold dumbbell with both hands, move in arc from chest to behind head.",
      "videoUrl": "https://www.youtube.com/watch?v=pAplQXk3dkU"
    },
  ],
  "Abs": [
    {
      "name": "Russian Twists",
      "duration": 8,
      "howTo": "Sit on floor, twist torso side to side while holding dumbbell.",
      "videoUrl": "https://www.youtube.com/watch?v=wkD8rjkodUI"
    },
    {
      "name": "Weighted Sit-Ups",
      "duration": 10,
      "howTo": "Hold dumbbell on chest while performing sit-ups.",
      "videoUrl": "https://www.youtube.com/watch?v=1fbU_MkV7NE"
    },
    {
      "name": "Dumbbell Leg Raises",
      "duration": 10,
      "howTo": "Hold dumbbell between feet, lift legs up keeping core tight.",
      "videoUrl": "https://www.youtube.com/watch?v=l4kQd9eWclE"
    },
    {
      "name": "Dumbbell Side Bends",
      "duration": 8,
      "howTo": "Hold dumbbell on one side, bend sideways then switch.",
      "videoUrl": "https://www.youtube.com/watch?v=KTWZgRJ5C_k"
    },
    {
      "name": "Toe Touch Crunches",
      "duration": 8,
      "howTo": "Hold dumbbell and reach for your toes while crunching upward.",
      "videoUrl": "https://www.youtube.com/watch?v=1yHJDpVrfAw"
    },
  ],
  "Lower Back": [
    {
      "name": "Superman Pose",
      "duration": 6,
      "howTo": "Lie on stomach, raise arms and legs simultaneously like flying.",
      "videoUrl": "https://www.youtube.com/watch?v=z6PJMT2y8GQ"
    },
    {
      "name": "Bird Dog",
      "duration": 8,
      "howTo": "Extend opposite arm and leg while balancing on all fours.",
      "videoUrl": "https://www.youtube.com/watch?v=wiFNA3sqjCA"
    },
    {
      "name": "Reverse Hyperextensions",
      "duration": 10,
      "howTo": "Lie on bench, raise legs behind while engaging lower back.",
      "videoUrl": "https://www.youtube.com/watch?v=rCEMSe2aiXI"
    },
    {
      "name": "Dumbbell Good Mornings",
      "duration": 10,
      "howTo": "Hold dumbbells at shoulders, hinge at hips and return up.",
      "videoUrl": "https://www.youtube.com/watch?v=vRPvPFZzVtY"
    },
    {
      "name": "Back Extensions",
      "duration": 12,
      "howTo": "Use stability ball or mat, raise upper body from hips.",
      "videoUrl": "https://www.youtube.com/watch?v=ph3pddpKzzw"
    },
  ],
  "Glutes": [
    {
      "name": "Dumbbell Hip Thrusts",
      "duration": 12,
      "howTo": "Place dumbbell on hips, thrust upward and squeeze glutes.",
      "videoUrl": "https://www.youtube.com/watch?v=LM8XHLYJoYs"
    },
    {
      "name": "Dumbbell Step-Ups",
      "duration": 10,
      "howTo": "Step onto platform with dumbbells in hand, switch legs.",
      "videoUrl": "https://www.youtube.com/watch?v=dQqApCGd5Ss"
    },
    {
      "name": "Dumbbell Sumo Squats",
      "duration": 10,
      "howTo": "Hold dumbbell between legs, squat with wide stance.",
      "videoUrl": "https://www.youtube.com/watch?v=G2tPddjznXc"
    },
    {
      "name": "Glute Bridge March",
      "duration": 8,
      "howTo": "Bridge hips up, alternate lifting knees.",
      "videoUrl": "https://www.youtube.com/watch?v=3CQyWkl6h8s"
    },
    {
      "name": "Split Squats",
      "duration": 10,
      "howTo": "With one foot behind on bench, lower and raise body with dumbbells.",
      "videoUrl": "https://www.youtube.com/watch?v=2C-uNgKwPLE"
    },
  ],
  "Quadriceps": [
    {
      "name": "Goblet Squat",
      "duration": 12,
      "howTo": "Hold dumbbell at chest and squat deeply while keeping chest up.",
      "videoUrl": "https://www.youtube.com/watch?v=6xwGFn-J_Qo"
    },
    {
      "name": "Dumbbell Lunges",
      "duration": 10,
      "howTo": "Step forward with dumbbells, lower into lunge and return.",
      "videoUrl": "https://www.youtube.com/watch?v=wrwwXE_x-pQ"
    },
    {
      "name": "Dumbbell Step-Ups",
      "duration": 10,
      "howTo": "Step onto bench holding dumbbells, alternate legs.",
      "videoUrl": "https://www.youtube.com/watch?v=dQqApCGd5Ss"
    },
    {
      "name": "Bulgarian Split Squats",
      "duration": 10,
      "howTo": "Back foot elevated, perform squats with dumbbells.",
      "videoUrl": "https://www.youtube.com/watch?v=2C-uNgKwPLE"
    },
    {
      "name": "Wall Sit with Dumbbell",
      "duration": 8,
      "howTo": "Hold dumbbell on thighs while doing wall sit.",
      "videoUrl": "https://www.youtube.com/watch?v=-cdph8hv0O0"
    },
  ],
  "Hamstrings": [
    {
      "name": "Dumbbell Deadlifts",
      "duration": 12,
      "howTo": "Keep back straight, bend at hips, lower dumbbells, then return up.",
      "videoUrl": "https://www.youtube.com/watch?v=ytGaGIn3SjE"
    },
    {
      "name": "Stiff-Leg Deadlifts",
      "duration": 10,
      "howTo": "Keep legs straight, hinge at hips lowering dumbbells, return.",
      "videoUrl": "https://www.youtube.com/watch?v=8QyNcRr0J-A"
    },
    {
      "name": "Dumbbell Glute Bridge",
      "duration": 10,
      "howTo": "Lie down with knees bent, dumbbell on hips, thrust up.",
      "videoUrl": "https://www.youtube.com/watch?v=E9sPtj3hgGo"
    },
    {
      "name": "Single Leg Deadlift",
      "duration": 10,
      "howTo": "Balance on one leg, hinge at hips lowering dumbbell, then return.",
      "videoUrl": "https://www.youtube.com/watch?v=5PVXkqCExPc"
    },
    {
      "name": "Bridge Walkouts",
      "duration": 8,
      "howTo": "Bridge position, slowly walk feet out and back in.",
      "videoUrl": "https://www.youtube.com/watch?v=Xzdl5jwoPiE"
    },
  ],
};
