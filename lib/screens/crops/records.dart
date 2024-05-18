import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/record_card.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  List<RecordCard> recordCards = [
    RecordCard(
      entryDate: '2021-08-01',
      recordId: '124234',
      author: 'Winston Smith',
      currentPhase: 'Preparation area',
    ),
    RecordCard(
      entryDate: '2021-08-01',
      recordId: '124235',
      author: 'Winston Smith',
      currentPhase: 'Induction',
    ),
    RecordCard(
      entryDate: '2021-08-01',
      recordId: '124236',
      author: 'Winston Smith',
      currentPhase: 'Tunnel',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Records'),
      ),
      body: ListView.builder(
        itemCount: recordCards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: recordCards[index],
            ),
          );
        },
      ),
      bottomNavigationBar: GreenhouseBottomNavigationBar()
    );
  }
}
