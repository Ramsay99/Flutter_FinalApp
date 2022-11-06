import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finalapp/screens/screens_barrel.dart';

/// Creating a reference to the FirebaseAuth instance.
final auth = FirebaseAuth.instance;
final authUser = auth.currentUser;

class AuthService {
  /// If the user's email is not found in the database, then the user is new.
  ///
  /// Returns:
  ///   A Future<bool>
  // Future<bool> isNewUser(User user) async {
  //   QuerySnapshot result =
  //       await users.where("email", isEqualTo: user.email).get();
  //   final List<DocumentSnapshot> docs = result.docs;
  //   return docs.isEmpty ? true : false;
  // }

  /// If the user is new, create a new document in the users collection with the user's uid as the
  /// document id
  ///
  /// Args:
  ///   user (User): The user object that is returned from Firebase Auth.
  ///   displayName: The name of the user.
  ///
  /// Returns:
  ///   The document reference of the user.
  // updateUserData(User user, [displayName]) async {
  //   if (await isNewUser(user)) {
  //     DocumentReference document = users.doc(user.uid);
  //     return document.set(
  //       {
  //         "uid": user.uid,
  //         "email": user.email,
  //         "displayName": user.displayName ?? displayName,
  //         "role": 0
  //       },
  //     );
  //   }
  // }

  /// signs out the user
  signOut() {
    auth.signOut();
  }

  /// If the user is logged in, show the HomeScreen, otherwise show the LoginScreen
  // handleAuthState() {
  //   return StreamBuilder(
  //     stream: auth.authStateChanges(),
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       if (snapshot.connectionState != ConnectionState.active) {
  //         return const Center(child: CircularProgressIndicator());
  //       }
  //       final user = snapshot.data;
  //       return snapshot.connectionState != ConnectionState.active
  //           ? const Center(
  //               child: CircularProgressIndicator(),
  //             )
  //           : user != null
  //               ? const HomeScreen()
  //               : const LoginScreen();
  //     },
  //   );
  // }
}