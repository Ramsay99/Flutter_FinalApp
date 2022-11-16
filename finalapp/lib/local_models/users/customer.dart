import 'package:finalapp/local_models/local_model_barrel.dart';
import 'package:flutter/material.dart';
import 'local_user.dart';

class Customer extends LocalUser {
  @override
  String email;
  @override
  String name;
  @override
  String phoneNum;
  List<Task> historyPurchases = [];
  Customer(this.name, this.email, this.phoneNum);

  @override
  Iterable<Widget> getAvailableScreens() {
    return [];
  }

  @override
  List<BottomNavigationBarItem> getBotNavBarItems() {
    return [];
  }
}
