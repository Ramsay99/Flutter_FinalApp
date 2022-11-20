import 'package:finalapp/local_models/local_model_barrel.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/local_models/users/local_user.dart';
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
  late Organization organization;
  bool fullShift = false;
  static List<Employee> allEmployees = [];

  Employee(
    this.name,
    this.email,
    this.phoneNumber,
    this.organization, {
    bool fullShift = false,
  }) {
    allEmployees.add(this);
  }
  @override
  Iterable<Widget> getAvailableScreens() {
    return [
      //const DeliveriesScreen(),
      const HistoryScreen(),
    ];
  }

  @override
  List<GButton> getBotNavBarItems() {
    return [
      //DeliveriesScreen.bottomNavBarItem,
      //HistoryScreen.bottomNavBarItem,
    ];
  }
}
