import 'package:flutter/material.dart';

abstract class User {
  abstract String name;
  abstract String email;
  abstract int phoneNum;
  List<BottomNavigationBarItem> getBotNavBarItems();
  Iterable<Widget> getAvailableScreens();
}
