import 'package:finalapp/Utility/utility_barrel.dart';
import 'package:finalapp/Widgets/default_button.dart';
import 'package:finalapp/Widgets/default_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreeen extends StatefulWidget {
  const ForgotPasswordScreeen({super.key});

  @override
  State<ForgotPasswordScreeen> createState() => _ForgotPasswordScreeenState();
}

class _ForgotPasswordScreeenState extends State<ForgotPasswordScreeen> {
  TextEditingController resetEmailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    resetEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultFormField(textHint: "Email", controller: resetEmailController),
          DefaultButton(label: "Reset Password", onTap: resetPassword)
        ],
      )),
    );
  }

  Future resetPassword() async {
    SnackBar(
      content: Text("sdfsdf"),
      backgroundColor: Colors.red,
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetEmailController.text.trim());
      Utils.errorSnackBar("Reset Password email Sent");
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.errorSnackBar(e.message);
    }
  }
}
