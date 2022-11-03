import 'package:flutter/material.dart';

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color ?? Colors.blue,
        fixedSize: Size(
          widget.width ?? 200,
          widget.height ?? 40,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: widget.onTap,
      child: Text(
        widget.label,
      ),
    );
  }
}
