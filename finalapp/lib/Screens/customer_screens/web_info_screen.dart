import 'package:flutter/material.dart';

class WebInfoScreen extends StatefulWidget {
  final String? id;
  const WebInfoScreen({this.id, super.key});

  @override
  State<WebInfoScreen> createState() => _WebInfoScreenState();
}

class _WebInfoScreenState extends State<WebInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            widget.id.toString(),
          ),
        ],
      ),
    );
  }
}
