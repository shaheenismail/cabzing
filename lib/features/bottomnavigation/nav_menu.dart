import 'package:cabzing/features/dashboard/dashboard.dart';
import 'package:cabzing/features/filterpage/filter_screen.dart';
import 'package:cabzing/features/profile/profile_screen.dart';
import 'package:cabzing/features/salelist/sale.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  static List<Widget> _screens = <Widget>[
    Dashboard(),
    SaleScreen(),
    FilterScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.black,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.send), label: 'Sale'),
          NavigationDestination(icon: Icon(Icons.filter_1), label: 'Filter'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
