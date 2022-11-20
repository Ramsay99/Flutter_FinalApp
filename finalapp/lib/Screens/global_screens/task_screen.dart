import 'package:flutter/material.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});
  static GButton bottomNavBarItem = const GButton(
    icon:  FontAwesomeIcons.listCheck,
  );
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          label: "New Task",
          onTap: () {
            Navigator.pushNamed(context, "/taskForm");
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return TaskCard(
                title: "Delivery_Num: $index",
              );
            },
          ),
        ),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  const TaskCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 25,
      ),
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: Column(
        children: const [
          Text(
            "Address: title",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            "Area: Wadi Saqra, Amman",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            "Product: Samsung S95B OLED",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            "11/4/2022",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
