import 'package:flutter/material.dart';
import 'package:finalapp/screens/screens_barrel.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/taskForm':
        return MaterialPageRoute(builder: (_) => const TaskFormScreen());
      case '/qr':
        return MaterialPageRoute(builder: (_) => const QrScannerScreen());
      case '/employeeForm':
        return MaterialPageRoute(builder: (_) => const EmployeeFormScreen());
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