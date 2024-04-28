import 'package:flutter/material.dart';

class GreenhouseBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const GreenhouseBottomNavigationBar({super.key, required this.onTap, required this.currentIndex});

  @override
  State<GreenhouseBottomNavigationBar> createState() =>
      _GreenhouseBottomNavigationBarState();
}

class _GreenhouseBottomNavigationBarState
    extends State<GreenhouseBottomNavigationBar> {

  void _onItemTapped(int index) {
    widget.onTap(index);
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
          currentIndex: widget.currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
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
