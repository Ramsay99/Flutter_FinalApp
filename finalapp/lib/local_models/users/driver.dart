import 'package:finalapp/local_models/users/user.dart';
import '../../Screens/screens_barrel.dart';

class Driver extends User {
  @override
  String email;

  @override
  String name;

  @override
  int phoneNum;

  Driver(this.name, this.email, this.phoneNum) {
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
