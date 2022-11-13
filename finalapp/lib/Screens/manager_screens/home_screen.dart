import 'package:finalapp/utility/utility_barrel.dart';
import 'package:flutter/material.dart';

class ManagerHomeScreen extends StatefulWidget {
  const ManagerHomeScreen({super.key});

  @override
  State<ManagerHomeScreen> createState() => _ManagerHomeScreenState();
}

List<Widget> _content = [];
int _selectedIndex = 0;
List<BottomNavigationBarItem> _items = [];

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manager",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              AuthService().signOutUser();
            },
            child: const Text(
              "Sign-out",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: IndexedStack(
            index: _selectedIndex,
            children: _content, //_content.elementAt(_index),
          ),
        ),
      ),
    );
  }
}