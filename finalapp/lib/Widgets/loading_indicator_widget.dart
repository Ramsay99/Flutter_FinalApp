import 'package:flutter/material.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitRipple(
      color: oxford_blue_tint_1,
      size: 70,
    );
  }
}
