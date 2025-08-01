import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final List<Map<String, dynamic>> _allFoodItems = [
    // Fruits
    {'name': 'Apple', 'calories': 95},
    {'name': 'Banana', 'calories': 105},
    {'name': 'Orange', 'calories': 62},
    {'name': 'Strawberries (1 cup)', 'calories': 49},
    {'name': 'Blueberries (1 cup)', 'calories': 84},
    {'name': 'Grapes (1 cup)', 'calories': 62},
    {'name': 'Watermelon (1 cup)', 'calories': 46},
    {'name': 'Pineapple (1 cup)', 'calories': 82},
    {'name': 'Mango (1 cup)', 'calories': 99},
    {'name': 'Avocado (half)', 'calories': 120},

    // Vegetables
    {'name': 'Broccoli (1 cup)', 'calories': 55},
    {'name': 'Carrot (medium)', 'calories': 25},
    {'name': 'Spinach (1 cup raw)', 'calories': 7},
    {'name': 'Potato (medium baked)', 'calories': 161},
    {'name': 'Sweet Potato (medium)', 'calories': 103},
    {'name': 'Corn (1 cup)', 'calories': 132},
    {'name': 'Green Beans (1 cup)', 'calories': 44},
    {'name': 'Bell Pepper (medium)', 'calories': 37},
    {'name': 'Cucumber (1 cup)', 'calories': 16},
    {'name': 'Tomato', 'calories': 22},

    // Proteins
    {'name': 'Chicken Breast (100g)', 'calories': 165},
    {'name': 'Ground Beef (85% lean, 100g)', 'calories': 254},
    {'name': 'Grilled Salmon (100g)', 'calories': 208},
    {'name': 'Tuna (canned in water, 100g)', 'calories': 116},
    {'name': 'Shrimp (100g)', 'calories': 99},
    {'name': 'Egg (large)', 'calories': 78},
    {'name': 'Bacon (1 slice)', 'calories': 43},
    {'name': 'Turkey Breast (100g)', 'calories': 135},
    {'name': 'Pork Chop (100g)', 'calories': 242},
    {'name': 'Beef Jerky (1 oz)', 'calories': 116},

    // Dairy
    {'name': 'Milk (whole, 1 cup)', 'calories': 149},
    {'name': 'Greek Yogurt (plain, 1 cup)', 'calories': 100},
    {'name': 'Cheddar Cheese (1 oz)', 'calories': 115},
    {'name': 'Mozzarella Cheese (1 oz)', 'calories': 85},
    {'name': 'Cottage Cheese (1 cup)', 'calories': 220},
    {'name': 'Butter (1 tbsp)', 'calories': 102},
    {'name': 'Ice Cream (1/2 cup)', 'calories': 137},
    {'name': 'Almond Milk (unsweetened, 1 cup)', 'calories': 30},
    {'name': 'Soy Milk (1 cup)', 'calories': 80},
    {'name': 'Whipped Cream (1 tbsp)', 'calories': 52},

    // Grains
    {'name': 'White Rice (1 cup)', 'calories': 206},
    {'name': 'Brown Rice (1 cup)', 'calories': 216},
    {'name': 'Quinoa (1 cup)', 'calories': 222},
    {'name': 'Oatmeal (1 cup cooked)', 'calories': 158},
    {'name': 'White Bread (1 slice)', 'calories': 79},
    {'name': 'Whole Wheat Bread (1 slice)', 'calories': 80},
    {'name': 'Bagel (plain)', 'calories': 289},
    {'name': 'Pancake (1 medium)', 'calories': 86},
    {'name': 'Tortilla (flour, 1 medium)', 'calories': 146},
    {'name': 'Pasta (1 cup cooked)', 'calories': 220},

    // Fast Food
    {'name': 'Big Mac', 'calories': 550},
    {'name': 'McDonald\'s French Fries (medium)', 'calories': 340},
    {'name': 'McDonald\'s Cheeseburger', 'calories': 313},
    {'name': 'McDonald\'s Chicken McNuggets (10 pc)', 'calories': 440},
    {'name': 'McDonald\'s Apple Pie', 'calories': 240},
    {'name': 'Whopper', 'calories': 660},
    {'name': 'Subway 6" Turkey Breast', 'calories': 280},
    {'name': 'Taco Bell Crunchy Taco', 'calories': 170},
    {'name': 'Pizza Hut Slice (pepperoni)', 'calories': 298},
    {'name': 'Chick-fil-A Sandwich', 'calories': 440},

    // Snacks
    {'name': 'Potato Chips (1 oz)', 'calories': 152},
    {'name': 'Pretzels (1 oz)', 'calories': 108},
    {'name': 'Popcorn (1 cup air-popped)', 'calories': 31},
    {'name': 'Granola Bar', 'calories': 100},
    {'name': 'Trail Mix (1 oz)', 'calories': 140},
    {'name': 'Almonds (1 oz)', 'calories': 164},
    {'name': 'Peanuts (1 oz)', 'calories': 161},
    {'name': 'Peanut Butter (1 tbsp)', 'calories': 94},
    {'name': 'Hummus (1 tbsp)', 'calories': 27},
    {'name': 'Guacamole (1 tbsp)', 'calories': 25},

    // Sweets
    {'name': 'Chocolate Chip Cookie', 'calories': 150},
    {'name': 'Brownie', 'calories': 250},
    {'name': 'Donut (glazed)', 'calories': 240},
    {'name': 'Cheesecake (slice)', 'calories': 350},
    {'name': 'Apple Pie (slice)', 'calories': 300},
    {'name': 'Chocolate Bar', 'calories': 210},
    {'name': 'Candy Bar (Snickers)', 'calories': 250},
    {'name': 'Gummy Bears (1 oz)', 'calories': 100},
    {'name': 'Marshmallows (1 large)', 'calories': 23},
    {'name': 'Ice Cream Cone', 'calories': 200},

    // Beverages
    {'name': 'Pepsi (12 oz)', 'calories': 150},
    {'name': 'Coca-Cola (12 oz)', 'calories': 140},
    {'name': 'Diet Coke (12 oz)', 'calories': 0},
    {'name': 'Orange Juice (1 cup)', 'calories': 112},
    {'name': 'Apple Juice (1 cup)', 'calories': 114},
    {'name': 'Coffee (black)', 'calories': 2},
    {'name': 'Latte (12 oz)', 'calories': 120},
    {'name': 'Tea (unsweetened)', 'calories': 2},
    {'name': 'Beer (regular, 12 oz)', 'calories': 153},
    {'name': 'Red Wine (5 oz)', 'calories': 125},

    // Breakfast
    {'name': 'Scrambled Eggs (2 eggs)', 'calories': 182},
    {'name': 'Bacon (2 slices)', 'calories': 86},
    {'name': 'Pancakes (2 medium)', 'calories': 172},
    {'name': 'Waffle (1 round)', 'calories': 218},
    {'name': 'French Toast (1 slice)', 'calories': 149},
    {'name': 'Cereal (1 cup)', 'calories': 120},
    {'name': 'Yogurt with Granola', 'calories': 250},
    {'name': 'Smoothie (fruit, 16 oz)', 'calories': 200},
    {'name': 'Breakfast Burrito', 'calories': 300},
    {'name': 'Egg McMuffin', 'calories': 310},

    // Protein/Supplements
    {'name': 'Whey Protein Powder (1 scoop)', 'calories': 120},
    {'name': 'Plant Protein Powder (1 scoop)', 'calories': 110},
    {'name': 'Protein Shake', 'calories': 250},
    {'name': 'Protein Bar', 'calories': 200},
    {'name': 'BCAA Drink', 'calories': 10},
    {'name': 'Pre-Workout Drink', 'calories': 25},
    {'name': 'Mass Gainer Shake', 'calories': 600},
    {'name': 'Creatine (5g serving)', 'calories': 0},
    {'name': 'Electrolyte Drink', 'calories': 50},
    {'name': 'Meal Replacement Shake', 'calories': 220},

    // Condiments/Sauces
    {'name': 'Ketchup (1 tbsp)', 'calories': 19},
    {'name': 'Mayonnaise (1 tbsp)', 'calories': 94},
    {'name': 'Mustard (1 tbsp)', 'calories': 3},
    {'name': 'BBQ Sauce (1 tbsp)', 'calories': 29},
    {'name': 'Ranch Dressing (1 tbsp)', 'calories': 73},
    {'name': 'Olive Oil (1 tbsp)', 'calories': 119},
    {'name': 'Honey (1 tbsp)', 'calories': 64},
    {'name': 'Maple Syrup (1 tbsp)', 'calories': 52},
    {'name': 'Soy Sauce (1 tbsp)', 'calories': 10},
    {'name': 'Hot Sauce (1 tbsp)', 'calories': 6},

    // Miscellaneous
    {'name': 'Mac and Cheese (1 cup)', 'calories': 310},
    {'name': 'Chicken Noodle Soup (1 cup)', 'calories': 100},
    {'name': 'Caesar Salad (with dressing)', 'calories': 470},
    {'name': 'Garden Salad (no dressing)', 'calories': 50},
    {'name': 'Spaghetti with Meat Sauce (1 cup)', 'calories': 377},
    {'name': 'Grilled Cheese Sandwich', 'calories': 400},
    {'name': 'Peanut Butter & Jelly Sandwich', 'calories': 350},
    {'name': 'Tuna Salad Sandwich', 'calories': 380},
    {'name': 'Chicken Caesar Wrap', 'calories': 450},
    {'name': 'Vegetable Stir Fry (1 cup)', 'calories': 200},
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