import 'package:flutter/material.dart';
import 'package:greenhouse/screens/crops_in_progress.dart';
import 'package:greenhouse/screens/dashboard.dart';

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
        '/': (context) => Dashboard(),
        '/crops-in-progress': (context) => CropsInProgress(key: UniqueKey()),
      },
    );
  }
}
