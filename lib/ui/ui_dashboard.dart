import 'package:flutter/material.dart';
import 'package:rmrcloud/ui/fragment_dashboard.dart';
import 'package:rmrcloud/ui/fragment_history.dart';
import 'package:rmrcloud/ui/fragment_profile.dart';
import 'package:rmrcloud/ui/fragment_settings.dart';

class DashboardUI extends StatefulWidget {
  @override
  _DashboardUIState createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI> {
  List<Widget> _fragments = [
    DashboardFragment(),
    HistoryFragment(),
    ProfileFragment(),
    SettingsFragment(),
  ];

  List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("Dashboard"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      title: Text("History"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text("Profile"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.tune),
      title: Text("Settings"),
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: (){},
          child: _fragments[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (_index) {
          setState(() {
            _selectedIndex = _index;
          });
        },
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.green.shade300,
        backgroundColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        items: _navItems,
      ),
    );
  }
}
