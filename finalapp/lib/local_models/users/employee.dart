import 'package:finalapp/screens/employ_screens/active_tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/local_models/local_model_barrel.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Employee extends LocalUser {
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
  // bool fullShift = false;
  // static List<Employee> allEmployees = [];
  Employee(
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
      const ActiveTaskScreen(),
    ];
  }

  @override
  List<GButton> getBotNavBarItems() {
    return [
      TaskScreen.bottomNavBarItem,
      ActiveTaskScreen.bottomNavBarItem,
    ];
  }
}
