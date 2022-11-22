import 'package:finalapp/Utility/utility_barrel.dart';
import 'package:finalapp/Widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';

class ReportBug extends StatefulWidget {
  const ReportBug({super.key});

  @override
  State<ReportBug> createState() => _ReportBugState();
}

class _ReportBugState extends State<ReportBug> {
  TextEditingController reportEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultFormField(
                hint: "Your Email ", title: "Email", controller: reportEmail),
            DefaultFormField(
                hint: "Title ", title: "Title", controller: reportEmail),
            DefaultFormField(
                hint: "Subject ", title: "subject", controller: reportEmail),
            DefaultButton(
                label: "Submit",
                onTap: () {
                  Navigator.pop(context);
                  // Utils.errorSnackBar("Thank you for reporting a bug ");
                })
          ],
        ),
      ),
    );
  }
}
