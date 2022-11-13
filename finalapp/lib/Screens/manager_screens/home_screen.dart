// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:finalapp/local_models/local_model_barrel.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import '../../widgets/widgets_barrel.dart';
import '../../main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Widget> _content = [];

int _selectedIndex = 0;

List<BottomNavigationBarItem> _items = [];

class _HomeState extends State<Home> {
  @override
  void initState() {
    if (localCurrentUser.runtimeType == Manager) {
    } else if (localCurrentUser.runtimeType == Driver) {
    } else if (localCurrentUser.runtimeType == Customer) {
    } else {
      print("currentUser: Hacker!");
      // Sys.ShutDown.now(force: true);
    }
    print("currentUser: ${localCurrentUser.runtimeType}");
    _content.addAll(localCurrentUser.getAvailableScreens());
    _items.addAll(localCurrentUser.getBotNavBarItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DefaultDrawer()),
      bottomNavigationBar: _showBottomNav(),
      appBar: AppBar(),
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
