import 'dart:ui';
import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Future<void> DeleteAlertWidget(context, String docID) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: AlertDialog(
          elevation: 0,
          backgroundColor: red_tint_2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: red_tint_1,
              width: 1,
            ),
          ),
          content: SizedBox(
            height: 300,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.error_outline_rounded,
                          color: red_tint_1,
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Delete Task?",
                              style: TextStyle(
                                color: red_tint_1,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: red_tint_1,
                      height: 25,
                      thickness: 1,
                    ),
                    const Text(
                      "Are you sure you would like to cancel this schedule?",
                      style: TextStyle(
                        color: red_tint_1,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultButton(
                      label: "Cancel",
                      color: oxford_blue_tint_2,
                      width: 125,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    DefaultButton(
                      label: "Delete",
                      color: red_tint_1,
                      width: 125,
                      onTap: () {
                        taskCollection.doc(docID).delete();
                        Navigator.of(context)
                          ..pop()
                          ..pop();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
