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
      case '/resetPassword':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case '/taskInfo':
        List<dynamic> args = settings.arguments as List<dynamic>;
        return MaterialPageRoute(
          builder: (_) => TaskInfoScreen(
            address: args[0],
            city: args[1],
            product: args[2],
            date: args[3],
            name: "test",
            note:
                "Sunt in voluptate iste qui id sed non quisquam nam. Occaecati molestiae perferendis ut. Sed autem vero quas aut quis ut modi voluptate autem. Eum facere repellat ex voluptas temporibus consectetur eligendi minima. Et vero sunt est praesentium ut officiis. Illo nihil accusantium repudiandae voluptatibus ea dolores.",
            driverName: "test",
            phone: "test",
            location: const ["0.000000", "0.000000"],
          ),
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
