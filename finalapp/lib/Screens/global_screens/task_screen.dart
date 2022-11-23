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
                            if (document['status'] != 1 && localUser.cities.contains(document['area'])) {
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
        Visibility(
          visible: role,
          child: Align(
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
        ),
      ],
    );
  }
}

