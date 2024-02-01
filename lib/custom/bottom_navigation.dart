import 'package:flutter/material.dart';
import 'package:hydroinformatics_data_management_system/pages/profile_page.dart';
import 'package:hydroinformatics_data_management_system/pages/search_page.dart';

import '../pages/services_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  static const String bottomNavigationPage = 'bottomNavigationPage';

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int selectedIndex = 0;

  List<Widget> pages = [ServicesPage(), SearchPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/home.png'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/search.png'),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/user.png'),
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
