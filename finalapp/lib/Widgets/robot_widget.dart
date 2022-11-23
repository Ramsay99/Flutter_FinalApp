import 'package:finalapp/style/style_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorRobot extends StatelessWidget {
  const ErrorRobot({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: SvgPicture.asset(
              'assets/svg/robot/robot_error.svg',
              semanticsLabel: 'Robot error',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "This page doesn't exist",
            style: TextStyle(
              color: oxford_blue_tint_1,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

class SmileRobot extends StatelessWidget {
  const SmileRobot({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: SvgPicture.asset(
              'assets/svg/robot/robot_smile.svg',
              semanticsLabel: 'Robot smiling',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "No new tasks found",
            style: TextStyle(
              color: oxford_blue_tint_1,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

class HappyRobot extends StatelessWidget {
  const HappyRobot({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: SvgPicture.asset(
              'assets/svg/robot/robot_happy.svg',
              semanticsLabel: 'Robot happy',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "You're all caught up",
            style: TextStyle(
              color: oxford_blue_tint_1,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}


class LoadingRobot extends StatelessWidget {
  const LoadingRobot({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: SvgPicture.asset(
              'assets/svg/robot/robot_loading.svg',
              semanticsLabel: 'Robot loading',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Fetching new data..",
            style: TextStyle(
              color: oxford_blue_tint_1,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}