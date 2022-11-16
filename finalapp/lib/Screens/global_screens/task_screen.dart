import 'package:finalapp/widgets/default_button.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});
  static BottomNavigationBarItem bottomNavBarItem =
      const BottomNavigationBarItem(
    icon: Icon(Icons.checklist),
    label: 'Tasks',
  );
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          label: "New Task",
          onTap: () {},
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
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
  const TaskCard({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
