import 'package:flutter/material.dart';

class QuitSmokingScreen extends StatelessWidget {
  const QuitSmokingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> supplements = [
      {
        'name': 'Creatine Monohydrate',
        'male': '5g daily',
        'female': '3g daily',
        'timing': 'Post workout or any time of day',
        'goal': 'Muscle growth & strength',
        'icon': Icons.fitness_center
      },
      {
        'name': 'Whey Protein',
        'male': '1-2 scoops/day',
        'female': '1 scoop/day',
        'timing': 'After workout or as meal supplement',
        'goal': 'Muscle recovery & lean mass',
        'icon': Icons.sports_mma
      },
      {
        'name': 'Omega-3 (Fish Oil)',
        'male': '1000mg x2 daily',
        'female': '1000mg daily',
        'timing': 'With meals',
        'goal': 'Heart & joint health',
        'icon': Icons.favorite
      },
      {
        'name': 'Multivitamins',
        'male': '1 tablet daily',
        'female': '1 tablet daily',
        'timing': 'With breakfast',
        'goal': 'General wellness',
        'icon': Icons.local_hospital
      },
      {
        'name': 'L-Carnitine',
        'male': '500–2000mg/day',
        'female': '250–1000mg/day',
        'timing': 'Before cardio or training',
        'goal': 'Fat metabolism',
        'icon': Icons.local_fire_department
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Supplement Guide"),
        backgroundColor: const Color(0xFF00AEEF), // Rich sky blue
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE1F5FE), Color(0xFFB3E5FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              "💊 How to Use Supplements Effectively",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Smart supplementation can boost your health & performance. Follow these tailored guidelines 👇",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            ...supplements.map((item) => Card(
              color: Colors.white,
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(item['icon'], color: const Color(0xFF00AEEF)),
                        const SizedBox(width: 8),
                        Text(
                          item['name'],
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text("👨 Male Dosage: ${item['male']}"),
                    const SizedBox(height: 4),
                    Text("👩 Female Dosage: ${item['female']}"),
                    const SizedBox(height: 8),
                    Text("⏰ When to Take: ${item['timing']}"),
                    const SizedBox(height: 4),
                    Text("🎯 Goal: ${item['goal']}"),
                  ],
                ),
              ),
            )),

            const SizedBox(height: 24),
            const Text(
              "⚠️ Always consult your doctor or coach before starting a new supplement routine.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
