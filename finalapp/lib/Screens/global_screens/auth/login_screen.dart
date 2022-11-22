import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

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
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/Logo.svg',
                      semanticsLabel: 'Logo',
                      height: 50,
                      width: 50,
                    ),
                    IconButton(
                        onPressed: () {
                          _onActionSheetPress(context);
                        },
                        icon: Icon(Icons.language))
                  ],
                ),
              ),
              // const Spacer(),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    DefaultFormField(
                      title: translate("textfield.email"),
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
                      title: translate("textfield.password"),
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
                            child: Text(
                              translate('forgotpassword'),
                              style: const TextStyle(
                                color: blue_tint_1,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/resetPassword");
                            },
                          ),
                        ],
                      ),
                    ),
                    DefaultButton(
                      label: translate('button.sign-in'),
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
                      label: translate("button.contact-us"),
                      onTap: () {},
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
                          email: "test@test.com",
                          pass: "test1234",
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        DefaultChipLogIn(
                          email: "employee@test.com",
                          pass: "test1234",
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // const Spacer(),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       translate(
              //         'language.selected_message',
              //         args: {
              //           'language': translate(
              //             'language.name.${localizationDelegate.currentLocale.languageCode}',
              //           )
              //         },
              //       ),
              //     ),
              //     DefaultButton(
              //       label: translate('button.change_language'),
              //       onTap: () {
              //         _onActionSheetPress(context);
              //       },
              //     )
              //   ],
              // ),
              SvgPicture.asset(
                'assets/svg/Pattern.svg',
                semanticsLabel: 'Bottom pattern',
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
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
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context, null),
          child: Text(translate('button.cancel')),
        ),
      ),
    );
  }
}
