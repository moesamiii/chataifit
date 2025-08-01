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
      "howTo":
          "Hold dumbbells at shoulder height, palms facing forward. Press up overhead and lower slowly.",
      "videoUrl": "https://www.youtube.com/watch?v=qEwKCR5JCog"
    },
  ],
  "Biceps": [
    {
      "name": "Dumbbell Curls",
      "duration": 12,
      "howTo":
          "Curl the dumbbells upward while keeping elbows tight. Lower under control.",
      "videoUrl": "https://www.youtube.com/watch?v=ykJmrZ5v0Oo"
    },
  ],
  "Triceps": [
    {
      "name": "Overhead Dumbbell Extension",
      "duration": 10,
      "howTo":
          "Hold one dumbbell overhead with both hands. Lower it behind your head and extend back up.",
      "videoUrl": "https://www.youtube.com/watch?v=_gsUck-7M74"
    },
  ],
  "Back": [
    {
      "name": "Dumbbell Rows",
      "duration": 12,
      "howTo":
          "Pull dumbbells towards your sides while keeping your back flat.",
      "videoUrl": "https://www.youtube.com/watch?v=pYcpY20QaE8"
    },
  ],
  "Chest": [
    {
      "name": "Dumbbell Chest Press",
      "duration": 12,
      "howTo":
          "Lie on back and press dumbbells from chest straight up. Lower slowly.",
      "videoUrl": "https://www.youtube.com/watch?v=VmB1G1K7v94"
    },
  ],
  "Abs": [
    {
      "name": "Russian Twists",
      "duration": 8,
      "howTo":
          "Sit on floor, twist torso side to side while holding dumbbell.",
      "videoUrl": "https://www.youtube.com/watch?v=wkD8rjkodUI"
    },
  ],
  "Lower Back": [
    {
      "name": "Superman Pose",
      "duration": 6,
      "howTo":
          "Lie on stomach, raise arms and legs simultaneously like flying.",
      "videoUrl": "https://www.youtube.com/watch?v=z6PJMT2y8GQ"
    },
  ],
  "Glutes": [
    {
      "name": "Dumbbell Hip Thrusts",
      "duration": 12,
      "howTo": "Place dumbbell on hips, thrust upward and squeeze glutes.",
      "videoUrl": "https://www.youtube.com/watch?v=LM8XHLYJoYs"
    },
  ],
  "Quadriceps": [
    {
      "name": "Goblet Squat",
      "duration": 12,
      "howTo":
          "Hold dumbbell at chest and squat deeply while keeping chest up.",
      "videoUrl": "https://www.youtube.com/watch?v=6xwGFn-J_Qo"
    },
  ],
  "Hamstrings": [
    {
      "name": "Dumbbell Deadlifts",
      "duration": 12,
      "howTo":
          "Keep back straight, bend at hips, lower dumbbells, then return up.",
      "videoUrl": "https://www.youtube.com/watch?v=ytGaGIn3SjE"
    },
  ],
};
