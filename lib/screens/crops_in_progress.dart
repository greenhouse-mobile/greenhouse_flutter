import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/crop_card.dart';

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
          child: CropCard(
            startDate: '2021-09-01',
            currentPhase: 'Phase 1',
            cropId: '1',
          ),

        ),
        bottomNavigationBar: GreenhouseBottomNavigationBar());
  }
}
