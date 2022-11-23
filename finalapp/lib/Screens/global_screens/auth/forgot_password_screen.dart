import 'package:flutter/material.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          DefaultFormField(
            hint: "E-mail",
            title: "E-mail",
            controller: resetEmailController,
          ),
          DefaultButton(label: "Reset Password", onTap: resetPassword)
        ],
      )),
    );
  }

  Future resetPassword() async {
    const SnackBar(
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
