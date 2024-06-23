import 'package:flutter/material.dart';
import 'package:greenhouse/models/profile.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/delete_dialog.dart';
import 'package:greenhouse/widgets/editing_textForm.dart';
import 'package:greenhouse/widgets/message_response.dart';

class EditCoworkerScreen extends StatefulWidget {
  const EditCoworkerScreen({
    super.key,
    required this.profile,
    required this.updateProfile,
    required this.deleteProfile,
  });

  final Profile profile;
  final Function(Profile) updateProfile;
  final Function(String) deleteProfile;

  @override
  State<EditCoworkerScreen> createState() => _EditCoworkerScreenState();
}

class _EditCoworkerScreenState extends State<EditCoworkerScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _roleController;
  late TextEditingController _iconUrlController;
  late TextEditingController _userIdController;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _roleController = TextEditingController();
    _iconUrlController = TextEditingController();
    _userIdController = TextEditingController();
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
          child: Column(
            children: [
              Center(
                child: widget.profile.iconUrl ==
                        'https://icons.veryicon.com/png/o/education-technology/test-website-linear-icon/user-147.png'
                    ? CircleAvatar(
                        radius: 70,
                        backgroundColor: Color(0xFFECECEC),
                        child: Icon(
                          Icons.person,
                          size: 70,
                          color: Color(0xFF67864A),
                        ),
                      )
                    : CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(widget.profile.iconUrl),
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
                        valueController: _firstNameController,
                        placeholderText: widget.profile.firstName,
                      ),
                      EditingTextForm(
                        hintText: "Last name",
                        valueController: _lastNameController,
                        placeholderText: widget.profile.lastName,
                      ),
                      EditingTextForm(
                        hintText: "Role within the company",
                        valueController: _roleController,
                        placeholderText: widget.profile.role,
                      ),
                      EditingTextForm(
                        hintText: "Username",
                        valueController: _userIdController,
                        placeholderText: widget.profile.userId,
                      ),
                      EditingTextForm(
                        hintText: "Image",
                        valueController: _iconUrlController,
                        placeholderText: widget.profile.iconUrl,
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              Color(0xFF67864A),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                  color: Color(0xFF4C6444),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            String firstName = _firstNameController.text.isEmpty
                                ? widget.profile.firstName
                                : _firstNameController.text;
                            String lastName = _lastNameController.text.isEmpty
                                ? widget.profile.lastName
                                : _lastNameController.text;
                            String role = _roleController.text.isEmpty
                                ? widget.profile.role
                                : _roleController.text;
                            String iconUrl = _iconUrlController.text.isEmpty
                                ? widget.profile.iconUrl
                                : _iconUrlController.text;
                            String userId = _userIdController.text.isEmpty
                                ? widget.profile.userId
                                : _userIdController.text;
                            String id = widget.profile.id;

                            if (firstName.isNotEmpty ||
                                lastName.isNotEmpty ||
                                role.isNotEmpty ||
                                iconUrl.isNotEmpty ||
                                userId.isNotEmpty) {
                              Profile updatedProfile = Profile(
                                id: id,
                                userId: userId,
                                firstName: firstName,
                                lastName: lastName,
                                iconUrl: iconUrl,
                                role: role,
                              );

                              void editProfile() {
                                try {
                                  widget.updateProfile(updatedProfile);
                                  Navigator.pop(context, updatedProfile);
                                } catch (e) {
                                  print('Failed to update profile: $e');
                                }
                              }

                              messageResponse(
                                context,
                                "Are you sure you want to\nedit ${widget.profile.firstName} ${widget.profile.lastName} profile?",
                                "Yes, Edit",
                                editProfile,
                              );
                            }
                          },
                          child: const Text(
                            "Edit employee profile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          deleteDialog(
                            context,
                            "Are you sure you want to \ndelete ${widget.profile.firstName} ${widget.profile.lastName} employee?",
                            "Yes, Delete",
                            () => widget.deleteProfile(widget.profile.id),
                          );
                        },
                        child: Text(
                          'Delete employee',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ),
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
