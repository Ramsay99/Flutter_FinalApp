
import 'package:finalapp/Screens/screens_barrel.dart';
import 'Local_Models/manager.dart';
import 'Local_Models/user.dart';

void main() {
  User u = Manager();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
