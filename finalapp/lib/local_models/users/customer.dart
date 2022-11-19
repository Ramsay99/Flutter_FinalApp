import 'package:finalapp/local_models/local_model_barrel.dart';

class Customer {
  String email;
  String name;
  String phoneNumber;
  List<Task> historyPurchases = [];
  Customer(
    this.name,
    this.email,
    this.phoneNumber,
  );
}
