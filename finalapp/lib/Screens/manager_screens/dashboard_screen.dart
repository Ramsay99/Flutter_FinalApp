import 'package:finalapp/Screens/manager_screens/dashboard/line_chart/line_chart_vis.dart';
import 'package:finalapp/screens/screens_barrel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../style/style_barrel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static GButton bottomNavBarItem = const GButton(
    icon: FontAwesomeIcons.chartColumn,
  );

  @override
  State<DashboardScreen> createState() => _DashboardState();
}

// ToDo: Make this code cleaner.
class _DashboardState extends State<DashboardScreen> {
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Visibility(visible: isSelected[0], child: const PieChartWidget()),
          Visibility(visible: isSelected[1], child: const MapChartWidget()),
          Visibility(
              visible: isSelected[2],
              child: const LineChartVis(chartData: [10, 25, 80, 40, 30])),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
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
                textStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                constraints: const BoxConstraints(minWidth: 104, minHeight: 28),
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
                  Text("GeoGraph"),
                  Text("Line Chart"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
