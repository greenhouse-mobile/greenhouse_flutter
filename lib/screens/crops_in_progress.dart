import 'package:flutter/material.dart';

class CropsInProgress extends StatefulWidget {
  const CropsInProgress({super.key});

  @override
  State<CropsInProgress> createState() => _CropsInProgressState();
}

class _CropsInProgressState extends State<CropsInProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Crops in Progress'),
        ));
  }
}
