import 'package:flutter/material.dart';
import 'package:greenhouse/models/crop.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/line_chart.dart';
import 'package:greenhouse/widgets/multiline_chart.dart';

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
      body: SingleChildScrollView(
        child: Center(
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
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phase 1: Bunker temperature control',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              LineChartSample4(),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phase 2: Temperature control in pausterization tunnel',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              legendItem(),
              LineChartSample1(),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phase 3: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GreenhouseBottomNavigationBar(),
    );
  }
}

Widget legendItem() {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.blue,
                ),
                const SizedBox(width: 5),
                const Text('Ct1'),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.red,
                ),
                const SizedBox(width: 5),
                const Text('Ct2'),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: Color.fromARGB(255, 168, 243, 170),
                ),
                const SizedBox(width: 5),
                const Text('Ct3'),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: const Color.fromRGBO(255, 165, 0, 1),
                ),
                const SizedBox(width: 5),
                const Text('Ct4'),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: Color.fromRGBO(84, 235, 255, 1),
                ),
                const SizedBox(width: 5),
                const Text('At'),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: Color.fromARGB(255, 227, 255, 18),
                ),
                const SizedBox(width: 5),
                const Text('At'),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
