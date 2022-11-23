import 'package:finalapp/local_models/organization.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/local_models/users/local_user.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Manager extends LocalUser {
  @override
  String email;
  @override
  String name;
  @override
  String phoneNumber;
  @override
  List cities;
  @override
  late Organization organization;
  Manager(
    this.name,
    this.email,
    this.phoneNumber,
    this.cities,
    this.organization,
  );

  @override
  Iterable<Widget> getAvailableScreens() {
    return [
      const TaskScreen(),
      const EmployeesScreen(),
      const DashboardScreen(),
    ];
  }

  @override
  List<GButton> getBotNavBarItems() {
    return [
      TaskScreen.bottomNavBarItem,
      EmployeesScreen.bottomNavBarItem,
      DashboardScreen.bottomNavBarItem,
    ];
  }
}
