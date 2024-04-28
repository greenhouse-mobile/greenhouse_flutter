import 'package:flutter/material.dart';

class GreenhouseBottomNavigationBar extends StatelessWidget {
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
