import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';

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
                    title: "Full Name",
                    hint: "Full Name ",
                    controller: fullNameController,
                  ),
                  DefaultFormField(
                    title: "E-mail",
                    key: const Key("email_textfield"),
                    hint: "E-mail",
                    controller: emailController,
                  ),
                  DefaultFormField(
                    title: "Phone",
                    hint: "Phone Number",
                    controller: phoneNumberController,
                  ),
                  DefaultFormField(
                    title: "Org",
                    hint: "Name of the Organization",
                    controller: OrgNameController,
                  ),
                  DefaultFormField(
                    title: "Location",
                    hint: "Location of the Organization",
                    controller: OrgLocationController,
                  ),
                  DefaultFormField(
                    title: "Password",
                    key: const Key("pass_textfield"),
                    hint: "Password",
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
