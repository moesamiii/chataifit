import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final ageController = TextEditingController();

  double? calories;

  void _calculateCalories() {
    final height = double.tryParse(heightController.text);
    final weight = double.tryParse(weightController.text);
    final age = double.tryParse(ageController.text);

    if (height != null && weight != null && age != null) {
      // Mifflin-St Jeor Equation (male, default)
      final result = (10 * weight) + (6.25 * height) - (5 * age) + 5;
      setState(() {
        calories = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: heightController,
              decoration: const InputDecoration(labelText: 'Height (cm)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateCalories,
              child: const Text('Calculate Calories'),
            ),
            const SizedBox(height: 20),
            if (calories != null)
              Text(
                'Estimated daily calories: ${calories!.toStringAsFixed(0)} kcal',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
