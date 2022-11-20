import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:finalapp/style/style_barrel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/svg/Logo.svg',
                  semanticsLabel: 'Logo',
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ),
          const Spacer(),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              children: [
                DefaultFormField(
                  title: 'E-mail',
                  hint: "@email.com",
                  controller: emailController!,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "Please enter E-mail.";
                    }
                  },
                ),
                PasswordFormField(
                  title: 'Password',
                  hint: "Password",
                  controller: passwordController!,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "Please enter password.";
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: blue_tint_1,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                DefaultButton(
                  label: "Sign in",
                  onTap: () {
                    final isValidForm = formKey.currentState!.validate();
                    if (isValidForm) {
                      AuthService().signInUser(
                        emailController!.text,
                        passwordController!.text,
                        context,
                      );
                    }
                  },
                ),
                const SizedBox(height: 8),
                DefaultButton(
                  color: oxford_blue_tint_2,
                  label: "Contact Us",
                  onTap: () {},
                ),
                // Wrap(
                //   spacing: 8,
                //   alignment: WrapAlignment.spaceEvenly,
                //   children: [
                //     DefaultChipLogIn(
                //       key: const Key("clear_chip"),
                //       email: "",
                //       pass: "",
                //       emailController: emailController,
                //       passwordController: passwordController,
                //       chipLabel: "Clear",
                //     ),
                //     DefaultChipLogIn(
                //       key: const Key("test_chip"),
                //       email: "test@test.com",
                //       pass: "test1234",
                //       emailController: emailController,
                //       passwordController: passwordController,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/svg/Pattern.svg',
            semanticsLabel: 'Bottom pattern',
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
