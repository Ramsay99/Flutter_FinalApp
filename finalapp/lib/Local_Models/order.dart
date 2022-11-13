import 'package:finalapp/Screens/customer_screens/customer_feedback_screen.dart';
import 'package:finalapp/local_models/local_model_barrel.dart';

class Order {
  Map<String, Product> cart = {};
  late final Driver driver;
  late final Customer customer;
  String deliveryToAdress = "deliveryToAdress";
  Location deliveryFrom = Location.notDefined();
  Location deliveryTo = Location.notDefined();
  late DateTime purchaseDate;
  late DateTime warrantyDate;
  String? note;
  CustomerFeedback? customerFeedback;

  Order({
    required this.cart,
    required this.driver,
    required this.customer,
    required this.deliveryToAdress,
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
