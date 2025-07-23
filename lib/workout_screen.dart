import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  String? selectedCategory;

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

  final Map<String, List<String>> workouts = {
    "Shoulders": ["Dumbbell Shoulder Press", "Lateral Raise", "Front Raise"],
    "Biceps": ["Dumbbell Curls", "Hammer Curls"],
    "Triceps": ["Overhead Dumbbell Extension", "Dumbbell Kickbacks"],
    "Back": ["Dumbbell Rows", "Reverse Flys"],
    "Chest": ["Dumbbell Chest Press", "Chest Flys"],
    "Abs": ["Dumbbell Russian Twists", "Weighted Sit-ups"],
    "Lower Back": ["Superman Pose", "Bird-Dog"],
    "Glutes": ["Dumbbell Hip Thrusts", "Glute Bridge"],
    "Quadriceps": ["Dumbbell Goblet Squat", "Dumbbell Lunges"],
    "Hamstrings": ["Dumbbell Deadlifts", "Single-Leg Deadlifts"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dumbbell Workouts')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("Select a Muscle Group",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: categories.entries.map((entry) {
              return ChoiceChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(entry.value, size: 18),
                    const SizedBox(width: 6),
                    Text(entry.key),
                  ],
                ),
                selected: selectedCategory == entry.key,
                onSelected: (_) {
                  setState(() => selectedCategory = entry.key);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          if (selectedCategory != null)
            Expanded(
              child: ListView(
                children: workouts[selectedCategory]!
                    .map((exercise) => ListTile(
                          leading: const Icon(Icons.fitness_center),
                          title: Text(exercise),
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
