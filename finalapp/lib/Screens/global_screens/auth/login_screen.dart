import 'package:finalapp/Screens/global_screens/auth/forgot_password_screen.dart';
import 'package:finalapp/Screens/global_screens/auth/sign_up_screen.dart';
import 'package:finalapp/Utility/utils.dart';
import 'package:finalapp/Widgets/default_button.dart';
import 'package:finalapp/Widgets/default_chip_buttons.dart';
import 'package:finalapp/Widgets/default_text_field.dart';
import 'package:finalapp/utility/authentication/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_translate/flutter_translate.dart';

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
    var localizationDelegate = LocalizedApp.of(context).delegate;

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
                    textHint: translate("textfield.email"),
                    controller: emailController,
                  ),
                  DefaultFormField(
                    key: const Key("pass_textfield"),
                    textHint: translate("textfield.password"),
                    controller: passwordController,
                  ),
                  GestureDetector(
                    child: Text(translate('forgotpassword')),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreeen()),
                    ),
                  ),
                  DefaultButton(
                    label: translate('login'),
                    onTap: () {
                      signIn();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(translate('doyouhaveaccount')),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
                            );
                          },
                          child: Text(translate('signup')))
                    ],
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(translate('language.selected_message', args: {
                        'language': translate(
                            'language.name.${localizationDelegate.currentLocale.languageCode}')
                      })),
                      Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 160),
                          child: CupertinoButton.filled(
                            child: Text(translate('button.change_language')),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 36.0),
                            onPressed: () => _onActionSheetPress(context),
                          )),
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

  void showDemoActionSheet(
      {required BuildContext context, required Widget child}) {
    showCupertinoModalPopup<String>(
        context: context,
        builder: (BuildContext context) => child).then((String? value) {
      if (value != null) changeLocale(context, value);
    });
  }

  void _onActionSheetPress(BuildContext context) {
    showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: Text(translate('language.selection.title')),
        message: Text(translate('language.selection.message')),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text(translate('language.name.en')),
            onPressed: () => Navigator.pop(context, 'en_US'),
          ),
          CupertinoActionSheetAction(
            child: Text(translate('language.name.ar')),
            onPressed: () => Navigator.pop(context, 'ar'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(translate('button.cancel')),
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context, null),
        ),
      ),
    );
  }
}
