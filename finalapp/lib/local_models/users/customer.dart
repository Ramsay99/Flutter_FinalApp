import 'package:flutter/material.dart';
import 'package:finalapp/local_models/users/user.dart';

class Customer extends User {
  @override
  String email;

  @override
  String name;

  @override
  int phoneNum;

  Customer(this.name, this.email, this.phoneNum) {
    print("New Customer!");
  }

  @override
  Iterable<Widget> getAvailableScreens() {
    return [];
  }

  @override
  List<BottomNavigationBarItem> getBotNavBarItems() {
    return [];
  }
}
