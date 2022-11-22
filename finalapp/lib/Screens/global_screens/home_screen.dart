import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _selectedIndex = 0;
List<Widget> _content = [];
List<GButton> _items = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _content.addAll(localUser.getAvailableScreens());
    _items.addAll(localUser.getBotNavBarItems());
    super.initState();
  }

  @override
  void dispose() {
    _content.clear();
    _items.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const AppBarWidget(),
      bottomNavigationBar: _showBottomNav(),
      drawerScrimColor: oxford_blue_tint_3.withAlpha(150),
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
    return Container(
      height: 135,
      color: oxford_blue_tint_2,
      child: Column(
        children: [
          const BottomToggleButtons(),
          GNav(
            tabs: [..._items],
            onTabChange: _onTap,
            selectedIndex: _selectedIndex,
            backgroundColor: oxford_blue_tint_2,
            color: light_blue_tint_1,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.fromLTRB(38, 25, 38, 10),
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
