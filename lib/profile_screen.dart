import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'quit_smoking_screen.dart';
import 'login_page.dart';
import 'lifestyle_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int streak = 0;
  int completed = 0;
  int minutes = 0;

  Future<void> loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();
    final lastStr = prefs.getString("lastWorkoutDate");
    final last = lastStr != null ? DateTime.tryParse(lastStr) : null;

    if (last == null || today.difference(last).inHours >= 48) {
      await prefs.setInt("streak", 0);
      streak = 0;
    } else {
      streak = prefs.getInt("streak") ?? 0;
    }

    completed = prefs.getInt("completed") ?? 0;
    minutes = prefs.getInt("minutes") ?? 0;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadStats();
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime firstDayOfMonth = DateTime(today.year, today.month, 1);
    int startWeekday = firstDayOfMonth.weekday;
    int totalDays = DateTime(today.year, today.month + 1, 0).day;

    List<Widget> dayWidgets = [];
    for (int i = 1; i < startWeekday; i++) {
      dayWidgets.add(const SizedBox());
    }
    for (int day = 1; day <= totalDays; day++) {
      final isToday = today.day == day;
      dayWidgets.add(Container(
        decoration: BoxDecoration(
          color: isToday ? Colors.blueAccent : Colors.grey[200],
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        margin: const EdgeInsets.all(4),
        child: Text(
          day.toString(),
          style: TextStyle(
            color: isToday ? Colors.white : Colors.black,
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Text('AB', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatCard(title: 'Streak', value: streak.toString()),
                _StatCard(title: 'Workout Min', value: minutes.toString()),
                _StatCard(title: 'Completed', value: completed.toString()),
              ],
            ),
            const SizedBox(height: 24),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Workout Calendar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: GridView.count(
                crossAxisCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: dayWidgets,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.medication),
                      label: const Text('Supplements Guide'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const QuitSmokingScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.favorite),
                      label: const Text('Lifestyle Guide'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LifestyleScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.logout),
                      label: const Text("Logout"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Confirm Logout"),
                            content: const Text("Are you sure you want to logout?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: const Text("Logout"),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginPage()),
                            (route) => false,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
