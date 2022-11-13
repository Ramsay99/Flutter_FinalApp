import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/Screens/global_screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Utility/utility_barrel.dart';
import '../../../Widgets/widgets_barrel.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var OrgNameController = TextEditingController();
  var OrgLocationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Column(children: [
                  DefaultFormField(
                    textHint: "Full Name ",
                    controller: fullNameController,
                  ),
                  DefaultFormField(
                    key: const Key("email_textfield"),
                    textHint: "E-mail",
                    controller: emailController,
                  ),
                  DefaultFormField(
                    textHint: "Phone Number",
                    controller: phoneNumberController,
                  ),
                  DefaultFormField(
                    textHint: "Name of the Organization",
                    controller: OrgNameController,
                  ),
                  DefaultFormField(
                    textHint: "Location of the Organization",
                    controller: OrgLocationController,
                  ),
                  DefaultFormField(
                    key: const Key("pass_textfield"),
                    textHint: "Password",
                    controller: passwordController,
                  ),
                  DefaultButton(
                    label: "Sign Up",
                    onTap: () {
                      //signUp();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dont Have an Account,"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text("Sign In"))
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUp({
    required BuildContext context,
    //bool withAutoSignIn = false,
  }) async {
    bool isSignedUpSuccessfully = false;
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      isSignedUpSuccessfully = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    ///HERE TO ADD THE USER DATA TO THE FIRESTORE
    ///
    ///
    //   if (isSignedUpSuccessfully) {
    //     Map<String, dynamic> user = {
    //       "email": emailController.text,
    //       "role": "user",
    //       "name": fullNameController.text,
    //       "phone":phoneNumberController.text,
    //       "organization_name":OrgNameController.text,
    //       "organization_location": OrgLocationController.text,
    //     };
    //     addUser(user);
    //   }

    // }
    // void addUser(Map<String, dynamic> user) {
    //   db
    //       .collection("users")
    //       .doc(FirebaseAuth.instance.currentUser!.uid)
    //       .set(user)
    //       .onError((e, _) => print("Error writing document: $e"));
  }
}
