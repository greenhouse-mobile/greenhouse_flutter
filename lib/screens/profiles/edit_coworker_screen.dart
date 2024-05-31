import 'package:flutter/material.dart';
import 'package:greenhouse/models/profile.dart';
import 'package:greenhouse/widgets/delete_dialog.dart';
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
  State<EditCoworkerScreen> createState() => _EditCoworkerScreen();
}

class _EditCoworkerScreen extends State<EditCoworkerScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _roleController;
  late TextEditingController _iconUrlController;
  late TextEditingController _userIdController;

  @override
  void initState() {
    _firstNameController =
        TextEditingController(text: widget.profile.firstName);
    _lastNameController = TextEditingController(text: widget.profile.lastName);
    _roleController = TextEditingController(text: widget.profile.role);
    _iconUrlController = TextEditingController(text: widget.profile.iconUrl);
    _userIdController = TextEditingController(text: widget.profile.userId);
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
                      _coworkerInfo("First name", _firstNameController,
                          widget.profile.firstName),
                      _coworkerInfo("Last name", _lastNameController,
                          widget.profile.lastName),
                      _coworkerInfo("Role within the company", _roleController,
                          widget.profile.role),
                      _coworkerInfo(
                          "Username", _userIdController, widget.profile.userId),
                      _coworkerInfo(
                          "Image", _iconUrlController, widget.profile.iconUrl),
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
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color(0xFF4C6444))))),
                          onPressed: () async {
                            String firstName = _firstNameController.text;
                            String lastName = _lastNameController.text;
                            String role = _roleController.text;
                            String iconUrl = _iconUrlController.text;
                            String userId = _userIdController.text;
                            String id = widget.profile.id;
                            String company = widget.profile.company;

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
                                company: company,
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
                            "Edit Employee's profile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
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
    );
  }

  Widget _coworkerInfo(String hintText, TextEditingController valueController,
      String placeholderText) {
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
            hintText: placeholderText,
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
