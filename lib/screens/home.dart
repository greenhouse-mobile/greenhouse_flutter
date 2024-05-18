import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/champis.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          ),
        ),
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black12,
                  Colors.black87,
                ],
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(children: [
                Positioned(top: 80, right: 50, left: 50, child: _buildTop()),
                Positioned(bottom: 0, child: _buildBottom(context)),
              ]),
            )));
  }

  Widget _buildTop() {
    return Center(
      child: SvgPicture.asset(
        'assets/logo_white.svg',
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: _welcome(context),
        ),
      ),
    );
  }

  Widget _welcome(BuildContext context) {
    return Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        padding: const EdgeInsets.all(32.0),
        child: Column(children: [
          SizedBox(height: 20),
          Text(
            "Welcome to \nGreenhouse!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                height: 2,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C6444)),
          ),
          SizedBox(height: 20),
          Text("To use the application, please log in or sign up",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF000000))),
          SizedBox(height: 50),
          _outlinedButton(context, "Sign up", "/signup"),
          SizedBox(height: 20),
          _button(context, "Log in", "/login"),
          SizedBox(height: 150),
        ]));
  }

  Widget _button(BuildContext context, String buttonText, String route) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF67864A)),
        ),
        child: Text(buttonText,
            style: TextStyle(fontSize: 12, color: Colors.white)),
      ),
    );
  }

  Widget _outlinedButton(
      BuildContext context, String buttonText, String route) {
    return SizedBox(
      width: double.maxFinite,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(color: Color(0xFF67864A))),
        ),
        child: Text(buttonText,
            style: TextStyle(fontSize: 12, color: Color(0xFF67864A))),
      ),
    );
  }
}
