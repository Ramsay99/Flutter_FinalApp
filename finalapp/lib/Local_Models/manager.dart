import 'package:flutter/material.dart';
import 'package:finalapp/local_models/user.dart';
import '../screens/screens_barrel.dart';

class Manager extends User {
  Manager() {
    print("New Manager!");
  }

  @override
  Iterable<Widget> getAvailableScreens() {
    return [
      //const DeliveriesScreen(),
      const EmployeesScreen(),
      const DashboardScreen(),
      const HistoryScreen(),
    ];
  }

  @override
  List<BottomNavigationBarItem> getBotNavBarItems() {
    return [
      //DeliveriesScreen.bottomNavBarItem,
      EmployeesScreen.bottomNavBarItem,
      DashboardScreen.bottomNavBarItem,
      HistoryScreen.bottomNavBarItem,
    ];
  }
}
