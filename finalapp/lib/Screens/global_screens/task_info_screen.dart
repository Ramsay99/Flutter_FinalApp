import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/utility/utility_barrel.dart';
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
    String? status;
    switch (widget.document['status']) {
      case 0:
        status = "Processing";
        break;
      case 1:
        status = "Out for delivery";
        break;
      case 2:
        status = "Delivered";
        break;
    }

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
                      title: "City",
                    ),
                    DefaultTextBox(
                      text: widget.document['productID'],
                      title: "Product",
                    ),
                    DefaultTextBox(
                      text: widget.document['name'],
                      title: "Customer Name",
                    ),
                    DefaultTextBox(
                      text: widget.document['note'],
                      title: "Note",
                    ),
                    DefaultTextBox(
                      text: status!,
                      title: "Status",
                    ),
                    Visibility(
                      visible: widget.document['status'] >= 1 ? true : false,
                      child: DefaultTextBox(
                        text: widget.document['employee']['name'],
                        title: "Driver",
                      ),
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
                            Uri(scheme: "tel", path: widget.document['phone']);
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
                            "https://www.google.com/maps/search/?api=1&query=${widget.document['location'][0]},${widget.document['location'][1]}";
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
                Stack(
                  children: [
                    Visibility(
                      maintainState: true,
                      visible: !role && widget.document['status'] == 1
                          ? true
                          : false,
                      child: DefaultButton(
                        label: "Delivered",
                        onTap: () {
                          OrganizationService().updateTaskData(
                            {
                              "name": localUser.name,
                              "phone": localUser.phoneNumber,
                            },
                            2,
                            widget.document.id,
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Visibility(
                      maintainState: true,
                      visible: !role && widget.document['status'] == 0
                          ? true
                          : false,
                      child: DefaultButton(
                        label: "Claim",
                        onTap: () {
                          OrganizationService().updateTaskData(
                            {
                              "name": localUser.name,
                              "phone": localUser.phoneNumber,
                            },
                            1,
                            widget.document.id,
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Visibility(
                      visible: role,
                      child: DefaultButton(
                        label: "Delete",
                        color: red_tint_1,
                        onTap: () {
                          ErrorAlertWidget(
                            context,
                            "Delete Task?",
                            "Are you sure you would like to cancel this schedule?",
                            "Delete",
                            () {
                              taskCollection.doc(widget.document.id).delete();
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
