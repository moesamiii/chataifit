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
      "howTo": "Hold dumbbells at shoulder height, palms facing forward. Press up overhead and lower slowly."
    },
    {
      "name": "Lateral Raise",
      "duration": 8,
      "howTo": "Raise arms to the side until shoulder height. Keep arms slightly bent and control movement."
    },
    {
      "name": "Front Raise",
      "duration": 8,
      "howTo": "Lift dumbbells straight in front of you to shoulder height. Lower slowly and repeat."
    },
    {
      "name": "Arnold Press",
      "duration": 10,
      "howTo": "Start with palms facing you. Rotate wrists while pressing dumbbells overhead."
    },
    {
      "name": "Upright Row",
      "duration": 10,
      "howTo": "Hold dumbbells and pull them up to chin level, elbows leading the way."
    },
    {
      "name": "Dumbbell Shrugs",
      "duration": 6,
      "howTo": "Hold dumbbells at sides and shrug shoulders up and down."
    },
  ],
  "Biceps": [
    {
      "name": "Dumbbell Curls",
      "duration": 12,
      "howTo": "Curl the dumbbells upward while keeping elbows tight. Lower under control."
    },
    {
      "name": "Hammer Curls",
      "duration": 10,
      "howTo": "Keep palms facing each other. Curl the dumbbells upward in a hammer motion."
    },
    {
      "name": "Concentration Curls",
      "duration": 10,
      "howTo": "Sit and curl dumbbell with one arm resting against your thigh."
    },
    {
      "name": "Zottman Curls",
      "duration": 12,
      "howTo": "Curl up with palms facing up, rotate at the top, lower with palms down."
    },
    {
      "name": "Cross-Body Curls",
      "duration": 10,
      "howTo": "Curl each dumbbell toward the opposite shoulder, alternating arms."
    },
    {
      "name": "Incline Dumbbell Curl",
      "duration": 12,
      "howTo": "Sit back on an incline bench and perform bicep curls with dumbbells."
    },
  ],
  "Triceps": [
    {
      "name": "Overhead Dumbbell Extension",
      "duration": 10,
      "howTo": "Hold one dumbbell overhead with both hands. Lower it behind your head and extend back up."
    },
    {
      "name": "Dumbbell Kickbacks",
      "duration": 8,
      "howTo": "Bend forward, upper arms parallel to torso, extend forearms straight back."
    },
    {
      "name": "Skull Crushers",
      "duration": 10,
      "howTo": "Lie down and lower dumbbells toward forehead. Extend arms back up."
    },
    {
      "name": "Close-Grip Dumbbell Press",
      "duration": 12,
      "howTo": "Press dumbbells close together over chest to target triceps."
    },
    {
      "name": "Single-Arm Overhead Extension",
      "duration": 8,
      "howTo": "Use one arm to lift a dumbbell overhead and lower behind the head."
    },
  ],
  "Back": [
    {
      "name": "Dumbbell Rows",
      "duration": 12,
      "howTo": "Pull dumbbells towards your sides while keeping your back flat."
    },
    {
      "name": "Reverse Flys",
      "duration": 10,
      "howTo": "With slight bend, raise arms out to sides like wings. Squeeze shoulder blades."
    },
    {
      "name": "Bent Over Rows",
      "duration": 12,
      "howTo": "Keep knees bent and back straight while rowing dumbbells to waist."
    },
    {
      "name": "Renegade Rows",
      "duration": 12,
      "howTo": "In plank, row one dumbbell at a time while stabilizing with the other."
    },
    {
      "name": "Dead Rows",
      "duration": 10,
      "howTo": "Start from a deadlift position, then pull dumbbells to your waist."
    },
  ],
  "Chest": [
    {
      "name": "Dumbbell Chest Press",
      "duration": 12,
      "howTo": "Lie on back and press dumbbells from chest straight up. Lower slowly."
    },
    {
      "name": "Chest Flys",
      "duration": 10,
      "howTo": "With arms extended, bring dumbbells together above chest in wide arc."
    },
    {
      "name": "Incline Press",
      "duration": 12,
      "howTo": "Use an incline surface and press dumbbells upward above chest."
    },
    {
      "name": "Pullover",
      "duration": 10,
      "howTo": "Hold dumbbell with both hands, extend arms backward then return over chest."
    },
    {
      "name": "Squeeze Press",
      "duration": 10,
      "howTo": "Hold dumbbells together and press upward, squeezing them together."
    },
  ],
  "Abs": [
    {
      "name": "Russian Twists",
      "duration": 8,
      "howTo": "Sit on floor, twist torso side to side while holding dumbbell."
    },
    {
      "name": "Weighted Sit-ups",
      "duration": 10,
      "howTo": "Hold dumbbell to chest or extend arms and perform sit-ups."
    },
    {
      "name": "Leg Raises with Dumbbell",
      "duration": 10,
      "howTo": "Hold dumbbell between feet and raise legs up and down."
    },
    {
      "name": "Dumbbell Side Bends",
      "duration": 8,
      "howTo": "Hold dumbbell to one side and bend sideways. Repeat both sides."
    },
    {
      "name": "Weighted V-Ups",
      "duration": 10,
      "howTo": "Hold dumbbell with both hands and raise arms and legs to meet in the middle."
    },
  ],
  "Lower Back": [
    {
      "name": "Superman Pose",
      "duration": 6,
      "howTo": "Lie on stomach, raise arms and legs simultaneously like flying."
    },
    {
      "name": "Bird-Dog",
      "duration": 8,
      "howTo": "On all fours, extend opposite arm and leg simultaneously. Hold, then switch."
    },
    {
      "name": "Dumbbell Good Morning",
      "duration": 10,
      "howTo": "Hold dumbbells at shoulders, bend at hips with straight back, and return upright."
    },
  ],
  "Glutes": [
    {
      "name": "Dumbbell Hip Thrusts",
      "duration": 12,
      "howTo": "Place dumbbell on hips, thrust upward and squeeze glutes."
    },
    {
      "name": "Glute Bridge",
      "duration": 10,
      "howTo": "Lie on back, lift hips off ground and squeeze glutes at top."
    },
    {
      "name": "Donkey Kicks with Dumbbell",
      "duration": 10,
      "howTo": "Place dumbbell behind knee and kick leg upward. Repeat each side."
    },
    {
      "name": "Step-ups with Dumbbells",
      "duration": 12,
      "howTo": "Step onto a raised surface with dumbbells. Alternate legs."
    },
  ],
  "Quadriceps": [
    {
      "name": "Goblet Squat",
      "duration": 12,
      "howTo": "Hold dumbbell at chest and squat deeply while keeping chest up."
    },
    {
      "name": "Dumbbell Lunges",
      "duration": 10,
      "howTo": "Step forward, lower until both knees at 90°. Push back and switch."
    },
    {
      "name": "Step-Ups",
      "duration": 10,
      "howTo": "Step onto elevated surface with dumbbells. Alternate legs."
    },
    {
      "name": "Bulgarian Split Squat",
      "duration": 12,
      "howTo": "Place rear foot on bench, squat down with dumbbells in both hands."
    },
  ],
  "Hamstrings": [
    {
      "name": "Dumbbell Deadlifts",
      "duration": 12,
      "howTo": "Keep back straight, bend at hips, lower dumbbells, then return up."
    },
    {
      "name": "Single-Leg Deadlifts",
      "duration": 10,
      "howTo": "Balance on one leg while lowering dumbbell. Use core to stabilize."
    },
    {
      "name": "Glute Ham Raise (Modified)",
      "duration": 10,
      "howTo": "Kneel with feet secured. Lower torso and pull back using hamstrings."
    },
    {
      "name": "Dumbbell Swings",
      "duration": 10,
      "howTo": "Swing dumbbell between legs using hips, similar to kettlebell swing."
    },
  ],
};
