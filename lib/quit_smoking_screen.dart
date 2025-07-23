import 'package:flutter/material.dart';

class QuitSmokingScreen extends StatelessWidget {
  const QuitSmokingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tips = [
      {'icon': Icons.calendar_month, 'text': "Set a quit date and stick to it."},
      {'icon': Icons.delete_forever, 'text': "Remove cigarettes and ashtrays from your home and car."},
      {'icon': Icons.healing, 'text': "Use nicotine replacement therapy (patches, gum, etc)."},
      {'icon': Icons.warning, 'text': "Avoid triggers like alcohol or stress at first."},
      {'icon': Icons.group, 'text': "Get support from family, friends, or a coach."},
      {'icon': Icons.fitness_center, 'text': "Exercise regularly to reduce cravings."},
      {'icon': Icons.lightbulb, 'text': "Stay busy with healthy distractions and hobbies."},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quit Smoking"),
        backgroundColor: const Color(0xFF00AEEF), // Rich sky blue
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFB3E5FC)], // Light sky gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              "You're making a powerful choice 💪",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "\"Every journey begins with a single step. This is yours.\"",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Tips List
            ...tips.map((tip) => Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(tip['icon'] as IconData, color: Color(0xFF00AEEF)),
                title: Text(
                  tip['text'] as String,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            )),

            const SizedBox(height: 24),

            // Bonus Motivation
            const Text(
              "You're not alone. Millions have quit successfully — and so can you!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
