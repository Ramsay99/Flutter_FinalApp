import 'package:flutter/material.dart';
import 'package:graphx/graphx.dart';

const smallTextStyle = TextStyle(
  color: Color(0xff333333),
  fontSize: 9,
  fontWeight: FontWeight.w600,
);

const valueTextStyle = TextStyle(
  color: Color(0xff333333),
  fontSize: 6,
  fontWeight: FontWeight.w600,
);

late List<double> cfrData;

Future<void> loadJson(List<double> charData) async {
  // var id = 'assets/isma_chart/chart_data.json';
  /// mmm, not usable it seems.
  // var str = await rootBundle.loadString(id);
  // buildData();
  cfrData = charData;
}

void buildData() {
  // cfrData = List.generate(
  //   5,
  //   (index) {
  //     return Math.randomRange(4, 100);
  //   },
  // );
}

class DotDataModel {
  double? value;
  String year = '2020';
  String value2 = '11';
  String name = 'Ismail';
  GPoint coordinate = GPoint();

  @override
  String toString() {
    return 'DotDataModel {value: $value, year: $year, value2: $value2, name: $name}';
  }
}
