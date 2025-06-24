// main_nav_controller.dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';

class MainNavController extends StatefulWidget {
  const MainNavController({super.key});

  @override
  State<MainNavController> createState() => _MainNavControllerState();
}

class _MainNavControllerState extends State<MainNavController> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    CartPage(
      cartItems: [
        {'title': 'Test Item', 'price': 999.0},
      ],
      onRemove: (index) => debugPrint('🗑️ Remove index $index'),
    ),
    const ProfilePage(userName: 'Md Aurangzeb', preferredMood: 'Happy', language: 'English'),
  ];

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
