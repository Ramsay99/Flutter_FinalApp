import 'package:finalapp/Utility/utils.dart';
import 'package:finalapp/Widgets/default_button.dart';
import 'package:finalapp/Widgets/default_chip_buttons.dart';
import 'package:finalapp/Widgets/default_text_field.dart';
import 'package:finalapp/utility/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var emailController = TextEditingController();
var passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
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
                    key: const Key("email_textfield"),
                    textHint: "E-mail",
                    controller: emailController,
                  ),
                  DefaultFormField(
                    key: const Key("pass_textfield"),
                    textHint: "Password",
                    controller: passwordController,
                  ),
                  DefaultButton(
                    label: "Login",
                    onTap: () {
                      signIn();
                    },
                  ),
                  Wrap(
                    spacing: 8,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      DefaultChipLogIn(
                        key: const Key("clear_chip"),
                        email: "",
                        pass: "",
                        emailController: emailController,
                        passwordController: passwordController,
                        chipLabel: "Clear",
                      ),
                      DefaultChipLogIn(
                        key: const Key("test_chip"),
                        email: "test@test.com",
                        pass: "test1234",
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
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

  Future signIn() async {
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
