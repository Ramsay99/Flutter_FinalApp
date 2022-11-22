import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});
  static GButton bottomNavBarItem = const GButton(
    icon: FontAwesomeIcons.listCheck,
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
          label: "Schedule",
          onTap: () {
            Navigator.pushNamed(context, "/taskForm");
          },
        ),
        Expanded(
          child: StreamBuilder(
            stream: OrganizationService().taskStream(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData && snapshot.data.docs.length != 0) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return TaskCard(
                      document: documentSnapshot,
                    );
                  },
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: SvgPicture.asset(
                          'assets/svg/robot/robot_smile.svg',
                          semanticsLabel: 'Robot smiling',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "No new tasks found",
                        style: TextStyle(
                          color: oxford_blue_tint_1,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  final DocumentSnapshot document;
  const TaskCard({
    required this.document,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.pushNamed(context, "/taskInfo", arguments: document);
      }),
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
        decoration: BoxDecoration(
          color: light_blue_tint_2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Address: ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: document['address'],
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: "Area: ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: document['area'],
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: "Product: ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: document['productID'],
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              document['date'],
              style: const TextStyle(
                color: oxford_blue_tint_4,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
