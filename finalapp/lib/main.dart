import 'package:finalapp/Local_Models/manager.dart';
import 'package:finalapp/Screens/delivery_map_screen.dart';
import 'package:finalapp/Screens/home_screen.dart';

import 'package:flutter/material.dart';

import 'Local_Models/user.dart';

void main() {
  User u = Manager();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DeliveryMap();
  }
}
