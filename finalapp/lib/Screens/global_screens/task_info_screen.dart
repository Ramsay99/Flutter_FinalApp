import 'package:flutter/material.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TaskInfoScreen extends StatefulWidget {
  final String address;
  final String city;
  final String product;
  final String date;
  final String name;
  final String note;
  final String driverName;
  final String phone;
  final List<String> location;
  const TaskInfoScreen({
    super.key,
    required this.address,
    required this.city,
    required this.product,
    required this.date,
    required this.name,
    required this.note,
    required this.driverName,
    required this.phone,
    required this.location,
  });

  @override
  State<TaskInfoScreen> createState() => _TaskInfoScreenState();
}

class _TaskInfoScreenState extends State<TaskInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Task Info",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.xmark,
              color: oxford_blue_tint_2,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // DefaultButton(
                    //   label: "Edit",
                    //   color: oxford_blue_tint_2,
                    //   onTap: () {
                    //     //Navigator.pop(context);
                    //   },
                    // ),
                    DefaultTextBox(
                      text: widget.address,
                      title: "Address",
                    ),
                    DefaultTextBox(
                      text: widget.city,
                      title: "Area",
                    ),
                    DefaultTextBox(
                      text: widget.product,
                      title: "Product",
                    ),
                    DefaultTextBox(
                      text: widget.name,
                      title: "Customer name",
                    ),
                    DefaultTextBox(
                      text: widget.note,
                      title: "Note",
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultButton(
                  label: "Call",
                  color: oxford_blue_tint_2,
                  width: 145,
                  onTap: () async {
                    final Uri phoneUri = Uri(scheme: "tel", path: widget.phone);
                    try {
                      if (await canLaunchUrlString(phoneUri.toString())) {
                        await launchUrlString(phoneUri.toString());
                      }
                    } catch (error) {
                      errorSnackBar(context, "Cannot dial");
                    }
                  },
                ),
                const SizedBox(width: 10),
                DefaultButton(
                  label: "Location",
                  color: oxford_blue_tint_2,
                  width: 145,
                  onTap: () async {
                    final String locationUri =
                        "https://www.google.com/maps/search/?api=1&query=${widget.location[0]},${widget.location[1]}";
                    try {
                      if (await canLaunchUrlString(locationUri.toString())) {
                        await launchUrlString(locationUri.toString());
                      }
                    } catch (error) {
                      errorSnackBar(context, "Could not launch map.");
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
