import 'package:flutter/material.dart';
import 'package:finalapp/local_models/user.dart';
import 'package:finalapp/screens/screens_barrel.dart';

class Driver extends User {
  Driver() {
    print("New Driver!");
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
