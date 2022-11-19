import 'package:flutter/material.dart';

class BottomToggleButtons extends StatefulWidget {
  const BottomToggleButtons({super.key});

  @override
  State<BottomToggleButtons> createState() => _BottomToggleButtonsState();
}

class _BottomToggleButtonsState extends State<BottomToggleButtons> {
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: <Widget>[
        Text("test"),
        Text("test"),
        Text("test"),
      ],
      isSelected: isSelected,
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
    );
  }
}
