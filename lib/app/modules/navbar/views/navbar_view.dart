
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spaceparking/app/modules/home/views/home_view.dart';

import '../../camera/views/camera_view.dart';
import '../../profile/views/profile_view.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  List Screens = [
    HomeScreen(),
    CameraScreen(),
    UserScreen(),
  ];
  int _selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        index:  _selectedIndex,
        color: Color.fromARGB(255, 61, 25, 1),
        backgroundColor: Color.fromARGB(0, 255, 0, 0),
        buttonBackgroundColor: Colors.redAccent,
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.camera,
            size: 30,
            color: Colors.white
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white
          ),
        ],
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Screens[_selectedIndex],
    );
  }
}