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

  savaTaskData(
    String name,
    String address,
    String note,
    String phone,
    String productID,
    String date,
    String city,
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
        "location": location
      },
    );
  }
}
