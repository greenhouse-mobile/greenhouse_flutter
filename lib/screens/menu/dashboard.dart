import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/record_card.dart';
import 'package:greenhouse/models/record.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
          "id": "124234",
          "created_by": "Winston Smith",
          "crop_day": 1,
          "created_at": "2021-08-01",
          "updated_at": "2021-08-01",
          "phase": "Preparation area",
          "crop_id": "1",
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
          "id": "124235",
          "created_by": "Winston Smith",
          "crop_day": 1,
          "created_at": "2021-08-01",
          "updated_at": "2021-08-01",
          "phase": "Induction",
          "crop_id": "1",
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
          "id": "124236",
          "created_by": "Winston Smith",
          "crop_day": 1,
          "created_at": "2021-08-01",
          "updated_at": "2021-08-01",
          "phase": "Tunnel",
          "crop_id": "1",
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
        title: Row(children: [
          SvgPicture.asset(
            'assets/logo/logo.svg',
            width: 30,
            height: 30,
          ),
          SizedBox(width: 5),
          Text('Greenhouse',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Welcome,',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              Text('Dashboard',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DashboardButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/crops-in-progress');
                    },
                    svgAsset: 'assets/icons/clock.svg',
                    buttonText: 'Crops in\nProgress',
                  ),
                  DashboardButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/crops-archive');
                    },
                    svgAsset: 'assets/icons/archive.svg',
                    buttonText: 'Crops\nArchive',
                  ),
                  DashboardButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/dashboard');
                    },
                    svgAsset: 'assets/icons/statistics.svg',
                    buttonText: 'Statistical\nReports',
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Recent records',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              ...records.map((record) => RecordCard(record: record)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GreenhouseBottomNavigationBar(),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String svgAsset;
  final String buttonText;

  DashboardButton({
    required this.onPressed,
    required this.svgAsset,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF67864A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fixedSize: Size(100, 100),
          ),
          child: SvgPicture.asset(svgAsset),
        ),
        Text(
          buttonText,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
