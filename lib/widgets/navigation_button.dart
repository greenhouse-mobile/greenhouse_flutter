import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton(
      {super.key,
      required this.buttonText,
      required this.route,
      this.outline = false});
  final String buttonText;
  final String route;
  final bool outline;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
              outline ? Colors.white : Color(0xFF67864A)),
          side: WidgetStateProperty.all(BorderSide(color: Color(0xFF67864A))),
        ),
        child: Text(buttonText,
            style: TextStyle(
                fontSize: 12,
                color: outline ? Color(0xFF67864A) : Colors.white)),
      ),
    );
  }
}
