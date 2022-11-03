import 'package:finalapp/Local_Models/user.dart';
import 'package:finalapp/Screens/screens_barrel.dart';

class Driver extends User {
  Driver() {
    print("New Driver!");
  }
  @override
  Iterable<Widget> getAvailableScreens() {
    return [
      const DeliveriesScreen(),
      const HistoryScreen(),
    ];
  }

  @override
  List<BottomNavigationBarItem> getBotNavBarItems() {
    return [
      DeliveriesScreen.bottomNavBarItem,
      HistoryScreen.bottomNavBarItem,
    ];
  }
}
