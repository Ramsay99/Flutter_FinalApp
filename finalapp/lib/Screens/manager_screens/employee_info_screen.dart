import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EmployeeInfoScreen extends StatefulWidget {
  final DocumentSnapshot document;
  const EmployeeInfoScreen({
    super.key,
    required this.document,
  });

  @override
  State<EmployeeInfoScreen> createState() => _EmployeeInfoScreenState();
}

class _EmployeeInfoScreenState extends State<EmployeeInfoScreen> {
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
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DefaultTextBox(
                        text: widget.document['name'],
                        title: "Full Name",
                      ),
                      DefaultTextBox(
                        text: widget.document['email'],
                        title: "E-mail",
                      ),
                      DefaultTextBox(
                        text: widget.document['phone'],
                        title: "Phone",
                      ),
                      DefaultTextBox(
                        text:
                            widget.document['role'] == 0 ? "Employee" : "Admin",
                        title: "Role",
                      ),
                      DefaultTextBox(
                        text: widget.document['uid'],
                        title: "ID",
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  DefaultButton(
                    label: "Delete Account",
                    color: red_tint_1,
                    onTap: () {
                      ErrorAlertWidget(
                        context,
                        "Delete Account?",
                        "Are you sure you would like to delete this account?",
                        "Delete",
                        () {
                          users.doc(widget.document['uid']).delete();
                          Navigator.of(context)
                            ..pop()
                            ..pop();
                        },
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
