import 'package:flutter/material.dart';
import 'package:greenhouse/screens/crops_in_progress.dart';
import 'package:greenhouse/screens/dashboard.dart';
import 'package:greenhouse/screens/login.dart';
import 'package:greenhouse/screens/records.dart';
import 'package:greenhouse/screens/signup.dart';
import 'package:greenhouse/screens/stepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greenhouse',
      theme: ThemeData(
        fontFamily: 'Inter',
        splashColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/dashboard': (context) => Dashboard(),
        '/crops-in-progress': (context) => CropsInProgress(key: UniqueKey()),
        '/stepper': (context) => StepperWidget(),
        '/records': (context) => RecordsScreen(),
      },
    );
  }
}
