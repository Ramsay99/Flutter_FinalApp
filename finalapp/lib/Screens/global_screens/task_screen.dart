import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});
  static GButton bottomNavBarItem = const GButton(
    icon: FontAwesomeIcons.listCheck,
  );
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          label: "Schedule",
          onTap: () {
            Navigator.pushNamed(context, "/taskForm");
          },
        ),
        Expanded(
          child: StreamBuilder(
            stream: OrganizationService().taskStream(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return TaskCard(
                      address: documentSnapshot['address'],
                      area: documentSnapshot['area'],
                      product: documentSnapshot['productID'],
                      date: documentSnapshot['date'],
                    );
                  },
                );
              } else {
                return const LoadingIndicatorWidget();
              }
            },
          ),
        ),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  final String address;
  final String area;
  final String product;
  final String date;
  const TaskCard({
    required this.address,
    required this.area,
    required this.product,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      text: address,
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
                      text: area,
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
                      text: product,
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
            date,
            style: const TextStyle(
              color: oxford_blue_tint_4,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
