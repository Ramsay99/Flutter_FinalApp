import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';

class ActiveTaskScreen extends StatefulWidget {
  const ActiveTaskScreen({super.key});
  static GButton bottomNavBarItem = const GButton(
    icon: Icons.inventory_outlined,
    iconSize: 28,
  );
  @override
  State<ActiveTaskScreen> createState() => _ActiveTaskScreenState();
}

class _ActiveTaskScreenState extends State<ActiveTaskScreen> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
            stream: OrganizationService().taskStream(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List filteredDocumentSnapshot = [];
              if (snapshot.hasData && snapshot.data.docs.length != 0) {
                for (int i = 0; i < snapshot.data.docs.length; i++) {
                  final document = snapshot.data!.docs[i];
                  if (document['status'] == 1 &&
                      document['employee']['phone'] == localUser.phoneNumber) {
                    filteredDocumentSnapshot.add(document);
                  }
                }
                if (filteredDocumentSnapshot.isEmpty) {
                  return const HappyRobot();
                } else {
                  return ListView.builder(
                    itemCount: filteredDocumentSnapshot.length,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        document: filteredDocumentSnapshot[index],
                      );
                    },
                  );
                }
              } else {
                return const LoadingRobot();
              }
            },
          ),
        ),
      ],
    );
  }
}
