import 'package:finalapp/utility/utility_barrel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Widget> _content = [];
int _selectedIndex = 0;
List<BottomNavigationBarItem> _items = [];

class _HomeScreenState extends State<HomeScreen> {
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