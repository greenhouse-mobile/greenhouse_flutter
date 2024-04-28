import 'package:flutter/material.dart';
import 'package:greenhouse/screens/dashboard.dart';
import 'package:greenhouse/screens/login.dart';
import 'package:greenhouse/screens/signup.dart';
import 'package:greenhouse/screens/stepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greenhouse',
      theme: ThemeData(
        fontFamily: 'Nunito',
        splashColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => StepperWidget(),
        '/dashboard': (context) => Dashboard(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/stepper': (context) => StepperWidget(),
      },
    );
  }
}
