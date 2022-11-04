import 'package:finalapp/Local_Models/local_model_barrel.dart';
import 'package:finalapp/Screens/chat_screen.dart';
import 'package:finalapp/Screens/screens_barrel.dart';

// To change this condition [true|false] to change localCurrentUser
late User localCurrentUser = false ? Manager() : Driver();
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
    return const ChatScreen();
  }
}
