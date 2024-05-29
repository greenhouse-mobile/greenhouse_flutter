import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/record_card.dart';
import 'package:greenhouse/models/record.dart';

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
  List<Record> records = [];

  @override
  void initState() {
    super.initState();
    loadRecords();
  }

  void loadRecords() {
    String jsonString = '''{
      "records": [
          {
          "id": "cc2c4c87-c511-243a-a45c-99a02fa112d1",
          "created_by": "Alan Galavis",
          "crop_day": 1,
          "created_at": "Mon May 27 2024",
          "updated_at": "Mon May 27 2024",
          "phase": "Formula",
          "crop_id": "cc7c6c19-c416-453a-a93b-99a02fa136d0",
          "payload": {
            "data": [
              {"name": "Hay", "value": "128"},
              {"name": "Corn", "value": "300"},
              {"name": "Guano", "value": "100"},
              {"name": "Cotton seed cake", "value": "400"},
              {"name": "Soybean meal", "value": "356"},
              {"name": "Urea", "value": "356"},
              {"name": "Ammonium sulfate", "value": "125"}
            ]
          }
        },
        {
          "id": "cc2c4c87-c511-243a-a45c-99a02fa112d1",
          "created_by": "Winston Smith",
          "crop_day": 2,
          "created_at": "Tue May 28 2024",
          "updated_at": "Tue May 28 2024",
          "phase": "Formula",
          "crop_id": "cc8b6c19-b816-323a-c93b-99a02fa126d0",
          "payload": {
            "data": [
              {"name": "Hay", "value": "129"},
              {"name": "Corn", "value": "299"},
              {"name": "Guano", "value": "102"},
              {"name": "Cotton seed cake", "value": "425"},
              {"name": "Soybean meal", "value": "357"},
              {"name": "Urea", "value": "359"},
              {"name": "Ammonium sulfate", "value": "123"}
            ]
          }
        }
      ]
    }''';

    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    records = (jsonData['records'] as List)
        .map((recordJson) => Record.fromJson(recordJson))
        .toList();

    setState(() {});
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
          ...records
              .where((record) =>
                  record.id.contains(searchQuery) ||
                  record.createdBy.contains(searchQuery))
              .map((record) => RecordCard(record: record))
              .toList(),
        ],
      ),
      bottomNavigationBar: GreenhouseBottomNavigationBar(),
    );
  }
}
