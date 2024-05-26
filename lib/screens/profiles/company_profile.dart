import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/avatar.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/navigation_button.dart';

class CompanyProfileScreen extends StatelessWidget {
  const CompanyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var companyName = 'Pero Agro J&V SAC';
    var tin = '8767123131';
    var picture =
        'https://plazavea.vteximg.com.br/arquivos/ids/429454-450-450/20181533.jpg?v=637382855570500000';

    return Scaffold(
      appBar: AppBar(
        title: Text('Go back', style: TextStyle(fontSize: 16)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Avatar(
                imageUrl: picture,
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
                    _companyInfo("Company name", companyName),
                    _companyInfo("TIN", tin),
                    SizedBox(height: 20),
                    Text(
                      "Settings",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Delete company',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                    SizedBox(height: 20),
                    NavigationButton(
                      buttonText: "Edit company profile",
                      route: '/login',
                    )
                  ],
                ),
              ),
            ),
            _buildBottom(context),
          ],
        ),
      ),
      bottomNavigationBar: GreenhouseBottomNavigationBar(),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Color(0xFFE1E1E1),
          ),
          child: _employeesSection(context),
        ),
      ),
    );
  }

  Widget _employeesSection(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      padding: const EdgeInsets.all(32.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              Text('Employees',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(width: 50),
              Expanded(
                child: NavigationButton(
                    buttonText: "Invite Employees",
                    route: "/login",
                    outline: true),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _companyInfo(String title, String content) {
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
