import 'package:flutter/material.dart';
import 'analytics_screen.dart';
import 'profile_screen.dart';
import 'chat_screen.dart'; // ✅ Real AI chat screen
import 'food_screen.dart'; // 🍎 New Food Tracker screen
import 'workout_screen.dart';
import 'notification_service.dart'; // ✅ Import the notification service

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const WorkoutScreen(),
    const AnalyticsScreen(),
    const ChatScreen(),
    const FoodScreen(), // 🍎 New screen
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _initNotification();
  }

  Future<void> _initNotification() async {
    await NotificationService.init();
    await NotificationService.scheduleDailyReminder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workout'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Food'), // 🍎
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
