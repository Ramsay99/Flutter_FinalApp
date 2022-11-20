import 'package:flutter/material.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordFormField extends StatefulWidget {
  final String hint;
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const PasswordFormField({
    required this.hint,
    required this.title,
    required this.controller,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 0, 0, 7),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: oxford_blue_tint_4,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: widget.controller,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                // Setting the background color of the TextFormField.
                filled: true,
                fillColor: light_blue_tint_2,
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: red_tint_1,
                    width: 1,
                  ),
                ),
                // Setting the border of the TextFormField when it is focused.
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(4),
                //   borderSide: const BorderSide(
                //     color: light_blue_tint_1,
                //     width: 1,
                //   ),
                // ),
                // Setting the error style and error border.
                errorStyle: const TextStyle(color: red_tint_1),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: red_tint_1,
                    width: 1,
                  ),
                ),
                // Removing the default border.
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                // Setting the hint text and hint style.
                hintText: widget.hint,
                hintStyle: const TextStyle(
                  color: light_grey_tint_1,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                // Setting the padding of the hint text.
                isCollapsed: true,
                contentPadding: const EdgeInsets.all(18),
                // Adding an icon to the right of the text field.
                suffixIcon: IconButton(
                  icon: FaIcon(
                    _passwordVisible
                        ? FontAwesomeIcons.solidEye
                        : FontAwesomeIcons.solidEyeSlash,
                    color: oxford_blue_tint_4,
                    size: 15,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              validator: widget.validator,
            ),
          ),
        ],
      ),
    );
  }
}
