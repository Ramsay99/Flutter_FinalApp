import 'package:finalapp/Local_Models/user.dart';
import '../screens/screens_barrel.dart';

class Customer extends User {
  Customer() {
    print("New Customer!");
  }
  @override
  Iterable<Widget> getAvailableScreens() {
    return [];
  }

  @override
  List<BottomNavigationBarItem> getBotNavBarItems() {
    return [];
  }
}
