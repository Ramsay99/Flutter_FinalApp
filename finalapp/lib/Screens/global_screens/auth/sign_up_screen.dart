import 'package:finalapp/Screens/global_screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../Utility/utility_barrel.dart';
import '../../../Widgets/widgets_barrel.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
                    controller: emailController,
                  ),
                  DefaultFormField(
                    key: const Key("email_textfield"),
                    textHint: "E-mail",
                    controller: emailController,
                  ),
                  DefaultFormField(
                    textHint: "Phone Number",
                    controller: emailController,
                  ),
                  DefaultFormField(
                    textHint: "Name of the Organization",
                    controller: emailController,
                  ),
                  DefaultFormField(
                    textHint: "Location of the Organization",
                    controller: emailController,
                  ),
                  DefaultFormField(
                    key: const Key("pass_textfield"),
                    textHint: "Password",
                    controller: passwordController,
                  ),
                  DefaultButton(
                    label: "Sign Up",
                    onTap: () {
                      signUp();
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

  Future signUp() async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
      AuthService().signInUser(
        emailController.text,
        passwordController.text,
      );
    } finally {
      Navigator.pop(context);
    }
  }
}
