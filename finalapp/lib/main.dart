// ignore_for_file: prefer_const_constructors

import 'package:finalapp/local_models/local_model_barrel.dart';
import 'package:finalapp/Screens/manager_screens/dashboard/line_chart/line_chart_vis.dart';
import 'package:finalapp/Screens/manager_screens/dashboard/map_vis.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import 'package:flutter/foundation.dart';

import 'Screens/manager_screens/dashboard/pie_vis.dart';

// To change this condition [true|false] to change localCurrentUser
late User localCurrentUser = true ? Manager("SteveJobless","@Boss.com",079) : Driver("Tom","Tom.com",078);
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
      // home: defaultTargetPlatform == TargetPlatform.android
      //     ? const LoginScreen()
      //     : SplashScreen(id: id),
      home: Home(),
    );
  }
}
