import 'package:finalapp/screens/manager_screens/dashboard/pie_vis.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static GButton bottomNavBarItem = const GButton(
    icon: FontAwesomeIcons.chartColumn,
  );

  @override
  State<DashboardScreen> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          PieChartWidget(),
          MapChartWidget(),
        ],
      ),
    );
  }
}
