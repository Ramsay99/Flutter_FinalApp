import 'package:finalapp/utility/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import '../../local_models/local_model_barrel.dart';
import '../../widgets/widgets_barrel.dart';
import '../../main.dart';

class EmployHomeScreen extends StatefulWidget {
  const EmployHomeScreen({super.key});

  @override
  State<EmployHomeScreen> createState() => _EmployHomeScreenState();
}

List<Widget> _content = [];
int _selectedIndex = 0;
List<BottomNavigationBarItem> _items = [];

class _EmployHomeScreenState extends State<EmployHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Employ",
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
