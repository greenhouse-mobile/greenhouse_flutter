import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            SvgPicture.asset(
              'assets/logo.svg',
              width: 30,
              height: 30,
            ),
            SizedBox(width: 5),
            Text('Greenhouse',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Welcome,',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 16.0),
                Text('Dashboard',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DashboardButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/crops-in-progress');
                      },
                      svgAsset: 'assets/clock.svg',
                      buttonText: 'Crops in\nProgress',
                    ),
                    DashboardButton(
                      onPressed: () {},
                      svgAsset: 'assets/archive.svg',
                      buttonText: 'Crops\nArchive',
                    ),
                    DashboardButton(
                      onPressed: () {},
                      svgAsset: 'assets/statistics.svg',
                      buttonText: 'Statistical\nReports',
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Recent records',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            )),
        bottomNavigationBar: GreenhouseBottomNavigationBar());
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
