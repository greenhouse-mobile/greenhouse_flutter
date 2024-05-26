import 'package:flutter/material.dart';
import 'package:greenhouse/screens/menu/home.dart';
import 'package:greenhouse/screens/crops/crops_in_progress.dart';
import 'package:greenhouse/screens/menu/dashboard.dart';
import 'package:greenhouse/screens/menu/login.dart';
import 'package:greenhouse/screens/crops/records.dart';
import 'package:greenhouse/screens/menu/sign_up.dart';
import 'package:greenhouse/screens/crops/stepper.dart';
import 'package:greenhouse/screens/profiles/company_profile.dart';
import 'package:greenhouse/screens/profiles/user_profile.dart';

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
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/dashboard': (context) => Dashboard(),
        '/crops-in-progress': (context) => CropsInProgress(key: UniqueKey()),
        '/stepper': (context) => StepperWidget(),
        '/records': (context) => RecordsScreen(),
        '/user-profile': (context) => UserProfileScreen(),
        '/company-profile': (context) => CompanyProfileScreen(),
      },
    );
  }
}
