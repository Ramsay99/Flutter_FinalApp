import 'package:finalapp/Widgets/default_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DeliveryMap extends StatefulWidget {
  const DeliveryMap({super.key});

  @override
  State<DeliveryMap> createState() => _DeliveryMapState();
}

class _DeliveryMapState extends State<DeliveryMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: DefaultDrawer()),
      body: Column(children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey[400],
            child: Container(
                alignment: Alignment.center, child: Text("MAP HERE ")),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(children: [
              Row(
                children: [
                  Icon(Icons.access_time_rounded),
                ],
              )
            ]),
          ),
        )
      ]),
    );
  }
}
