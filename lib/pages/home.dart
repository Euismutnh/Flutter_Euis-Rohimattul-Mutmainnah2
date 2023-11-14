import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_mate/pages/note.dart';
import 'package:money_mate/pages/profile.dart';
import 'package:logger/logger.dart';

import '../Menu/expense.dart';
import '../Menu/debt.dart';
import '../Menu/income.dart';
import '../Menu/planning.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logger = Logger();
  final List<String> imageSlider = [
    '1.png',
    '2.png',
    '3.png',
    '4.png',
  ];

  final List<String> imageList = [
    'Income',
    'Expense',
    'Debt',
    'Planning',
  ];

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        accent: const Color.fromARGB(255, 23, 103, 26),
        backButton: false,
        onDateChanged: (value) => logger.d("Nilai yang dipilih: $value"),
        firstDate: DateTime.now().subtract(const Duration(days: 356)),
        lastDate: DateTime.now(),
      ),
      backgroundColor: const Color(0xFFF6F6E9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                initialPage: 0,
              ),
              items: imageSlider.map((fileImage) {
                return Container(
                  margin: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/$fileImage',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.download,
                        color: Color.fromARGB(255, 23, 103, 26),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Income",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 12)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Rp. 10.300.000",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 14))
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.upload,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Expense",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 12)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Rp. 2.300.000",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 14))
                      ],
                    )
                  ],
                ),
              ],
            ),
            GridView.builder(
              itemCount: imageList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DebtPage()),
                      );
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlanningPage()),
                      );
                    } else if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IncomePage()),
                      );
                    } else if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OutcomePage()),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFF5F3FF),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/${imageList[index]}.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          imageList[index],
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.5)),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF6F6E9),
        ),
        child: BottomNavigationBar(
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
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              }
            });
          },
        ),
      ),
    );
  }
}
