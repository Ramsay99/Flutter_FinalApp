import 'package:finalapp/Local_Models/local_model_barrel.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import 'package:flutter/foundation.dart';

// To change this condition [true|false] to change localCurrentUser
late User localCurrentUser = true ? Manager() : Driver();
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// }
void main(List<String> args) {
  String? id = Uri.base.queryParameters["id"];

  runApp(
    MyApp(
      id: id,
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? id;
  const MyApp({this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: defaultTargetPlatform == TargetPlatform.android
          ? const LoginScreen()
          : SplashScreen(
              id: id,
            ),
    );
  }
}
