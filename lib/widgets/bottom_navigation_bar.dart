import 'package:flutter/material.dart';

class GreenhouseBottomNavigationBar extends StatefulWidget {
  const GreenhouseBottomNavigationBar({super.key});

  @override
  State<GreenhouseBottomNavigationBar> createState() =>
      _GreenhouseBottomNavigationBarState();
}

class _GreenhouseBottomNavigationBarState
    extends State<GreenhouseBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/crops-in-progress');
        break;
      case 1:
        Navigator.pushNamed(context, '/dashboard');
        break;
      case 2:
        Navigator.pushNamed(context, '/crops-in-progress');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF4C6444),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}