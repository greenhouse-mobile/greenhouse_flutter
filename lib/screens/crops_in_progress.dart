import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/crop_card.dart';

class CropsInProgress extends StatefulWidget {
  const CropsInProgress({super.key});

  @override
  State<CropsInProgress> createState() => _CropsInProgressState();
}

class _CropsInProgressState extends State<CropsInProgress> {
  String searchQuery = '';
  List<CropCard> cropCards = [
    CropCard(
      startDate: '2021-08-01',
      currentPhase: 'Phase 1',
      cropId: '964234',
    ),
    CropCard(
      startDate: '2021-08-01',
      currentPhase: 'Phase 1',
      cropId: '123457',
    ),
    CropCard(
      startDate: '2021-08-01',
      currentPhase: 'Phase 1',
      cropId: '123458',
    ),
  ];

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'CROPS IN PROGRESS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search crops...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2022),
                    ),
                  ),
                ],
              ),
            ),
            ...cropCards
                .where((cropCard) => cropCard.cropId.contains(searchQuery))
                .toList(),
          ],
        ),
        bottomNavigationBar: GreenhouseBottomNavigationBar());
  }
}