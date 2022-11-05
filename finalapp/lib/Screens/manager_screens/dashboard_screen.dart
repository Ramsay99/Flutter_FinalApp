// ignore_for_file: prefer_const_constructors

import 'package:finalapp/screens/screens_barrel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static BottomNavigationBarItem bottomNavBarItem = BottomNavigationBarItem(
    icon: Icon(Icons.dashboard),
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
