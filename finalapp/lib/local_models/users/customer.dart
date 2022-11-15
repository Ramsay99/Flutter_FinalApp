import 'package:finalapp/local_models/local_model_barrel.dart';
import 'package:flutter/material.dart';
import 'user.dart';

class Customer extends User {
  @override
  String email;

  @override
  String name;

  @override
  int phoneNum;

  List<Task> historyPurchases = [];

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
