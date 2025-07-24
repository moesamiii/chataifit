import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'quit_smoking_screen.dart';
import 'login_page.dart'; // ⬅️ Required for logout redirection

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime firstDayOfMonth = DateTime(today.year, today.month, 1);
    int startWeekday = firstDayOfMonth.weekday;
    int totalDays = DateTime(today.year, today.month + 1, 0).day;

    List<Widget> dayWidgets = [];

    // Fill empty boxes before first day
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
            // 👤 Avatar with initials
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Text(
                'AB', // Replace with dynamic initials if needed
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            const SizedBox(height: 16),

            // 📊 Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _StatCard(title: 'Streak', value: '7'),
                _StatCard(title: 'Workout Min', value: '120'),
                _StatCard(title: 'Completed', value: '5'),
              ],
            ),

            const SizedBox(height: 20),

            // 📅 Calendar
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Calendar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: dayWidgets,
            ),

            const SizedBox(height: 30),

            // 🚭 Supplements Guide Button
            ElevatedButton.icon(
              icon: const Icon(Icons.smoke_free),
              label: const Text('Supplements Guide'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QuitSmokingScreen()),
                );
              },
            ),

            const SizedBox(height: 20),

            // 🔓 Logout Button
            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
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
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
