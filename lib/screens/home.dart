import 'package:flutter/material.dart';
import 'crops_in_progress.dart';
import 'dashboard.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    CropsInProgress(),
    Dashboard(),
    CropsInProgress(), // Placeholder for unknown
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: GreenhouseBottomNavigationBar(onTap: onTabTapped, currentIndex: _currentIndex,)
    );
  }
}