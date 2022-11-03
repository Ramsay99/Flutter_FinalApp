import 'package:flutter/material.dart';

class DefaultChipLogIn extends StatefulWidget {
  final String email, pass;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  String chipLabel;

  DefaultChipLogIn({
    super.key,
    required this.email,
    required this.pass,
    required this.emailController,
    required this.passwordController,
    this.chipLabel = "",
  }) {
    chipLabel = chipLabel.isEmpty ? _SubstrEmail_DotCom(email) : chipLabel;
  }

  @override
  State<DefaultChipLogIn> createState() => _DefaultChipLogInState();
}

class _DefaultChipLogInState extends State<DefaultChipLogIn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        child: Chip(
          backgroundColor: Colors.grey.shade600,
          labelPadding: const EdgeInsets.only(left: 2, right: 2),
          label: Text(
            widget.chipLabel,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        onTap: () {
          widget.emailController.text = widget.email;
          widget.passwordController.text = widget.pass;
        },
      ),
    );
  }
}

String _SubstrEmail_DotCom(String email) {
  email = email.toString().substring(0, email.toString().length - 4);
  return email;
}
