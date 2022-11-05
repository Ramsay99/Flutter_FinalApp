// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MapVis extends StatefulWidget {
  const MapVis({super.key});

  @override
  State<MapVis> createState() => _MapVisState();
}

class _MapVisState extends State<MapVis> {
  Image? _jordanMap;
  @override
  void initState() {
    super.initState();
    _jordanMap = Image.asset('assets/images/jordanMap.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map")),
      body: Stack(
        children: [
          _jordanMap!,
          _City('assets/images/madaba.png', 33),
          _City('assets/images/ajlun.png', 122),
          _City('assets/images/amman.png', 111),
          _City('assets/images/aqaba.png', 118),
          _City('assets/images/irbid.png', 72),
          _City('assets/images/jarash.png', 144),
          _City('assets/images/karak.png', 166),
          _City('assets/images/maan.png', 81),
          _City('assets/images/mafraq.png', 99),
          _City('assets/images/salt.png', 138),
          _City('assets/images/tafela.png', 133),
          _City('assets/images/zarqa.png', 166),
        ],
      ),
    );
  }

  Image _City(String cityImgPath, int density) {
    return Image.asset(
      cityImgPath,
      color: Color.fromARGB(255, density, 0, 0),
    );
  }
}
