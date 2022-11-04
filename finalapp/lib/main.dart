import 'package:finalapp/Local_Models/local_model_barrel.dart';
import 'package:finalapp/Screens/screens_barrel.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

// To change this condition [true|false] to change localCurrentUser
late User localCurrentUser = true ? Manager() : Driver();
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// }
void main(List<String> args) {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateDriverScreen();
  }
}
