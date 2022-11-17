import 'package:flutter/material.dart';
import 'package:finalapp/local_models/users/local_user.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import '../organization.dart';

class Manager extends LocalUser {
  @override
  String email;
  @override
  String name;
  @override
  String phoneNumber;
  @override
  late Organization organization;
  Manager(
    this.name,
    this.email,
    this.phoneNumber,
    this.organization,
  );

  @override
  Iterable<Widget> getAvailableScreens() {
    return [
      const DashboardScreen(),
      const EmployeesScreen(),
      const TaskScreen(),
    ];
  }

  @override
  List<BottomNavigationBarItem> getBotNavBarItems() {
    return [
      DashboardScreen.bottomNavBarItem,
      EmployeesScreen.bottomNavBarItem,
      TaskScreen.bottomNavBarItem,
    ];
  }
}
