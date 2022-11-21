import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/utility/authentication/auth_service.dart';
import 'package:flutter/material.dart';

class OrganizationService {
  Future getOrgData() async {
    DocumentSnapshot<Object?> orgDocument = await FirebaseFirestore.instance
        .collection(localUser.organization.name)
        .doc('data')
        .get();
    return orgDocument.data() as Map;
  }

  Stream taskStream() {
    Stream<QuerySnapshot<Object?>> taskSnapshot = FirebaseFirestore.instance
        .collection(localUser.organization.name)
        .doc('data')
        .collection('tasks')
        .snapshots();
    return taskSnapshot;
  }

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
