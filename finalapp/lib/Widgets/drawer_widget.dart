import 'dart:ui';

import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late Future _organizationData;

  @override
  void initState() {
    _organizationData = OrganizationService().getOrgData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     topRight: Radius.circular(10),
      //     bottomRight: Radius.circular(10),
      //   ),
      // ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                FutureBuilder(
                  future: _organizationData,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Center(child: LoadingIndicatorWidget());
                    }
                    return Center(
                      child: SizedBox(
                        width: 120,
                        height: 100,
                        child: Image(
                          image: NetworkImage(
                            snapshot.data['logo'],
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
                const Divider(thickness: 1),
                const SizedBox(height: 20),
                DrawerTile(
                  icon: FontAwesomeIcons.gear,
                  text: translate("drawer.settings"),
                  onTap: () {
                    Navigator.pushNamed(context, "/settings");
                  },
                ),
                DrawerTile(
                  icon: FontAwesomeIcons.rightFromBracket,
                  text: translate("drawer.sign_out"),
                  onTap: () {
                    AuthService().signOutUser();
                  },
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),
          DrawerTile(
            icon: FontAwesomeIcons.bug,
            text: translate("report"),
            onTap: () async {
              Navigator.pushNamed(context, "/reportBug");
            },
          ),
          DrawerTile(
            icon: FontAwesomeIcons.circleInfo,
            text: translate("about"),
            onTap: () {
              Navigator.pushNamed(context, "/objectImage");
            },
          ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;
  const DrawerTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListTile(
        leading: FaIcon(
          icon,
          color: light_blue_tint_1,
          size: 20,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
