import 'package:finalapp/Screens/customer_screens/customer_feedback_screen.dart';
import 'package:finalapp/local_models/local_model_barrel.dart';

class Task {
  Map<String, Product> cart = {};
  late final Employee driver;
  late final Customer customer;
  String deliveryToAddress = "deliveryToAddress";
  Location deliveryFrom = Location.notDefined();
  Location deliveryTo = Location.notDefined();
  late DateTime purchaseDate;
  late DateTime warrantyDate;
  String? note;
  CustomerFeedback? customerFeedback;

  Task({
    required this.cart,
    required this.driver,
    required this.customer,
    required this.deliveryToAddress,
    required this.deliveryFrom,
    required this.deliveryTo,
    required this.purchaseDate,
    required this.warrantyDate,
    String note = "Have a nice day!",
  });

  void setCustomerFeedBack(CustomerFeedback customerFeedback) {
    this.customerFeedback = customerFeedback;
  }
}
