import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  final List<String> _titles = [
    'Stock',
    'Preparation area',
    'Bunker',
    'Tunnel',
    'Incubation',
    'Casing',
    'Induction',
    'Harvest',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text('STEPPER',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ]),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: _titles.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned(
                    top: 50,
                    bottom: 0,
                    left: 46,
                    child: (index != 10 && index != _titles.length - 1)
                        ? CustomPaint(
                            size: Size(1, double.infinity),
                            painter: LinePainter(),
                          )
                        : Container(),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical:
                              20.0), // Add vertical padding to increase the space between each circle
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFF7DA257),
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(_titles[index]),
                        onTap: () {
                          switch (index) {
                            case 0:
                              Navigator.pushNamed(context, '/');
                              break;
                            case 1:
                              Navigator.pushNamed(context, '/');
                              break;
                            case 2:
                              Navigator.pushNamed(context, '/');
                              break;
                            case 3:
                              Navigator.pushNamed(context, '/');
                              break;
                            case 4:
                              Navigator.pushNamed(context, '/');
                              break;
                            case 5:
                              Navigator.pushNamed(context, '/');
                              break;
                            case 6:
                              Navigator.pushNamed(context, '/');
                              break;
                            case 7:
                              Navigator.pushNamed(context, '/');
                              break;
                          }
                        },
                      ))
                ],
              );
            },
          )),
      bottomNavigationBar: GreenhouseBottomNavigationBar(),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;
    canvas.drawLine(Offset(0, 30), Offset(0, size.height + 15), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
