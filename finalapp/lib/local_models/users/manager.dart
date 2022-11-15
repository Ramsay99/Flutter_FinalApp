import 'package:flutter/material.dart';
import 'package:finalapp/local_models/users/user.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import '../organization.dart';

class Manager extends User {
  @override
  String email;

  @override
  String name;

  @override
  int phoneNum;

  late Organization organization;

  Manager(this.name, this.email, this.phoneNum, this.organization) {
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
