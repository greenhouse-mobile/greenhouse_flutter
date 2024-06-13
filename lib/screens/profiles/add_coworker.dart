import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/editing_textForm.dart';
import 'package:greenhouse/widgets/message_response.dart';

class AddCoworkerScreen extends StatelessWidget {
  AddCoworkerScreen({super.key, required this.updateList});

  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerRole = TextEditingController();
  final TextEditingController _controllerUserId = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  final Function updateList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go back', style: TextStyle(fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Color(0xFFECECEC),
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Color(0xFF67864A),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EditingTextForm(
                        hintText: "First name",
                        valueController: _controllerFirstName,
                        placeholderText: "Enter first name",
                      ),
                      EditingTextForm(
                        hintText: "Last name",
                        valueController: _controllerLastName,
                        placeholderText: "Enter last name",
                      ),
                      EditingTextForm(
                        hintText: "Role withing the company",
                        valueController: _controllerRole,
                        placeholderText: "Enter role",
                      ),
                      EditingTextForm(
                        hintText: "Username",
                        valueController: _controllerUserId,
                        placeholderText: "Enter username",
                      ),
                      EditingTextForm(
                        hintText: "Email",
                        valueController: _controllerEmail,
                        placeholderText: "Enter email",
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    Color(0xFF67864A)),
                                shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Color(0xFF4C6444))))),
                            onPressed: () {
                              String firstName = _controllerFirstName.text;
                              String lastName = _controllerLastName.text;
                              String role = _controllerRole.text;
                              String username = _controllerUserId.text;
                              String email = _controllerEmail.text;

                              if (firstName.isNotEmpty &&
                                  lastName.isNotEmpty &&
                                  role.isNotEmpty &&
                                  username.isNotEmpty &&
                                  email.isNotEmpty) {
                                messageResponse(
                                  context,
                                  "Are you sure you want to\nadd a new employee?",
                                  "Yes, Add",
                                  () {
                                    updateList(
                                        firstName, lastName, role, username);
                                    Navigator.of(context).pop();
                                  },
                                );
                              }
                            },
                            child: const Text(
                              "Add employee",
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ],
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
