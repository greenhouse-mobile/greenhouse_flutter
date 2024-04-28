import 'package:flutter/material.dart';
import 'package:greenhouse/screens/crops_in_progress.dart';
import 'package:greenhouse/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/crops-in-progress': (context) => CropsInProgress(),
      },
    );
  }
}
