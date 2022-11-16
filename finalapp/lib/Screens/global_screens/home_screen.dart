import 'package:flutter/material.dart';
import 'package:finalapp/utility/utility_barrel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _selectedIndex = 0;
List<Widget> _content = [];
List<BottomNavigationBarItem> _items = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _content.addAll(localUser.getAvailableScreens());
    _items.addAll(localUser.getBotNavBarItems());
    print("Current user role: ${localUser.runtimeType}");
    print(localUser.getBotNavBarItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _showBottomNav(),
      appBar: AppBar(
        title: const Text(
          "Home",
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

  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: _items,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
