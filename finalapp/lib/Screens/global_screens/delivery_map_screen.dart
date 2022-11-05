import 'dart:async';

import 'package:finalapp/Utility/location_service.dart';
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
  Completer<GoogleMapController> _controller = Completer();

  TextEditingController _searchController = TextEditingController();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
//marker for Google Plex
  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId("_kGooglePlex"),
    infoWindow: InfoWindow(title: "Google Plex "),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.42796133580664, -122.085749655962),
  );
//marker for the lake
  // static final Marker _kLakeMarker = Marker(
  //   markerId: MarkerId("_kLake"),
  //   infoWindow: InfoWindow(title: "Lake"),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: LatLng(37.43296265331129, -122.08832357078792),
  // );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  //polyLine
  // static final Polyline _kPolyline = Polyline(
  //     polylineId: PolylineId("_kPolyline"),
  //     points: [
  //       LatLng(37.43296265331129, -122.08832357078792),
  //       LatLng(37.42796133580664, -122.085749655962),
  //     ],
  //     width: 4);

  //PolyGon

  // static final Polygon _kPolygon = Polygon(
  //   polygonId: PolygonId("_kPolygon"),
  //   points: [
  //     LatLng(37.43296265331129, -122.08832357078792),
  //     LatLng(37.42796133580664, -122.085749655962),
  //   ],strokeWidth: 4
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(child: DefaultDrawer()),
      body: Column(children: [
        Row(
          children: [
            Expanded(
                child: TextFormField(
              controller: _searchController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(hintText: "Search for location"),
            )),
            IconButton(
                onPressed: () async {
                  var place =
                      await LocationService().getPlace(_searchController.text);
                  _gotToPlace(place);
                },
                icon: Icon(Icons.search))
          ],
        ),
        Expanded(
          flex: 2,
          child: GoogleMap(
            // polylines: {_kPolyline},
            markers: {
              _kGooglePlexMarker,
            },
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
        Expanded(
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
                IconButton(
                  icon: const Icon(
                    Icons.messenger,
                    size: 40,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ]),
            ]),
          ),
        )
      ]),
    );
  }

  Future<void> _gotToPlace(Map<String, dynamic> place) async {
    final double lat = place["geometry"]["location"]["lat"];
    final double lng = place["geometry"]["location"]["lng"];
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));
  }
}
