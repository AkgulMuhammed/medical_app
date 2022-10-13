import 'package:flutter/material.dart';
import 'package:flutter_medical_app/views/navpages/appointment_page.dart';
import 'package:flutter_medical_app/views/navpages/community_page.dart';
import 'package:flutter_medical_app/views/navpages/home_page.dart';
import 'package:flutter_medical_app/views/navpages/message_page.dart';
import 'package:flutter_medical_app/views/navpages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const AppointmentPage(),
    const MessagePage(),
    const CommunityPage(),
    const ProfilePage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: pages[currentIndex]
        ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: onTap,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.date_range), label: 'Appointment'),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail), label: 'Messages'),
            BottomNavigationBarItem(
                icon: Icon(Icons.groups_rounded), label: 'Community'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ]),
      backgroundColor: Colors.white,
    );
  }
}
