import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  final Map<String, List<Map<String, dynamic>>> workouts = {
    "Shoulders": [
      {"name": "Dumbbell Shoulder Press", "duration": 10},
      {"name": "Lateral Raise", "duration": 8},
      {"name": "Front Raise", "duration": 8},
    ],
    "Biceps": [
      {"name": "Dumbbell Curls", "duration": 12},
      {"name": "Hammer Curls", "duration": 10},
    ],
    "Triceps": [
      {"name": "Overhead Dumbbell Extension", "duration": 10},
      {"name": "Dumbbell Kickbacks", "duration": 8},
    ],
    "Back": [
      {"name": "Dumbbell Rows", "duration": 12},
      {"name": "Reverse Flys", "duration": 10},
    ],
    "Chest": [
      {"name": "Dumbbell Chest Press", "duration": 12},
      {"name": "Chest Flys", "duration": 10},
    ],
    "Abs": [
      {"name": "Dumbbell Russian Twists", "duration": 8},
      {"name": "Weighted Sit-ups", "duration": 10},
    ],
    "Lower Back": [
      {"name": "Superman Pose", "duration": 6},
      {"name": "Bird-Dog", "duration": 8},
    ],
    "Glutes": [
      {"name": "Dumbbell Hip Thrusts", "duration": 12},
      {"name": "Glute Bridge", "duration": 10},
    ],
    "Quadriceps": [
      {"name": "Dumbbell Goblet Squat", "duration": 12},
      {"name": "Dumbbell Lunges", "duration": 10},
    ],
    "Hamstrings": [
      {"name": "Dumbbell Deadlifts", "duration": 12},
      {"name": "Single-Leg Deadlifts", "duration": 10},
    ],
  };

  Future<void> _completeWorkout(int duration) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();

    // ✅ Correct date format: "YYYY-MM-DD"
    final todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    String? lastWorkoutDate = prefs.getString("lastWorkoutDate");
    String? streakUpdatedFor = prefs.getString("streakUpdatedFor");
    int streak = prefs.getInt("streak") ?? 0;
    int completed = prefs.getInt("completed") ?? 0;
    int minutes = prefs.getInt("minutes") ?? 0;

    // Reset streak if no workout for 48+ hours
    if (lastWorkoutDate != null) {
      try {
        final lastDate = DateTime.parse(lastWorkoutDate);
        final hours = now.difference(lastDate).inHours;
        if (hours >= 48) {
          streak = 0;
          await prefs.setInt("streak", 0);
        }
      } catch (_) {
        // ignore if parse fails
      }
    }

    // Increase streak if not already done today
    if (streakUpdatedFor != todayStr) {
      streak += 1;
      await prefs.setInt("streak", streak);
      await prefs.setString("streakUpdatedFor", todayStr);
    }

    await prefs.setString("lastWorkoutDate", todayStr);
    await prefs.setInt("completed", completed + 1);
    await prefs.setInt("minutes", minutes + duration);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Workout marked as complete!")),
    );
  }

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
                          title: Text(exercise['name']),
                          subtitle: Text("${exercise['duration']} min"),
                          trailing: ElevatedButton(
                            child: const Text("Done"),
                            onPressed: () {
                              _completeWorkout(exercise['duration']);
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
