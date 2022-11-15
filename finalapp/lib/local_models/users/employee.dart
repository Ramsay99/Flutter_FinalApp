import 'package:finalapp/local_models/local_model_barrel.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/local_models/users/user.dart';
import 'package:finalapp/screens/screens_barrel.dart';

class Employee extends User {
  @override
  String email;

  @override
  String name;

  @override
  int phoneNum;

  Organization organization;
  bool fullShift = false;
  static List<Employee> allEmployees = [];

  Employee(
    this.name,
    this.email,
    this.phoneNum,
    this.organization, {
    bool fullshift = false,
  }) {
    print("New Employee!");
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
  List<BottomNavigationBarItem> getBotNavBarItems() {
    return [
      //DeliveriesScreen.bottomNavBarItem,
      HistoryScreen.bottomNavBarItem,
    ];
  }
}
