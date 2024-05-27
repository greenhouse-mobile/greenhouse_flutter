import 'package:flutter/material.dart';
import 'package:greenhouse/models/crop_phase.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import '../../widgets/crop_card.dart';

class StepperWidget extends StatefulWidget {
  final CropCard chosenCrop;

  const StepperWidget({super.key, required this.chosenCrop});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  final List<CropCurrentPhase> itemsList = [
    CropCurrentPhase.formula,
    CropCurrentPhase.preparationArea,
    CropCurrentPhase.bunker,
    CropCurrentPhase.tunnel,
    CropCurrentPhase.incubation,
    CropCurrentPhase.casing,
    CropCurrentPhase.induction,
    CropCurrentPhase.harvest,
  ];

  CropCard? chosenCrop;

  @override
  void initState(){
    super.initState();
    chosenCrop = widget.chosenCrop;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stepperChildren = [];

    stepperChildren.add(StepperTitle(name: widget.chosenCrop.cropName, date: widget.chosenCrop.startDate));

    for (final item in itemsList) {
      if (double.parse(item.phaseNumber) <
          double.parse(chosenCrop?.currentPhase.phaseNumber ?? '0')) {
        stepperChildren.add(
          StepperButton(
            phase: item,
            isComplete: true,
            navigateTo: () {
              Navigator.pushNamed(context, '/records');
            },
          ),
        );
      } else if (item == chosenCrop?.currentPhase) {
        stepperChildren.add(
          StepperButton(
            phase: item,
            isCurrent: true,
            navigateTo: () {
              Navigator.pushNamed(context, '/records');
            },
          ),
        );
      } else if (item != chosenCrop?.currentPhase) {
        stepperChildren.add(
          StepperButton(
            phase: item,
            navigateTo: () {
              Navigator.pushNamed(context, '/records');
            },
          ),
        );
      }

      if (item != itemsList.last) {
        stepperChildren.add(
          StepperDivider(),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Go Back',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 40, top: 30, bottom: 18),
        child: ListView(
          children: [
            ...stepperChildren,
          ],
        ),
      ),
      bottomNavigationBar: GreenhouseBottomNavigationBar(),
    );
  }
}

class StepperTitle extends StatelessWidget {
  final String name;
  final String date;

  StepperTitle({required this.name, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildStepperInfo(),
          SizedBox(height: 20),
          _buildStartDateInfo(),
        ],
      ),
    );
  }

  Widget _buildStepperInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'STEPPER',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C6444)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          'Crop Name: $name',
          style: TextStyle(color: Color(0xFF444444)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStartDateInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Start Date: ',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: date,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class StepperButton extends StatelessWidget {
  final CropCurrentPhase phase;
  final bool isComplete;
  final bool isCurrent;
  final VoidCallback navigateTo;

  const StepperButton({
    super.key,
    required this.phase,
    this.isComplete = false,
    this.isCurrent = false,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    if (isCurrent) {
      return Row(
        children: [
          ElevatedButton(
            onPressed: navigateTo,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF7DA257),
              minimumSize: Size(40, 40),
              side: BorderSide(color: Color(0xFF7DA257)),
              padding: EdgeInsets.zero,
            ),
            child: Text(
              phase.phaseNumber,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: navigateTo,
            child: Text(
              phase.phaseName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C6444),
              ),
            ),
          ),
        ],
      );
    } else {
      if (isComplete) {
        return Row(
          children: [
            ElevatedButton(
              onPressed: navigateTo,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7DA257),
                minimumSize: Size(40, 40),
                side: BorderSide(color: Color(0xFF7DA257)),
                padding: EdgeInsets.zero,
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: navigateTo,
              child: Text(
                phase.phaseName,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        );
      } else {
        return Row(
          children: [
            OutlinedButton(
              onPressed: navigateTo,
              style: OutlinedButton.styleFrom(
                minimumSize: Size(40, 40),
                side: BorderSide(color: Colors.black),
                padding: EdgeInsets.zero,
              ),
              child: Text(
                phase.phaseNumber,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: navigateTo,
              child: Text(
                phase.phaseName,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      }
    }
  }
}

class StepperDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 26),
      child: SizedBox(
        height: 40,
        child: CustomPaint(
          painter: _LinePainter(),
        ),
      ),
    );
  }
}

class _LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;
    canvas.drawLine(Offset(0, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
