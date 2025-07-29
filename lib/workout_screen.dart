import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'workout_data.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  String? selectedCategory;

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
      SnackBar(content: Text("\u2714\ufe0f $name marked as complete!")),
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