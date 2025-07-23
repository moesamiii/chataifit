import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final List<Map<String, dynamic>> foodItems = [
    {'name': 'Apple (1 medium)', 'calories': 95},
    {'name': 'Banana (1 medium)', 'calories': 105},
    {'name': 'Chicken Breast (100g)', 'calories': 165},
    {'name': 'Rice (1 cup)', 'calories': 206},
    {'name': 'Egg (1 large)', 'calories': 78},
    {'name': 'Avocado (half)', 'calories': 120},
    {'name': 'Orange Juice (1 cup)', 'calories': 112},
    {'name': 'Water (0 cal)', 'calories': 0},
    {'name': 'Protein Shake (1 scoop)', 'calories': 120},
    {'name': 'Salad (mixed, 1 bowl)', 'calories': 80},
  ];

  final Set<int> selectedIndexes = {};
  int totalCalories = 0;

  void _toggleItem(int index) {
    setState(() {
      final itemCalories = foodItems[index]['calories'];
      final calories = (itemCalories is int) ? itemCalories : (itemCalories as num).toInt();

      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
        totalCalories -= calories;
      } else {
        selectedIndexes.add(index);
        totalCalories += calories;
      }
    });
  }

  void _resetSelection() {
    setState(() {
      selectedIndexes.clear();
      totalCalories = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Food Tracker")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final item = foodItems[index];
                final selected = selectedIndexes.contains(index);

                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('${item['calories']} cal'),
                  trailing: selected
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : const Icon(Icons.add_circle_outline),
                  onTap: () => _toggleItem(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total Calories: $totalCalories',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: _resetSelection,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
