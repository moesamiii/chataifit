import 'package:flutter/material.dart';

class LifestyleScreen extends StatelessWidget {
  const LifestyleScreen({super.key});

  final Color primaryColor = const Color(0xFF00BFA6); // Rich teal

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> topics = [
      {
        'title': '🛌 Sleep',
        'desc':
            '• Sleep 7–9 hours per night.\n• Maintain a consistent bedtime & wake-up.\n• Keep your room dark, cool, and quiet.\n• Avoid screens & caffeine 1–2 hours before sleep.'
      },
      {
        'title': '🥗 Nutrition',
        'desc':
            '• Eat whole, nutrient-dense foods.\n• Focus on protein, healthy fats, and fiber.\n• Avoid ultra-processed, sugary, and fried foods.\n• Practice mindful eating—don’t rush meals.'
      },
      {
        'title': '🚰 Hydration',
        'desc':
            '• Drink 2–3 liters of water per day.\n• Hydrate early in the morning.\n• Add electrolytes if training intensely.\n• Limit sugary drinks and alcohol.'
      },
      {
        'title': '🏋️ Physical Activity',
        'desc':
            '• Exercise 4–5x a week.\n• Combine strength training, cardio, and mobility.\n• Take 8,000–12,000 steps daily.\n• Stretch or do yoga to improve flexibility and recovery.'
      },
      {
        'title': '💨 Breath & Posture',
        'desc':
            '• Practice deep nasal breathing.\n• Improve posture to support lungs, spine, and digestion.\n• Use breathing exercises to reduce anxiety and increase energy.'
      },
      {
        'title': '🧠 Mental Health',
        'desc':
            '• Practice gratitude daily.\n• Meditate or journal to reduce stress.\n• Seek therapy if needed.\n• Limit social comparison and perfectionism.'
      },
      {
        'title': '🌞 Sunlight & Nature',
        'desc':
            '• Get sunlight exposure in the morning.\n• Aim for 15–30 mins outdoors daily.\n• Touch nature—walk barefoot, sit in a park, hike.\n• Sunlight improves mood and sleep cycles.'
      },
      {
        'title': '📵 Digital Balance',
        'desc':
            '• Set screen time limits.\n• Have phone-free meals and mornings.\n• Unfollow accounts that drain your energy.\n• Replace screen time with real-life hobbies.'
      },
      {
        'title': '👨‍👩‍👧 Relationships',
        'desc':
            '• Stay connected with friends & family.\n• Express love and appreciation.\n• Practice active listening.\n• Social bonds strongly correlate with longevity.'
      },
      {
        'title': '📚 Lifelong Learning',
        'desc':
            '• Read books or listen to audiobooks.\n• Learn new skills (language, instrument, sport).\n• Stay curious and mentally engaged.\n• Keeps the brain sharp and youthful.'
      },
      {
        'title': '💤 Rest & Recovery',
        'desc':
            '• Prioritize rest days from intense training.\n• Take naps if sleep is compromised.\n• Use massage, foam rolling, cold or heat therapy.\n• Recovery is when your body adapts and grows.'
      },
      {
        'title': '🧬 Longevity Habits',
        'desc':
            '• Keep stress low with breathing, gratitude, and social support.\n• Avoid smoking, excess alcohol, and toxic environments.\n• Monitor key health metrics yearly (blood pressure, glucose, lipids).\n• Move with purpose daily—physical, mental, and emotional vitality.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lifestyle Guide"),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final item = topics[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['title']!,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(item['desc']!,
                      style: const TextStyle(fontSize: 15, height: 1.5)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
