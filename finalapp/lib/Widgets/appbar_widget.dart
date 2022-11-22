import 'package:finalapp/style/style_barrel.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.barsStaggered,
            color: oxford_blue_tint_2,
            size: 23,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/qr");
            },
            icon: const FaIcon(
              FontAwesomeIcons.qrcode,
              color: oxford_blue_tint_2,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
