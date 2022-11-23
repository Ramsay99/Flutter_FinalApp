import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/utility/authentication/auth_service.dart';

final taskCollection = FirebaseFirestore.instance
    .collection(localUser.organization.name)
    .doc('data')
    .collection('tasks');

class OrganizationService {
  Future getOrgData() async {
    DocumentSnapshot<Object?> orgDocument = await FirebaseFirestore.instance
        .collection(localUser.organization.name)
        .doc('data')
        .get();
    return orgDocument.data() as Map;
  }

  Stream getOrgProducts() {
    Stream<QuerySnapshot<Object?>> orgProducts = FirebaseFirestore.instance
        .collection(localUser.organization.name)
        .doc('data')
        .collection('products')
        .snapshots();
    return orgProducts;
  }

  Stream taskStream() {
    Stream<QuerySnapshot<Object?>> taskSnapshot = taskCollection.snapshots();
    return taskSnapshot;
  }

  Future getTaskData(String taskID, orgID) async {
    DocumentSnapshot<Object?> taskDocument = await FirebaseFirestore.instance
        .collection(orgID)
        .doc('data')
        .collection('tasks')
        .doc(taskID)
        .get();
    if (taskDocument.data() != null) return taskDocument.data() as Map;
  }

  savaTaskData(
    String name,
    String address,
    String note,
    String phone,
    String productID,
    String date,
    String city,
    Map employee,
    int status,
    List<double> location,
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
        "productID": productID,
        "date": date,
        "area": city,
        "location": location,
        "status": status,
        "employee": employee,
      },
    );
  }

  updateTaskData(
    Map employee,
    int status,
    String taskID,
  ) async {
    FirebaseFirestore.instance
        .collection(localUser.organization.name)
        .doc('data')
        .collection('tasks')
        .doc(taskID)
        .update(
      {
        "status": status,
        "employee": employee,
      },
    );
  }
}
