import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/utility/firestore/user_service.dart';
import 'package:finalapp/widgets/default_button.dart';
import 'package:finalapp/widgets/loading_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  static GButton bottomNavBarItem = const GButton(
    icon: FontAwesomeIcons.circleUser,
  );
  @override
  State<EmployeesScreen> createState() => _EState();
}

// ToDo: Make this code cleaner.
class _EState extends State<EmployeesScreen> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultButton(
                label: "Register",
                width: 145,
                onTap: () {
                  Navigator.pushNamed(context, "/employeeForm");
                },
              ),
              const SizedBox(width: 10),
              DefaultButton(
                label: "Import",
                color: oxford_blue_tint_2,
                width: 145,
                onTap: () {
                  Navigator.pushNamed(context, "/employeeForm");
                },
              ),
            ],
          ),
          Visibility(
              visible: isSelected[0],
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Expanded(
                  child: StreamBuilder(
                    stream: UserService().getOrgEmployees(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.active) {
                        return const LoadingIndicatorWidget();
                      }
                      return ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          return SizedBox(
                            height: 70,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "/employeeInfo",
                                  arguments: documentSnapshot,
                                );
                              },
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  height: 50,
                                  width: 50,
                                  'assets/svg/Avatar.svg',
                                  semanticsLabel: 'Avatar',
                                  fit: BoxFit.fill,
                                ),
                                title: Text(
                                  documentSnapshot['name'],
                                ),
                                subtitle: Text(
                                  documentSnapshot['email'],
                                ),
                                trailing: Text(
                                  documentSnapshot['phone'],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(thickness: 1),
                      );
                    },
                  ),
                ),
              )),
          Visibility(
            visible: isSelected[1],
            child: const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text("Un-Available Drivers List here")),
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
                  Text("Available"),
                  Text("Un-Available"),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
