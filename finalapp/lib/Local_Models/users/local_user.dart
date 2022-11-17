import 'package:finalapp/local_models/local_model_barrel.dart';
import 'package:flutter/material.dart';

abstract class LocalUser {
  abstract String name;
  abstract String email;
  abstract String phoneNumber;
  abstract Organization organization;
  List<BottomNavigationBarItem> getBotNavBarItems();
  Iterable<Widget> getAvailableScreens();
}
