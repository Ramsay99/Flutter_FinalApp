import 'package:finalapp/style/style_barrel.dart';
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
  Stream? _purchaseStream;
  Stream? _productStream;
  List<bool> isSelected = [true, false, false];

  @override
  void initState() {
    super.initState();
    _purchaseStream = OrganizationService().taskStream();
    _productStream = OrganizationService().getOrgProducts();
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
      body: Stack(
        children: [
          Visibility(
            maintainState: true,
            visible: isSelected[0],
            child: StreamBuilder(
              stream: _purchaseStream,
              builder: (BuildContext context, AsyncSnapshot snapshot1) {
                return StreamBuilder(
                  stream: _productStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot2) {
                    if (snapshot1.connectionState == ConnectionState.active) {
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
          ),
          Visibility(
            maintainState: true,
            visible: isSelected[1],
            child: StreamBuilder(
                stream: _purchaseStream,
                builder: (BuildContext context, AsyncSnapshot snapshot1) {
                  return StreamBuilder(
                    stream: _productStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot2) {
                      if (snapshot1.connectionState == ConnectionState.active) {
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
                }),
          ),
          Visibility(
            visible: isSelected[2],
            child: const LineChartVis(
              chartData: [10, 25, 80, 40, 30],
            ),
          ),
          BottomToggleButtons()
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BottomToggleButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: oxford_blue_tint_2,
        child: Container(
          height: 35,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
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
            textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
            constraints: const BoxConstraints(minWidth: 111, minHeight: 28),
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
              Text("Pie Graph"),
              Text("Geo Graph"),
              Text("Line Chart"),
            ],
          ),
        ),
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