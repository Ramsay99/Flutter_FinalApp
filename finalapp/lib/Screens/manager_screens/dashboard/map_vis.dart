import 'package:flutter/material.dart';

class MapChartWidget extends StatefulWidget {
  const MapChartWidget({super.key});

  @override
  State<MapChartWidget> createState() => _MapChartWidgetState();
}

class _MapChartWidgetState extends State<MapChartWidget> {
  Image? _jordanMapImage;
  late String _irbidMapImage;
  late String _ajlunMapImage;
  late String _jarashMapImage;
  late String _mafraqMapImage;
  late String _saltMapImage;
  late String _zarqaMapImage;
  late String _madabaMapImage;
  late String _ammanMapImage;
  late String _karakMapImage;
  late String _tafelaMapImage;
  late String _maanMapImage;
  late String _aqabaMapImage;

  @override
  void initState() {
    super.initState();
    _jordanMapImage = Image.asset('assets/images/jordanMap.png');
    _irbidMapImage = 'assets/images/irbid.png';
    _ajlunMapImage = 'assets/images/ajlun.png';
    _jarashMapImage = 'assets/images/jarash.png';
    _mafraqMapImage = 'assets/images/mafraq.png';
    _saltMapImage = 'assets/images/salt.png';
    _zarqaMapImage = 'assets/images/zarqa.png';
    _madabaMapImage = 'assets/images/madaba.png';
    _ammanMapImage = 'assets/images/amman.png';
    _karakMapImage = 'assets/images/karak.png';
    _tafelaMapImage = 'assets/images/tafela.png';
    _maanMapImage = 'assets/images/maan.png';
    _aqabaMapImage = 'assets/images/aqaba.png';
  }

  @override
  Widget build(BuildContext context) {
    // Vals will be taken from FireStore `Cities` :P
    int testColIncrementaly = 0;
    int mapCol() {
      testColIncrementaly += (256 / 12).round();
      print(testColIncrementaly);
      return testColIncrementaly;
    }

    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.25,
        child: _Map(mapCol),
      ),
    );
  }

  Stack _Map(int mapCol()) {
    return Stack(
      children: [
        _jordanMapImage!,
        _defaultCity(_ajlunMapImage, mapCol()),
        _defaultCity(_irbidMapImage, mapCol()),
        _defaultCity(_jarashMapImage, mapCol()),
        _defaultCity(_mafraqMapImage, mapCol()),
        _defaultCity(_saltMapImage, mapCol()),
        _defaultCity(_zarqaMapImage, mapCol()),
        _defaultCity(_madabaMapImage, mapCol()),
        _defaultCity(_ammanMapImage, mapCol()),
        _defaultCity(_karakMapImage, mapCol()),
        _defaultCity(_tafelaMapImage, mapCol()),
        _defaultCity(_maanMapImage, mapCol()),
        _defaultCity(_aqabaMapImage, mapCol()),
      ],
    );
  }

  Widget _defaultCity(String cityImgPath, int density) {
    int mapAlpha = density;
    if (density < 30) {
      mapAlpha = 30;
    } else if (density > 160) {
      mapAlpha = 170;
    }
    return Image.asset(
      cityImgPath,
      color: Color.fromARGB(mapAlpha, density, 0, 0),
    );
  }
}
