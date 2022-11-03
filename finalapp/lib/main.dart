
import 'package:finalapp/Local_Models/driver.dart';
import 'package:finalapp/Local_Models/local_model_barrel.dart';
import 'package:finalapp/Screens/screens_barrel.dart';

User localCurrentUser = Manager();
// User localCurrentUser = Driver();
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
