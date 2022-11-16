import 'package:flutter/material.dart';

abstract class LocalUser {
  abstract String name;
  abstract String email;
  abstract String phoneNum;
  List<BottomNavigationBarItem> getBotNavBarItems();
  Iterable<Widget> getAvailableScreens();
}
