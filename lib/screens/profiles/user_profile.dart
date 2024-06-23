import 'package:flutter/material.dart';
import 'package:greenhouse/models/profile.dart';
import 'package:greenhouse/models/user.dart';
import 'package:greenhouse/screens/profiles/edit_password.dart';
import 'package:greenhouse/services/profile_service.dart';
import 'package:greenhouse/services/user_preferences.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/avatar.dart';
import 'package:greenhouse/widgets/delete_dialog.dart';
import 'package:greenhouse/widgets/navigation_button.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _profileService = ProfileService();
  Profile? profile;
  String? username = "";

  Future<void> initialize() async {
    profile = await _profileService.getUserProfile();
    username = await UserPreferences.getUsername();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  User user =
      User(id: "1", username: "TheAdmin", password: "admin123", role: "admin");

  void updateUserProfile(User updatedUser) {
    setState(() {
      user = updatedUser;
    });
  }

  void deleteUser(String id) {
    //Todo: Delete user
    Navigator.pop(context);
    Future.delayed(Duration(milliseconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Avatar(
                imageUrl: profile?.iconUrl ?? "default_profile_image.jpg",
                radius: 70,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _userInfo(
                        "Name",
                        "${profile?.firstName ?? ""} ${profile?.lastName ?? ""}"
                            .trim()),
                    _userInfo("Username", username ?? ""),
                    SizedBox(height: 20),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/company-profile');
                        },
                        child: Row(
                          children: [
                            Text(
                              'Company',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                            Icon(Icons.arrow_forward, size: 16)
                          ],
                        )),
                    SizedBox(height: 10),
                    Text(
                      "companyName",
                      style: TextStyle(fontSize: 16, color: Color(0xFF444444)),
                    ),
                    _userInfo("Role within company", profile?.role ?? ""),
                    SizedBox(height: 20),
                    Text(
                      "Settings",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditPasswordScreen(
                              user: user,
                              updateUser: updateUserProfile,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot your password?',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF67864A)),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        deleteDialog(
                          context,
                          "Are you sure you want to \ndelete your account?",
                          "Yes, Delete",
                          () {
                            deleteUser(user.id);
                          },
                        );
                      },
                      child: Text(
                        'Delete account',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                    SizedBox(height: 20),
                    NavigationButton(
                        buttonText: "Log out", route: '/login', outline: true)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GreenhouseBottomNavigationBar(),
    );
  }

  Widget _userInfo(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(fontSize: 16, color: Color(0xFF444444)),
        ),
      ],
    );
  }
}
