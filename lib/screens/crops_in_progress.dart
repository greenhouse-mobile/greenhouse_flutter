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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Arrow pointing to the left
            onPressed: () {
              // Add your button tap code here
            },
          ),
          title: Text('Go Back'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            CropCard(
              startDate: '2021-08-01',
              currentPhase: 'Phase 1',
              cropId: '123456', // Add the crop ID
            ),
            CropCard(
              startDate: '2021-08-01',
              currentPhase: 'Phase 1',
              cropId: '123457', // Add the crop ID
            ),
            CropCard(
              startDate: '2021-08-01',
              currentPhase: 'Phase 1',
              cropId: '123458', // Add the crop ID
            ),
          ],
        ),
        bottomNavigationBar: GreenhouseBottomNavigationBar());
  }
}