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
        'description': 'Helps improve power, strength, and muscle mass.',
        'icon': Icons.fitness_center
      },
      {
        'name': 'Whey Protein',
        'male': '1-2 scoops/day',
        'female': '1 scoop/day',
        'timing': 'After workout or as meal supplement',
        'goal': 'Muscle recovery & lean mass',
        'description': 'Fast-digesting protein ideal for muscle repair.',
        'icon': Icons.sports_mma
      },
      {
        'name': 'Omega-3 (Fish Oil)',
        'male': '1000mg x2 daily',
        'female': '1000mg daily',
        'timing': 'With meals',
        'goal': 'Heart, brain & joint health',
        'description': 'Reduces inflammation and supports cardiovascular health.',
        'icon': Icons.favorite
      },
      {
        'name': 'Vitamin D3',
        'male': '1000–4000 IU/day',
        'female': '1000–3000 IU/day',
        'timing': 'Morning with fat-containing food',
        'goal': 'Bone strength & immunity',
        'description': 'Vital for calcium absorption and immune function.',
        'icon': Icons.wb_sunny
      },
      {
        'name': 'Magnesium',
        'male': '400mg daily',
        'female': '310mg daily',
        'timing': 'Before bed',
        'goal': 'Muscle relaxation, sleep & recovery',
        'description': 'Supports nervous system and sleep quality.',
        'icon': Icons.hotel
      },
      {
        'name': 'Zinc',
        'male': '11mg daily',
        'female': '8mg daily',
        'timing': 'After meals (not with calcium)',
        'goal': 'Hormone support & immune system',
        'description': 'Essential for testosterone production and immunity.',
        'icon': Icons.shield
      },
      {
        'name': 'BCAAs (Leucine, Isoleucine, Valine)',
        'male': '5-10g before or during workout',
        'female': '3-5g before or during workout',
        'timing': 'Intra or pre workout',
        'goal': 'Prevent muscle breakdown & boost endurance',
        'description': 'Supports muscle preservation during intense exercise.',
        'icon': Icons.bolt
      },
      {
        'name': 'Probiotics',
        'male': '1 capsule/day (varies)',
        'female': '1 capsule/day (varies)',
        'timing': 'Morning before food',
        'goal': 'Gut health & digestion',
        'description': 'Promotes a healthy gut microbiome.',
        'icon': Icons.health_and_safety
      },
      {
        'name': 'Collagen',
        'male': '10g/day',
        'female': '10g/day',
        'timing': 'With Vitamin C source',
        'goal': 'Skin, joints & hair health',
        'description': 'Supports connective tissue and skin elasticity.',
        'icon': Icons.face_retouching_natural
      },
      {
        'name': 'Ashwagandha',
        'male': '300–600mg/day',
        'female': '250–500mg/day',
        'timing': 'Evening or with meals',
        'goal': 'Stress reduction & hormone balance',
        'description': 'Adaptogen to reduce cortisol and boost resilience.',
        'icon': Icons.spa
      },
    ];

    final List<String> supplementTips = [
      "💧 Stay hydrated when using creatine.",
      "🥤 Mix protein with milk or water – avoid sugary drinks.",
      "🍽️ Take Omega-3 and Vitamin D with fat-containing meals.",
      "📅 Consistency matters more than timing for most supplements.",
      "😴 Magnesium and Ashwagandha can improve sleep and stress.",
      "🧠 Track how you feel with each supplement in a journal.",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Supplement Guide"),
        backgroundColor: const Color(0xFF00BFFF), // Rich sky blue
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB2EBF2), Color(0xFF00BFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Header Card
            Card(
              elevation: 4,
              color: const Color(0xFF00BFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(Icons.auto_awesome, size: 40, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      "💊 How to Use Supplements Effectively",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Boost your health & performance with science-backed supplement use. Explore the list 👇",
                      style: TextStyle(fontSize: 15, color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Supplement Cards
            ...supplements.map((item) => Card(
                  color: Colors.white,
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(item['icon'],
                                color: const Color(0xFF00BFFF), size: 26),
                            const SizedBox(width: 10),
                            Text(
                              item['name'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                        const SizedBox(height: 4),
                        Text("ℹ️ ${item['description']}"),
                      ],
                    ),
                  ),
                )),

            const SizedBox(height: 20),
            const Divider(thickness: 1.2, color: Colors.white70),

            // Supplement Tips
            const Text(
              "🧠 Expert Supplement Tips",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ...supplementTips
                .map((tip) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        tip,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ))
                .toList(),

            const SizedBox(height: 24),

            // Motivational Quote
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF00BFFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "“Take care of your body. It’s the only place you have to live.” – Jim Rohn",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15, color: Colors.white, fontStyle: FontStyle.italic),
              ),
            ),

            const SizedBox(height: 20),

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
