import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';

// Change this condition between [true|false] to change localCurrentUser type.
// User localCurrentUser = true
//     ? Manager("SteveJobless", "@Boss.com", 079)
//     : Driver("Tom", "Tom.com", 078);

Future<void> main() async {
  String? id = Uri.base.queryParameters["id"];
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en_US', supportedLocales: ['en_US', 'ar']);
  runApp(LocalizedApp(delegate, MyApp(id: id)));
}

class MyApp extends StatelessWidget {
  final String? id;
  const MyApp({this.id, super.key});
  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        theme: ThemeData(fontFamily: 'Inter'),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        home: defaultTargetPlatform == TargetPlatform.android || id == null
            ? AuthService().handleAuthState()
            : WebInfoScreen(id: id),
      ),
    );
  }
}
