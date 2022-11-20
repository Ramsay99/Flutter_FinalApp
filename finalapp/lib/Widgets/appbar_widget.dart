import 'package:finalapp/style/style_barrel.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late Future _organizationData;

  @override
  void initState() {
    _organizationData = OrganizationService().getOrgData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: SizedBox(
        width: 100,
        height: 70,
        child: FutureBuilder(
          future: _organizationData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: LoadingIndicatorWidget());
            }
            return Image(
              image: NetworkImage(
                snapshot.data['logo'],
              ),
              fit: BoxFit.fitWidth,
            );
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
              size: 33,
            ),
          ),
        ),
      ],
    );
  }
}
