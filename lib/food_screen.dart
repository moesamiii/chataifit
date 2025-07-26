import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final List<Map<String, dynamic>> _allFoodItems = [
    {'name': 'Apple', 'calories': 95},
    {'name': 'Banana', 'calories': 105},
    {'name': 'Orange Juice (1 cup)', 'calories': 112},
    {'name': 'Chicken Breast (100g)', 'calories': 165},
    {'name': 'Boiled Egg', 'calories': 78},
    {'name': 'Steamed Broccoli (1 cup)', 'calories': 55},
    {'name': 'Rice (1 cup)', 'calories': 206},
    {'name': 'Grilled Salmon (100g)', 'calories': 208},
    {'name': 'Oatmeal (1 cup)', 'calories': 158},
    {'name': 'Greek Yogurt (plain)', 'calories': 100},
    {'name': 'Avocado (half)', 'calories': 120},
    {'name': 'Protein Shake', 'calories': 250},
    {'name': 'Almonds (10 pcs)', 'calories': 70},
    {'name': 'Peanut Butter (1 tbsp)', 'calories': 94},
    {'name': 'Whole Wheat Bread (1 slice)', 'calories': 80},
  ];

  List<Map<String, dynamic>> _filteredItems = [];
  final Set<int> selectedIndexes = {};
  int totalCalories = 0;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(_allFoodItems);
  }

  void _toggleItem(int index) {
    setState(() {
      final itemCalories = _filteredItems[index]['calories'];
      final calories = (itemCalories is int) ? itemCalories : (itemCalories as num).toInt();

      final globalIndex = _allFoodItems.indexOf(_filteredItems[index]);

      if (selectedIndexes.contains(globalIndex)) {
        selectedIndexes.remove(globalIndex);
        totalCalories -= calories;
      } else {
        selectedIndexes.add(globalIndex);
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

  void _filterItems(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      _filteredItems = _allFoodItems.where((item) {
        return item['name'].toLowerCase().contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Food Tracker")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: _filterItems,
              decoration: const InputDecoration(
                hintText: 'Search food or drink...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: _filteredItems.isEmpty
                ? const Center(child: Text("No items match your search."))
                : ListView.builder(
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      final globalIndex = _allFoodItems.indexOf(item);
                      final selected = selectedIndexes.contains(globalIndex);

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
