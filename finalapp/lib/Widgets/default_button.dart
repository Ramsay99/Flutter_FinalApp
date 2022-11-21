import 'package:flutter/material.dart';
import 'package:finalapp/style/style_barrel.dart';

class DefaultButton extends StatefulWidget {
  final String label;
  final Function()? onTap;
  final Color? color;
  final double? width;
  final double? height;
  const DefaultButton({
    required this.label,
    required this.onTap,
    this.color,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);
  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color ?? blue_tint_1,
          fixedSize: Size(
            widget.width ?? 300,
            widget.height ?? 45,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: widget.onTap,
        child: Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
