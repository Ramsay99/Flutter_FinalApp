import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/utility/authentication/auth_service.dart';

class TaskService {
  savaTaskData(
    String name,
    String address,
    String note,
    String phone,
    String employeeID,
    String productID,
    List<Timestamp> date,
    String city,
    String area,
  ) async {
    FirebaseFirestore.instance
        .collection(localUser.organization.name)
        .doc('data')
        .collection('tasks')
        .add(
      {
        "name": name,
        "address": address,
        "note": note,
        "phone": phone,
        "employeeID": employeeID,
        "productID": productID,
        "date": date,
        "city": city,
        "area": area,
      },
    );
  }
}
