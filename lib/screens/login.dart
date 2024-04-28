import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://cdn.bioguia.com/embed/6f2a4f61c912d23c0a874b9a33377c8c31684724081/alimentacion-saludable-hongos.jpeg?imagick=1&size=750"),
            fit: BoxFit.cover,
            colorFilter:
            ColorFilter.mode(Colors.black38, BlendMode.darken),
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
        )
      )
    );
  }

  Widget _buildTop(){
    return Center(
      child: Container(
          height: 150,
          child: Image.network("https://github.com/greenhouse-mobile/greenhouse-jcompose/blob/feat/authorization/app/src/main/res/drawable/logo.png?raw=true")
      ),
    );
  }

  Widget _buildBottom(BuildContext context){
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

  Widget _loginForm(BuildContext context){
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          _loginSignUpButton(context)
        ],
      ),
    );
  }

  Widget _loginSignUpButton(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = (screenWidth - 100) / 2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Text("LOG IN", style: TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 5),
            Container(
              width: containerWidth,
              margin: EdgeInsets.only(left: 10),
              height: 2,
              color: Colors.green,
            ),
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Text("SIGN UP", style: TextStyle(color: Colors.grey)),
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

/*
  Widget _inputField(String hint){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
  */
}