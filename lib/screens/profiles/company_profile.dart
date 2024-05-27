import 'package:flutter/material.dart';
import 'package:greenhouse/models/coworker.dart';
import 'package:greenhouse/widgets/avatar.dart';
import 'package:greenhouse/widgets/bottom_navigation_bar.dart';
import 'package:greenhouse/widgets/navigation_button.dart';

class CompanyProfileScreen extends StatefulWidget {
  const CompanyProfileScreen({super.key});

  @override
  State<CompanyProfileScreen> createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  String searchQuery = '';
  var companyName = 'Pero Agro J&V SAC';
  var tin = '8767123131';
  var picture =
      'https://plazavea.vteximg.com.br/arquivos/ids/429454-450-450/20181533.jpg?v=637382855570500000';

  List<Coworker> coworkers = [
    Coworker(
        name: "Alan",
        role: "Supervising technician",
        username: "alan",
        email: "alan@gmail.com",
        image: "https://i.imgur.com/xPyz8mG.png"),
    Coworker(
        name: "Eric",
        role: "Supervising technician",
        username: "eric",
        email: "eric@gmail.com",
        image: "https://i.imgur.com/xPyz8mG.png"),
    Coworker(
        name: "Nicolas",
        role: "Supervising technician",
        username: "nicolas",
        email: "nicolas@gmail.com",
        image: "https://i.imgur.com/xPyz8mG.png"),
    Coworker(
        name: "Carlo",
        role: "Supervising technician",
        username: "carlo",
        email: "carlo@gmail.com",
        image: "https://i.imgur.com/xPyz8mG.png"),
    Coworker(
        name: "Lucero",
        role: "Supervising technician",
        username: "lucero",
        email: "lucero@gmail.com",
        image: "https://i.imgur.com/xPyz8mG.png"),
    Coworker(
        name: "Soto",
        role: "Supervising technician",
        username: "soto",
        email: "soto@gmail.com",
        image: "https://i.imgur.com/xPyz8mG.png"),
    Coworker(
        name: "Dobby",
        role: "Supervising technician",
        username: "dobby",
        email: "dobby@gmail.com",
        image: "https://i.imgur.com/xPyz8mG.png"),
    Coworker(
        name: "Max",
        role: "Supervising technician",
        username: "max",
        email: "max@gmail.com",
        image: "https://i.imgur.com/xPyz8mG.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go back', style: TextStyle(fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xFFE1E1E1),
                ),
                child: _employeesSection(context),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GreenhouseBottomNavigationBar(),
    );
  }

  Widget _employeesSection(BuildContext context) {
    List<Coworker> filteredCoworkers = coworkers
        .where((coworker) =>
            coworker.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Row(
            children: [
              Text('Employees',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(width: 50),
              Expanded(
                child: NavigationButton(
                    buttonText: "Invite Employees",
                    route: "/login",
                    outline: true),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search employees...',
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: filteredCoworkers
                .map((coworker) => CoworkerCard(
                      name: coworker.name,
                      role: coworker.role,
                      image: coworker.image,
                    ))
                .toList(),
          ),
        ],
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

class CoworkerCard extends StatelessWidget {
  final String name;
  final String role;
  final String image;

  const CoworkerCard({
    super.key,
    required this.name,
    required this.role,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.all(7),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              image,
              width: 45,
              height: 45,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                role,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF727272),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
