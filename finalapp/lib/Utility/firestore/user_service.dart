import 'package:cloud_firestore/cloud_firestore.dart';

/// Creating a reference to the collection called users.
final CollectionReference users =
    FirebaseFirestore.instance.collection('users');