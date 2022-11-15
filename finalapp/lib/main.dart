import 'package:finalapp/local_models/local_model_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';
//import 'package:finalapp/local_models/local_model_barrel.dart';

// Change this condition between [true|false] to change localCurrentUser type.
// User localCurrentUser = true
//     ? Manager("SteveJobless", "@Boss.com", 079)
//     : Driver("Tom", "Tom.com", 078);

Future<void> main() async {
  String? id = Uri.base.queryParameters["id"];
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  User localUser = getLocalUser(
      1); // Here it should look something like this: snapshot.data['role']

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
      onGenerateRoute: RouteGenerator.generateRoute,
      home: defaultTargetPlatform == TargetPlatform.android || id == null
          ? AuthService().handleAuthState()
          : WebInfoScreen(
              id: id,
            ),
    );
  }
}

User getLocalUser(int role) {
  if (role == 1) {
    return Manager(
      "name", // Here it should look something like this: snapshot.data['name']
      "email",
      1234,
      Organization(
        "_name",
        Location(1, 2),
      ),
    );
  } else {
    return Employee(
      "name",
      "email",
      1234,
      Organization(
        "_name",
        Location(1, 2),
      ),
    );
  }
}
