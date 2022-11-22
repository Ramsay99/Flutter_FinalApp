import 'package:finalapp/style/style_barrel.dart';
import 'package:flutter/material.dart';

class DefaultChipButtons extends StatefulWidget {
  final String email, pass;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  String chipLabel;

  DefaultChipButtons({
    super.key,
    required this.email,
    required this.pass,
    required this.emailController,
    required this.passwordController,
    this.chipLabel = "",
  }) {
    chipLabel = chipLabel.isEmpty ? _subStringEmail(email) : chipLabel;
  }

  @override
  State<DefaultChipButtons> createState() => _DefaultChipButtonsState();
}

class _DefaultChipButtonsState extends State<DefaultChipButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        child: Chip(
          backgroundColor: light_blue_tint_1,
          labelPadding: const EdgeInsets.only(left: 5, right: 5),
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

String _subStringEmail(String email) {
  email = email.toString().substring(0, email.toString().length - 4);
  return email;
}
