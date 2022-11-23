import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final DocumentSnapshot document;
  const TaskCard({
    required this.document,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/taskInfo", arguments: document);
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
        decoration: BoxDecoration(
          color: light_blue_tint_2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Address: ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: document['address'],
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: "Area: ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: document['area'],
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: "Product: ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: document['productID'],
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              document['date'],
              style: const TextStyle(
                color: oxford_blue_tint_4,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
