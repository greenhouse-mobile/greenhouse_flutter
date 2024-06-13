import 'package:flutter/material.dart';
import 'package:greenhouse/models/user.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/editing_textForm.dart';
import 'package:greenhouse/widgets/message_response.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({
    super.key,
    required this.user,
    required this.updateUser,
  });

  final User user;
  final Function(User) updateUser;

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreen();
}

class _EditPasswordScreen extends State<EditPasswordScreen> {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go back', style: TextStyle(fontSize: 16)),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Text(
                  'RESET YOUR PASSWORD',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C6444),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Color(0xFFB07D50),
                    child: Icon(
                      Icons.lock,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EditingTextForm(
                            hintText: "New password",
                            valueController: _passwordController,
                            placeholderText: ""),
                        EditingTextForm(
                            hintText: "Confirm password",
                            valueController: _confirmPasswordController,
                            placeholderText: ""),
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
                            onPressed: () async {
                              String password = _passwordController.text;
                              String confirmPassword =
                                  _confirmPasswordController.text;

                              if ((password.isNotEmpty) &&
                                  (confirmPassword.isNotEmpty) &&
                                  (password == confirmPassword)) {
                                User updatedUser = User(
                                    id: widget.user.id,
                                    username: widget.user.username,
                                    password: password,
                                    role: widget.user.role);

                                void editUser() {
                                  try {
                                    widget.updateUser(updatedUser);
                                    Navigator.pop(context, updatedUser);
                                  } catch (e) {
                                    print('Failed to update your profile: $e');
                                  }
                                }

                                messageResponse(
                                  context,
                                  "Are you sure you want to\nedit your password?",
                                  "Yes, Edit",
                                  editUser,
                                );
                              }
                            },
                            child: const Text(
                              "Change password",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]))),
      bottomNavigationBar: GreenhouseBottomNavigationBar(),
    );
  }
}
