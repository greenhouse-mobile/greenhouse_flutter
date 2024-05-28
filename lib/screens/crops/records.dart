import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/message_response.dart';
import 'package:greenhouse/widgets/record_card.dart';

class RecordsScreen extends StatefulWidget {
  RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  var cropId = '1';
  var cropPhase = 'Preparation Area';
  DateTime selectedDate = DateTime.now();
  String searchQuery = '';
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

  void addNewRecord() {
    setState(() {
      recordCards.add(RecordCard(
        entryDate: '2021-08-01',
        recordId: '${recordCards.length + 1}',
        author: 'Winston Smith',
        currentPhase: 'Tunnel',
      ));
      recordCards = recordCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Go Back', style: TextStyle(fontSize: 16)),
        ),
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Crop ID: $cropId',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C6444)),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      cropPhase,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
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
                        hintText: 'Search records...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      final DateTime? datetime = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData(
                              colorScheme: ThemeData().colorScheme.copyWith(
                                    primary: Color(0xFF465B3F),
                                  ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (datetime != null) {
                        setState(() {
                          selectedDate = datetime;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            ...recordCards.where(
                (recordCard) => recordCard.recordId.contains(searchQuery)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            messageResponse(
                context,
                "Are you sure you want \nto create a record?",
                "Confirm",
                addNewRecord);
          },
          backgroundColor: Color(0xFFB07D50),
          child: Icon(Icons.add, color: Colors.white),
        ),
        bottomNavigationBar: GreenhouseBottomNavigationBar());
  }
}
