import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
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
      case '/contactUs':
        return MaterialPageRoute(builder: (_) => ContactUs());
      case '/resetPassword':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case '/importFile':
        return MaterialPageRoute(builder: (_) => const ImportScreen());
      case '/reportBug':
        return MaterialPageRoute(builder: (_) => const ReportBug());
      case '/objectImage':
        return MaterialPageRoute(builder: (_) => const ObjDetectionWithImg());
      case '/taskInfo':
        DocumentSnapshot args = settings.arguments as DocumentSnapshot;
        return MaterialPageRoute(
          builder: (_) => TaskInfoScreen(document: args),
        );
      case '/employeeInfo':
        DocumentSnapshot args = settings.arguments as DocumentSnapshot;
        return MaterialPageRoute(
          builder: (_) => EmployeeInfoScreen(document: args),
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
            elevation: 0,
            backgroundColor: red_tint_1,
          ),
          body: const Center(
            child: ErrorRobot(),
          ),
        );
      },
    );
  }
}
