import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/message_response.dart';

class AddCoworkerScreen extends StatelessWidget {
  AddCoworkerScreen({super.key, required this.updateList});

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerRole = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  final Function updateList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Go back', style: TextStyle(fontSize: 16)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                  controller: _controllerName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Name")),
              const SizedBox(height: 20),
              TextFormField(
                  controller: _controllerRole,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Role")),
              const SizedBox(height: 20),
              TextFormField(
                  controller: _controllerUsername,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Username")),
              const SizedBox(height: 20),
              TextFormField(
                  controller: _controllerEmail,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email")),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  String name = _controllerName.text;
                  String role = _controllerRole.text;
                  String username = _controllerUsername.text;
                  String email = _controllerEmail.text;

                  if (name.isNotEmpty &&
                      role.isNotEmpty &&
                      username.isNotEmpty &&
                      email.isNotEmpty) {
                    messageResponse(
                        context,
                        "Are you sure you want to\nadd a new employee",
                        "Yes, Add", () {
                      updateList(name, role, username, email);
                      Navigator.of(context).pop();
                    });
                  }
                },
                child: const Text("Save"),
              )
            ],
          ),
        ));
  }
}
