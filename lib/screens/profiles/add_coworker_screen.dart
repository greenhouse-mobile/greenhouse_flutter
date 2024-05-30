import 'package:flutter/material.dart';
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
                      _coworkerInfo("First name", _controllerFirstName),
                      _coworkerInfo("Last name", _controllerLastName),
                      _coworkerInfo(
                          "Role withing the company", _controllerRole),
                      _coworkerInfo("Username", _controllerUserId),
                      _coworkerInfo("Email", _controllerEmail),
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
                              "Invite Employee",
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
    );
  }

  Widget _coworkerInfo(String hintText, TextEditingController valueController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          hintText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $hintText';
            }
            return null;
          },
          controller: valueController,
          decoration: InputDecoration(
            hintText: 'Enter $hintText',
            hintStyle: TextStyle(color: Color(0xFF727272), fontSize: 16),
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
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
        ),
      ],
    );
  }
}
