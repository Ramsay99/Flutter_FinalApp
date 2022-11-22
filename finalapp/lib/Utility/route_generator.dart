import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/screens/screens_barrel.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/taskForm':
        return MaterialPageRoute(builder: (_) => const TaskFormScreen());
      case '/qr':
        return MaterialPageRoute(builder: (_) => const QrScannerScreen());
      case '/employeeForm':
        return MaterialPageRoute(builder: (_) => const EmployeeFormScreen());
      case '/mapPicker':
        return MaterialPageRoute(builder: (_) => const SelectLocationScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case '/resetPassword':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case '/taskInfo':
        DocumentSnapshot args = settings.arguments as DocumentSnapshot;
        return MaterialPageRoute(
          builder: (_) => TaskInfoScreen(document: args),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Error"),
          ),
          body: const Center(
            child: Text("Error"),
          ),
        );
      },
    );
  }
}
