import 'package:finalapp/utility/utility_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static GButton bottomNavBarItem = const GButton(
    icon: FontAwesomeIcons.chartColumn,
  );

  @override
  State<DashboardScreen> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  late Stream _purchaseStream;
  late Stream _productStream;

  @override
  void initState() {
    _purchaseStream = OrganizationService().taskStream();
    _productStream = OrganizationService().getOrgProducts();
    super.initState();
  }

  List cities = [
    "Amman",
    "Salt",
    "Aqaba",
    "Irbid",
    "Zarqa",
    "Jarash",
    "Madaba",
    "Salt",
    "Kerak",
    "Ajlun",
    "Mafraq",
    "Tafela",
    "Maan"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          StreamBuilder(
            stream: _purchaseStream,
            builder: (BuildContext context, AsyncSnapshot snapshot1) {
              return StreamBuilder(
                stream: _productStream,
                builder: (BuildContext context, AsyncSnapshot snapshot2) {
                  if (snapshot1.hasData && snapshot1.data.docs.length != 0) {
                    final Map<dynamic, dynamic> dataMapValues = {};
                    final List<String> productPurchaseList = [];
                    for (int i = 0; i < snapshot1.data.docs.length; i++) {
                      productPurchaseList
                          .add(snapshot1.data!.docs[i]['productID']);
                    }
                    for (int i = 0; i < snapshot2.data.docs.length; i++) {
                      dataMapValues[snapshot2.data!.docs[i]['model']] =
                          getOccurrence(
                        productPurchaseList,
                        snapshot2.data!.docs[i]['model'],
                      );
                    }
                    return PieChartWidget(
                      firestoreData: dataMapValues,
                    );
                  } else {
                    return const LoadingIndicatorWidget();
                  }
                },
              );
            },
          ),
          StreamBuilder(
            stream: _purchaseStream,
            builder: (BuildContext context, AsyncSnapshot snapshot1) {
              return StreamBuilder(
                stream: _productStream,
                builder: (BuildContext context, AsyncSnapshot snapshot2) {
                  if (snapshot1.hasData && snapshot1.data.docs.length != 0) {
                    final Map<dynamic, dynamic> dataMapValues = {};
                    final List<String> productPurchaseAreaList = [];
                    for (int i = 0; i < snapshot1.data.docs.length; i++) {
                      productPurchaseAreaList
                          .add(snapshot1.data!.docs[i]['area']);
                    }
                    for (int i = 0; i < cities.length; i++) {
                      dataMapValues[cities[i]] = getOccurrence(
                        productPurchaseAreaList,
                        cities[i],
                      );
                    }
                    return MapChartWidget(
                      firestoreData: dataMapValues,
                    );
                  } else {
                    return const LoadingIndicatorWidget();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

getOccurrence(array, value) {
  var count = 0;
  array.forEach(
    (v) {
      if (v == value) {
        count++;
      }
    },
  );
  return count;
}
