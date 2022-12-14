// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB9TeWGzt0RUnuWqCygsmRiBpNz_HwFXug',
    appId: '1:20102372704:web:21faa12aac29cf75cf5205',
    messagingSenderId: '20102372704',
    projectId: 'delivery-tracker-finalapp',
    authDomain: 'delivery-tracker-finalapp.firebaseapp.com',
    storageBucket: 'delivery-tracker-finalapp.appspot.com',
    measurementId: 'G-J1LP03425T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAcLl7KnkHWFWJhsGHTxTiDlBa0gFyFgg',
    appId: '1:20102372704:android:6e7fdd465f7c731dcf5205',
    messagingSenderId: '20102372704',
    projectId: 'delivery-tracker-finalapp',
    storageBucket: 'delivery-tracker-finalapp.appspot.com',
  );
}
