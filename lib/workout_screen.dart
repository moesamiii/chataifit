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
    ],
  };

  Future<void> _completeWorkout(String name, int duration) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    String? lastWorkoutDate = prefs.getString("lastWorkoutDate");
    String? streakUpdatedFor = prefs.getString("streakUpdatedFor");
    int streak = prefs.getInt("streak") ?? 0;
    int completed = prefs.getInt("completed") ?? 0;
    int minutes = prefs.getInt("minutes") ?? 0;

    if (lastWorkoutDate != null) {
      try {
        final lastDate = DateTime.parse(lastWorkoutDate);
        final hours = now.difference(lastDate).inHours;
        if (hours >= 48) {
          streak = 0;
          await prefs.setInt("streak", 0);
        }
      } catch (_) {}
    }

    if (streakUpdatedFor != todayStr) {
      streak += 1;
      await prefs.setInt("streak", streak);
      await prefs.setString("streakUpdatedFor", todayStr);
    }

    await prefs.setString("lastWorkoutDate", todayStr);
    await prefs.setInt("completed", completed + 1);
    await prefs.setInt("minutes", minutes + duration);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("✔️ $name marked as complete!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🏋️ Dumbbell Workouts')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text("Select Muscle Group",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
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
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            if (selectedCategory != null)
              Expanded(
                child: ListView.builder(
                  itemCount: workouts[selectedCategory]!.length,
                  itemBuilder: (context, index) {
                    final exercise = workouts[selectedCategory]![index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.fitness_center),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    exercise['name'],
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text("${exercise['duration']} min",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () => _completeWorkout(
                                      exercise['name'], exercise['duration']),
                                  child: const Text("Done"),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            ExpansionTile(
                              title: const Text("How to play",
                                  style: TextStyle(fontSize: 14)),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(exercise['howTo']),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              const Expanded(
                child: Center(
                    child: Text("Please select a muscle group to view workouts.")),
              )
          ],
        ),
      ),
    );
  }
}
