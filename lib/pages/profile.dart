import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constant/constant.dart';
import 'home.dart';
import 'note.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 2;
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool isSettingExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 233),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 23, 103, 26),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  const Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/profile.jpeg'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Stay motivated!',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Today is $formattedDate',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 246, 246, 233),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                    Icons.history,
                    color: Colors.black,
                  ),
                  title: Text(
                    'History',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 2,
                  color: Color.fromARGB(255, 246, 246, 233),
                ),
                const SizedBox(
                  height: 1.0,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 23, 103, 26),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Settings',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isSettingExpanded = !isSettingExpanded;
                    });
                  },
                  trailing: Icon(
                    isSettingExpanded
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 1.0,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 23, 103, 26),
                    ),
                  ),
                ),
                if (isSettingExpanded)
                  Container(
                    color: const Color.fromARGB(255, 246, 246, 233),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Edit Profile',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text(
                            'Edit Motivation',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text(
                            'Account',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                const Divider(
                  height: 2,
                  color: Color.fromARGB(255, 246, 246, 233),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  title: Text(
                    'About',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 2,
                  color: Color.fromARGB(255, 246, 246, 233),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Logout',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        HOME_SCREEN, (Route<dynamic> route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotePage()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          });
        },
      ),
    );
  }
}
