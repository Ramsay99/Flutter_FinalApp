import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),

        // ignore: prefer_const_literals_to_create_immutables
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Settings",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Language",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Theme",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              )),
        ]),
      ),
    );
  }
}
