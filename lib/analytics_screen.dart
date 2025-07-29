import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final ageController = TextEditingController();
  final equipmentController = TextEditingController();

  final ScrollController _calorieScrollController = ScrollController();

  String gender = 'Male';
  String goal = 'Muscle Gain';
  String injury = 'No';
  String activityLevel = 'Moderate';
  String breathLevel = 'Normal';
  String trainingPlace = 'Home';
  int trainingDays = 3;

  double? calories;

  int waterGlasses = 0;
  int stepsToday = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _calculateCalories() {
    final height = double.tryParse(heightController.text);
    final weight = double.tryParse(weightController.text);
    final age = double.tryParse(ageController.text);

    if (height != null && weight != null && age != null) {
      double bmr = (gender == 'Male')
          ? (10 * weight) + (6.25 * height) - (5 * age) + 5
          : (10 * weight) + (6.25 * height) - (5 * age) - 161;

      double activityMultiplier = {
        'Sedentary': 1.2,
        'Light': 1.375,
        'Moderate': 1.55,
        'Active': 1.725,
        'Very Active': 1.9,
      }[activityLevel]!;

      double healthAdjustment = 0;
      if (injury == 'Yes') healthAdjustment -= 150;
      if (breathLevel == 'Low') healthAdjustment -= 100;
      if (trainingPlace == 'Gym') healthAdjustment += 50;
      if (equipmentController.text.toLowerCase().contains("dumbbell")) {
        healthAdjustment += 25;
      }

      double goalAdjustment = 0;
      if (goal == 'Muscle Gain') {
        goalAdjustment = 400;
      } else if (goal == 'Weight Loss') {
        goalAdjustment = -400;
      }

      double totalCalories = (bmr * activityMultiplier) + goalAdjustment + healthAdjustment;

      setState(() {
        calories = totalCalories;
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        _calorieScrollController.animateTo(
          _calorieScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      });
    }
  }

  Widget _buildDropdown<T>(String label, T value, List<T> items, ValueChanged<T?> onChanged) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(labelText: label),
      value: value,
      onChanged: onChanged,
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
    );
  }

  Widget _buildCalorieTab() {
    return SingleChildScrollView(
      controller: _calorieScrollController,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildDropdown('Gender', gender, ['Male', 'Female'], (v) => setState(() => gender = v!)),
          _buildDropdown('Goal', goal, ['Muscle Gain', 'Weight Loss', 'Maintenance'], (v) => setState(() => goal = v!)),
          TextField(controller: ageController, decoration: const InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
          TextField(controller: heightController, decoration: const InputDecoration(labelText: 'Height (cm)'), keyboardType: TextInputType.number),
          TextField(controller: weightController, decoration: const InputDecoration(labelText: 'Weight (kg)'), keyboardType: TextInputType.number),
          _buildDropdown('Injured?', injury, ['No', 'Yes'], (v) => setState(() => injury = v!)),
          _buildDropdown('Activity Level', activityLevel, ['Sedentary', 'Light', 'Moderate', 'Active', 'Very Active'], (v) => setState(() => activityLevel = v!)),
          _buildDropdown('Breath Level', breathLevel, ['Normal', 'Low'], (v) => setState(() => breathLevel = v!)),
          _buildDropdown('Where to train?', trainingPlace, ['Home', 'Gym'], (v) => setState(() => trainingPlace = v!)),
          TextField(controller: equipmentController, decoration: const InputDecoration(labelText: 'Equipment')),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text("Training days/week:"),
              const SizedBox(width: 12),
              Expanded(
                child: Slider(
                  value: trainingDays.toDouble(),
                  min: 1,
                  max: 7,
                  divisions: 6,
                  label: trainingDays.toString(),
                  onChanged: (value) => setState(() => trainingDays = value.toInt()),
                ),
              ),
            ],
          ),
          ElevatedButton(onPressed: _calculateCalories, child: const Text('Calculate Calories')),
          const SizedBox(height: 20),
          if (calories != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                border: Border.all(color: Colors.teal.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text('Estimated Daily Calories',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('${calories!.toStringAsFixed(0)} kcal',
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildWaterTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('Water Intake Tracker', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text('Glasses today: $waterGlasses', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => setState(() => waterGlasses++), child: const Text('+1 Glass')),
              const SizedBox(width: 12),
              ElevatedButton(onPressed: () => setState(() => waterGlasses = 0), child: const Text('Reset')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepsTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('Step Tracker', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text('Steps today: $stepsToday', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => setState(() => stepsToday += 500), child: const Text('+500 Steps')),
              const SizedBox(width: 12),
              ElevatedButton(onPressed: () => setState(() => stepsToday = 0), child: const Text('Reset')),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.local_fire_department), text: 'Calories'),
            Tab(icon: Icon(Icons.local_drink), text: 'Water'),
            Tab(icon: Icon(Icons.directions_walk), text: 'Steps'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCalorieTab(),
          _buildWaterTab(),
          _buildStepsTab(),
        ],
      ),
    );
  }
}
