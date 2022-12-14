import 'package:finalapp/style/style_barrel.dart';
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
    return Container(
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
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
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
          Text("Today"),
          Text("Future"),
          Text("History"),
        ],
      ),
    );
  }
}
