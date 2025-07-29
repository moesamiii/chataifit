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
  final ScrollController _scrollController = ScrollController();
  Set<String> completedToday = {};

  @override
  void initState() {
    super.initState();
    selectedCategory = categories.keys.first;
    _loadCompletedToday();
  }

  Future<void> _loadCompletedToday() async {
    final prefs = await SharedPreferences.getInstance();
    final todayStr =
        "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";
    final saved = prefs.getStringList("completed_$todayStr") ?? [];
    setState(() {
      completedToday = saved.toSet();
    });
  }

  Future<void> _completeWorkout(String name, int duration, int index) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final todayStr =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

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

    // Update completed list
    completedToday.add(name);
    await prefs.setStringList("completed_$todayStr", completedToday.toList());

    // Auto scroll to completed item
    _scrollController.animateTo(
      index * 280,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("\u2714\ufe0f $name marked as complete!")),
    );

    setState(() {}); // To update UI for completed check
  }

  Future<int> _getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("streak") ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🏋️ Dumbbell Workouts')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            FutureBuilder<int>(
              future: _getStreak(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const SizedBox();
                return Text("🔥 Streak: ${snapshot.data} days",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold));
              },
            ),
            const SizedBox(height: 10),
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
                  controller: _scrollController,
                  itemCount: workouts[selectedCategory]!.length,
                  itemBuilder: (context, index) {
                    final exercise = workouts[selectedCategory]![index];
                    final isDone = completedToday.contains(exercise['name']);

                    return Card(
                      elevation: 6,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadowColor: Colors.grey.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (exercise['imageUrl'] != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  exercise['imageUrl'],
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.fitness_center),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    exercise['name'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: isDone
                                          ? Colors.grey
                                          : Colors.black,
                                      decoration: isDone
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Text("${exercise['duration']} min",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: isDone
                                      ? null
                                      : () => _completeWorkout(
                                          exercise['name'],
                                          exercise['duration'],
                                          index),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isDone
                                        ? Colors.grey
                                        : Colors.lightBlue, // ✅ Sky blue here
                                  ),
                                  child: const Text("Done"),
                                ),
                              ],
                            ),
                            if (exercise['calories'] != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(
                                  "🔥 ${exercise['calories']} kcal",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.deepOrange),
                                ),
                              ),
                            const SizedBox(height: 10),
                            ExpansionTile(
                              title: const Text("How to do this exercise",
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
