import 'package:flutter/material.dart';
import 'package:greenhouse/screens/menu/sign_up.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhouse/widgets/navigation_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mushroom_images/champis.png'),
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
        'assets/logo/logo_white.svg',
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
          child: _loginForm(context),
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          _loginSignUpButton(context),
          SizedBox(height: 20),
          _inputField("Username", Icons.person),
          SizedBox(height: 20),
          _inputField("Password", Icons.lock),
          SizedBox(height: 315),
          NavigationButton(
            buttonText: "Login",
            route: '/dashboard',
          ),
        ],
      ),
    );
  }

  Widget _loginSignUpButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = (screenWidth - 100) / 2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Text("LOG IN",
                  style: TextStyle(
                      color: Color(0xFF7DA257),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 5),
            Container(
              width: containerWidth,
              margin: EdgeInsets.only(left: 10),
              height: 2,
              color: Color(0xFF7DA257),
            ),
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text("SIGN UP",
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
            ),
            SizedBox(height: 5),
            Container(
              width: containerWidth,
              margin: EdgeInsets.only(right: 10),
              height: 2,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }

  Widget _inputField(String hintText, IconData icon) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $hintText';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(color: Color(0xFF727272), fontSize: 12),
          hintText: 'Enter $hintText',
          hintStyle: TextStyle(color: Color(0xFF727272), fontSize: 12),
          fillColor: Color(0xFFECECEC),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF67864A)),
          ),
          prefixIcon: Icon(icon, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
    );
  }
}
