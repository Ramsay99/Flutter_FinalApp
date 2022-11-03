import 'package:flutter/material.dart';

abstract class User {
  List<BottomNavigationBarItem> getBotNavBarItems();
  Iterable<Widget> getAvailableScreens();
}
