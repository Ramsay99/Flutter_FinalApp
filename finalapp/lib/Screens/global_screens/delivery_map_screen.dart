import 'package:finalapp/Widgets/default_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      drawer: const Drawer(child: DefaultDrawer()),
      body: Column(children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey[400],
            child: Container(
                alignment: Alignment.center,
                child: GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: LatLng(0, 0)))),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Color.fromARGB(255, 190, 212, 255),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(children: [
              Row(
                children: const [
                  Icon(Icons.access_time_rounded),
                  Text("TIME"),
                  SizedBox(
                    width: 170,
                  ),
                  Icon(Icons.location_on),
                  Text("Location Name")
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                ListTile(
                  visualDensity: const VisualDensity(vertical: 4),
                  leading: Container(
                    height: 170,
                    width: 100,
                    color: Colors.black,
                  ),
                  title: Text('CUST INFO'),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.phone,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.messenger,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
              ]),
            ]),
          ),
        )
      ]),
    );
  }
}
