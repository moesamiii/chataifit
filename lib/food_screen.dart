import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final List<Map<String, dynamic>> _allFoodItems = [
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

    // 🥞 Canadian-style foods and drinks
    {'name': 'Poutine (1 serving)', 'calories': 740},
    {'name': 'Maple Syrup (2 tbsp)', 'calories': 104},
    {'name': 'Tim Hortons Coffee (medium double-double)', 'calories': 140},
    {'name': 'Butter Tart (1 piece)', 'calories': 220},
    {'name': 'BeaverTail (1 piece)', 'calories': 300},
    {'name': 'Montreal Smoked Meat Sandwich', 'calories': 410},
    {'name': 'Caesar Cocktail (1 glass)', 'calories': 150},
    {'name': 'Tim Hortons Iced Capp (medium)', 'calories': 360},
    {'name': 'Ketchup Chips (small bag)', 'calories': 260},
    {'name': 'Nanaimo Bar (1 square)', 'calories': 220},
    {'name': 'Peameal Bacon (2 slices)', 'calories': 100},
    {'name': 'Canadian Bacon Pizza (1 slice)', 'calories': 285},
    {'name': 'Oatmeal (1 bowl)', 'calories': 150},
    {'name': 'Greek Yogurt (plain, 170g)', 'calories': 100},
    {'name': 'Smoothie (homemade, 1 cup)', 'calories': 180},
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
