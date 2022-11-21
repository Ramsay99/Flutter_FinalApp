import 'package:finalapp/local_models/local_model_barrel.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

abstract class LocalUser {
  abstract String name;
  abstract String email;
  abstract String phoneNumber;
  abstract Organization organization;
  List<GButton> getBotNavBarItems();
  Iterable<Widget> getAvailableScreens();
}
