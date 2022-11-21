import 'package:flutter/material.dart';
import 'package:finalapp/style/style_barrel.dart';

void errorSnackBar(BuildContext context, error) {
  final snackBar = SnackBar(
    elevation: 0,
    content: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: red_tint_2,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: red_tint_1,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: red_tint_1,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                error,
                style: const TextStyle(
                  color: red_tint_1,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
