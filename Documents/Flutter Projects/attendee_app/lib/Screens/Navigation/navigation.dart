import 'package:attendee_app/Screens/Calendar/calendar.dart';
import 'package:attendee_app/Screens/Dashboard/dashboard.dart';
import 'package:attendee_app/Screens/Profile/profile.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const DashboardScreen(),
    const CalendarScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
       selectedItemColor: blackText,
         unselectedItemColor:blackText,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: whiteText,
            icon: Icon(
              Icons.home,
              color: blackText,
            ),
            label: AttendeeTexts.home,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ImagesPath.calendar),
            label: AttendeeTexts.calendar,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: blackText,),
            label: AttendeeTexts.profile,
            backgroundColor: walledGarden
          ),
        ],
      ),
    );
  }
}
