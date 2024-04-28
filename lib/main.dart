import 'package:flutter/material.dart';

import 'package:greenhouse/screens/login.dart';

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
        fontFamily: ('inter'),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
