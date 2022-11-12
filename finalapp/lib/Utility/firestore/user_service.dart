import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/utility/authentication/auth_service.dart';

/// Creating a reference to the collection called users.
final CollectionReference users =
    FirebaseFirestore.instance.collection('users');

class UserService {
  getUserData() async {
    DocumentSnapshot<Object?> userDocument =
        await users.doc(auth.currentUser!.uid).get();
    return userDocument.data() as Map;
  }
}