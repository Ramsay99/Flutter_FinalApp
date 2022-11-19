import 'package:finalapp/screens/manager_screens/dashboard/pie_vis.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static BottomNavigationBarItem bottomNavBarItem =
      const BottomNavigationBarItem(
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
      body: ListView(
        children: [
          PieChartWidget(),
          MapChartWidget(),
        ],
      ),
    );
  }
}
