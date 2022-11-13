import 'package:finalapp/local_models/users/user.dart';
import '../../Screens/screens_barrel.dart';

class Manager extends User {
  @override
  String email;

  @override
  String name;

  @override
  int phoneNum;

  Manager(this.name, this.email, this.phoneNum) {
    print("New Manager!");
  }

  @override
  Iterable<Widget> getAvailableScreens() {
    return [
      const DeliveriesScreen(),
      const EmployeesScreen(),
      const DashboardScreen(),
      const HistoryScreen(),
    ];
  }

  @override
  List<BottomNavigationBarItem> getBotNavBarItems() {
    return [
      DeliveriesScreen.bottomNavBarItem,
      EmployeesScreen.bottomNavBarItem,
      DashboardScreen.bottomNavBarItem,
      HistoryScreen.bottomNavBarItem,
    ];
  }
}
