// ignore_for_file: prefer_const_constructors

import 'package:finalapp/Local_Models/user.dart';
import '../Screens/screens_barrel.dart';

class Manager extends User {
  Manager() {
    print("New Manager!");
  }

  @override
  Iterable<Widget> getAvailableScreens() {
    return [
      const DeliveriesScreen(),
      const EmployeesScreen(),
      const DashboardScreen(),
      const HistoryScreen(),
    ];
  }

  @override
  List<BottomNavigationBarItem> getBotNavBarItems() {
    return [
      DeliveriesScreen.bottomNavBarItem,
      EmployeesScreen.bottomNavBarItem,
      DashboardScreen.bottomNavBarItem,
      HistoryScreen.bottomNavBarItem,
    ];
  }
}
