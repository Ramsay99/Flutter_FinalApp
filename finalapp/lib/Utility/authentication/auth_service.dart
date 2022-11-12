import 'package:finalapp/screens/employ_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:finalapp/screens/screens_barrel.dart';

/// Creating a reference to the FirebaseAuth instance.
final auth = FirebaseAuth.instance;

class AuthService {
  /// It takes in an email and password, and returns a future that will resolve to a FirebaseUser object
  ///
  /// Args:
  ///   email (String): The email address of the user.
  ///   password (String): The password for the new account.
  ///
  /// Returns:
  ///   The return value is a Future object.
  Future signUpUser(String email, String password) async {
    return await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// It takes in an email and password, and returns a future that will resolve to a FirebaseUser object
  ///
  /// Args:
  ///   email (String): emailController.text,
  ///   password (String): The user's password.
  ///
  /// Returns:
  ///   The return value is a Future&lt;FirebaseUser&gt;.
  Future signInUser(String email, String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// If the user's uid is not found in the database, then the user is new.
  ///
  /// Returns:
  ///   A Future<bool>
  Future<bool> isNewUser(User user) async {
    QuerySnapshot result = await users.where("uid", isEqualTo: user.uid).get();
    final List<DocumentSnapshot> docs = result.docs;
    return docs.isEmpty ? true : false;
  }

  /// It signs out the user
  signOutUser() {
    auth.signOut();
  }

  /// It takes in a user object, a name, a phone number, a boolean for shift, a boolean for fulltime, a
  /// list of Timestamps, a list of cities, a list of areas, and a string for org. It then checks if the
  /// user is new, and if they are, it creates a document reference for the user and sets the data
  ///
  /// Args:
  ///   user (User): User object from Firebase Auth
  ///   name (String): String
  ///   phone (String): String
  ///   shift (bool): bool,
  ///   fulltime (bool): bool
  ///   date (List<Timestamp>): List of Timestamp
  ///   cities (List<String>): List of cities the user is interested in.
  ///   areas (List<String>): List of areas the user is interested in.
  ///   org (String): String
  ///
  /// Returns:
  ///   A Future<void>
  saveUserData(
    User user,
    String name,
    String phone,
    bool shift,
    bool fulltime,
    List<Timestamp> date,
    List<String> cities,
    List<String> areas,
    String org,
  ) async {
    if (await isNewUser(user)) {
      DocumentReference document = users.doc(user.uid);
      return document.set(
        {
          "name": name,
          "phone": phone,
          "shift": shift,
          "fulltime": fulltime,
          "date": date,
          "cities": cities,
          "areas": areas,
          "org": org,
          "uid": user.uid,
          "email": user.email,
          "role": 0,
        },
      );
    }
  }

  handelUserRole() {
    return FutureBuilder(
      future: UserService().userDataFuture(auth.currentUser!.uid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        return snapshot.data!['role'] == 1
            ? const EmployHomeScreen()
            : const ManagerHomeScreen();
      },
    );
  }

  /// If the user is logged in, show the Home screen, otherwise show the Login screen
  ///
  /// Returns:
  ///   A StreamBuilder widget.
  handleAuthState() {
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        final user = snapshot.data;
        //auth.signOut();
        if (user != null) {
          print("THIS RAN");
          return handelUserRole();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
