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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
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
          ),
        ],
      ),
    );
  }
}
