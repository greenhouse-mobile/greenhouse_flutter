import 'package:flutter/material.dart';
import 'package:greenhouse/screens/crops_in_progress.dart';
import 'package:greenhouse/screens/dashboard.dart';
import 'package:greenhouse/screens/login.dart';
import 'package:greenhouse/screens/signup.dart';

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
        fontFamily: 'Nunito',
        splashColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => Dashboard(),
        'login': (context) => LoginScreen(),
        'sign-up': (context) => SignUpScreen(),
        '/crops-in-progress': (context) => CropsInProgress(key: UniqueKey()),
      },
    );
  }
}
