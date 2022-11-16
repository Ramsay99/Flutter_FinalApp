import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static BottomNavigationBarItem bottomNavBarItem = BottomNavigationBarItem(
    icon: Icon(Icons.insights),
    label: 'Dashboard',
  );

  @override
  State<DashboardScreen> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Index 2: Dashboard',
      ),
    );
  }
}
