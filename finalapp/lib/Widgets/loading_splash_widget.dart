import 'package:flutter/material.dart';
import 'package:finalapp/widgets/loading_indicator_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingSplashWidget extends StatefulWidget {
  const LoadingSplashWidget({super.key});

  @override
  State<LoadingSplashWidget> createState() => _LoadingSplashWidgetState();
}

class _LoadingSplashWidgetState extends State<LoadingSplashWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg/Logo.svg',
          semanticsLabel: 'Logo',
          height: 120,
          width: 120,
        ),
        const SizedBox(height: 20),
        const LoadingIndicatorWidget()
      ],
    );
  }
}
