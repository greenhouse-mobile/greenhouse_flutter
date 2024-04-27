import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            SvgPicture.asset('assets/logo.svg', width: 30, height: 30,),
            SizedBox(width: 5),
            Text('Greenhouse',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fixedSize: Size(100, 100),
                            ),
                            child: SvgPicture.asset('assets/logo.svg',)),
                        Text('Crops in\nProgress', style: TextStyle(fontSize: 16))
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fixedSize: Size(100, 100),
                            ),
                            child: SvgPicture.asset('assets/logo.svg',)),
                        Text('Crops\nArchive', style: TextStyle(fontSize: 16))
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fixedSize: Size(100, 100),
                            ),
                            child: SvgPicture.asset('assets/logo.svg',)),
                        Text('Statistical\nReports', style: TextStyle(fontSize: 16))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Recent records',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            )));
  }
}
