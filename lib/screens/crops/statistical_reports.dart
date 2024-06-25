import 'package:flutter/material.dart';
import 'package:greenhouse/models/crop.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';

class StatisticalReports extends StatefulWidget {
  final Crop crop;

  const StatisticalReports({super.key, required this.crop});

  @override
  State<StatisticalReports> createState() => _StatisticalReportsState();
}

class _StatisticalReportsState extends State<StatisticalReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Back', style: TextStyle(fontSize: 16)),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Statistical Reports',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GreenhouseBottomNavigationBar(),
    );
  }
}
