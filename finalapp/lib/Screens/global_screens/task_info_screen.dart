import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TaskInfoScreen extends StatefulWidget {
  final DocumentSnapshot document;
  const TaskInfoScreen({
    super.key,
    required this.document,
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
                      text: widget.document['address'],
                      title: "Address",
                    ),
                    DefaultTextBox(
                      text: widget.document['area'],
                      title: "Area",
                    ),
                    DefaultTextBox(
                      text: widget.document['productID'],
                      title: "Product",
                    ),
                    DefaultTextBox(
                      text: "test", //! ADD DOC
                      title: "Customer name",
                    ),
                    DefaultTextBox(
                      text: "test", //! ADD d
                      title: "Note",
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultButton(
                      label: "Call",
                      color: oxford_blue_tint_2,
                      width: 145,
                      onTap: () async {
                        final Uri phoneUri =
                            Uri(scheme: "tel", path: "85131313"); //! ADD DOC
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
                        //${widget.document['location'][0]}
                        final String locationUri =
                            "https://www.google.com/maps/search/?api=1&query=0.00000,0.00000}"; //! ADD DOC
                        try {
                          if (await canLaunchUrlString(
                              locationUri.toString())) {
                            await launchUrlString(locationUri.toString());
                          }
                        } catch (error) {
                          errorSnackBar(context, "Could not launch map.");
                        }
                      },
                    ),
                  ],
                ),
                DefaultButton(
                  label: "Delete",
                  color: red_tint_1,
                  onTap: () {
                    DeleteAlertWidget(context, widget.document.id);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
