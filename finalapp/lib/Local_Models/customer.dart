import 'package:finalapp/Local_Models/user.dart';
import '../screens/screens_barrel.dart';

class Customer extends User {
  late final String _name;
  late int _phoneNum;

  Customer({
    required String name,
    required int phoneNum,
  }) {
    _name = name;
    _phoneNum = phoneNum;
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
