import 'package:finalapp/local_models/local_model_barrel.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class DeliveriesScreen extends StatefulWidget {
  const DeliveriesScreen({super.key});

  static BottomNavigationBarItem bottomNavBarItem =
      const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  );
  @override
  State<DeliveriesScreen> createState() => _DeliveriesScreenState();
}

class _DeliveriesScreenState extends State<DeliveriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: localCurrentUser.runtimeType == Manager ? true : false,
          child: CardFb2(
            text: "New Delivery",
            imageUrl: "https://static.thenounproject.com/png/621382-200.png",
            subtitle: const Icon(Icons.add_box_outlined),
            onPressed: () {
              debugPrint("Pressed on Create Emp");
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) {
              return CardFb2(
                text: "Delivery_Num: $index",
                imageUrl:
                    "https://p1.itc.cn/q_70/images03/20210215/b5788fa341a54bf388bf4257600496cb.gif",
                subtitle: const Icon(Icons.run_circle_outlined),
                onPressed: () {
                  debugPrint("Pressed on $index");
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class CardFb2 extends StatelessWidget {
  final String text;
  final String imageUrl;
  final Icon subtitle;
  final Function() onPressed;
  final double height = 75;

  CardFb2(
      {required this.text,
      required this.imageUrl,
      required this.subtitle,
      required this.onPressed,
      double height = 75,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Row(
          children: [
            Image.network(imageUrl, height: 59, fit: BoxFit.cover),
            const SizedBox(
              width: 15,
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const Spacer(),
            subtitle,
            // Text(
            //   subtitle,
            //   textAlign: TextAlign.center,
            //   style: const TextStyle(
            //       color: Colors.grey,
            //       fontWeight: FontWeight.normal,
            //       fontSize: 12),
            // ),
          ],
        ),
      ),
    );
  }
}
