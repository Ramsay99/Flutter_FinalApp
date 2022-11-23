import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          maintainState: true,
          visible: isSelected[0],
          child: Column(
            children: [
              Visibility(
                visible: role,
                child: DefaultButton(
                  label: "Schedule",
                  onTap: () {
                    Navigator.pushNamed(context, "/taskForm");
                  },
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: OrganizationService().taskStream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List filteredDocumentSnapshot = [];
                    if (snapshot.hasData && snapshot.data.docs.length != 0) {
                      if (filteredDocumentSnapshot.isEmpty) {} //! Add robot
                      for (int i = 0; i < snapshot.data.docs.length; i++) {
                        final document = snapshot.data!.docs[i];
                        if (document['status'] != 2) {
                          if (!role) {
                            if (localUser.cities.contains(document['area'])) {
                              filteredDocumentSnapshot.add(document);
                            }
                          } else {
                            filteredDocumentSnapshot.add(document);
                          }
                        }
                      }
                      return ListView.builder(
                        itemCount: filteredDocumentSnapshot.length,
                        itemBuilder: (context, index) {
                          // final DocumentSnapshot documentSnapshot =
                          //     snapshot.data!.docs[index];
                          return TaskCard(
                            document: filteredDocumentSnapshot[index],
                          );
                        },
                      );
                    } else {
                      return const SmileRobot();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Visibility(
          maintainState: true,
          visible: isSelected[1],
          child: Column(
            children: [
              const SizedBox(height: 65),
              Expanded(
                child: StreamBuilder(
                  stream: OrganizationService().taskStream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List filteredDocumentSnapshot = [];
                    if (snapshot.hasData && snapshot.data.docs.length != 0) {
                      if (filteredDocumentSnapshot.isEmpty) {} //! Add robot
                      for (int i = 0; i < snapshot.data.docs.length; i++) {
                        final document = snapshot.data!.docs[i];
                        if (document['status'] == 2) {
                          filteredDocumentSnapshot.add(document);
                        }
                      }
                      return ListView.builder(
                        itemCount: filteredDocumentSnapshot.length,
                        itemBuilder: (context, index) {
                          return TaskCard(
                            document: filteredDocumentSnapshot[index],
                          );
                        },
                      );
                    } else {
                      return const SmileRobot();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 35,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
            decoration: BoxDecoration(
              border: Border.all(color: light_blue_tint_1, width: 1),
              borderRadius: BorderRadius.circular(5),
              color: oxford_blue_tint_2,
            ),
            child: ToggleButtons(
              renderBorder: false,
              isSelected: isSelected,
              fillColor: blue_tint_2,
              color: Colors.white,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(5),
              textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
              constraints: const BoxConstraints(minWidth: 104, minHeight: 28),
              onPressed: (int newIndex) {
                setState(
                  () {
                    for (int index = 0; index < isSelected.length; index++) {
                      if (index == newIndex) {
                        isSelected[index] = true;
                      } else {
                        isSelected[index] = false;
                      }
                    }
                  },
                );
              },
              children: const <Widget>[
                Text("Tasks"),
                Text("History"),
              ],
            ),
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
      onTap: () {
        Navigator.pushNamed(context, "/taskInfo", arguments: document);
      },
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
