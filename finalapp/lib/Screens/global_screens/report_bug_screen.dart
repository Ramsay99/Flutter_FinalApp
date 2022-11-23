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
  TextEditingController titleController = TextEditingController();
  TextEditingController reportController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultFormField(
                hint: "Your Email ", title: "Email", controller: reportEmail),
            DefaultFormField(
                hint: "Title ", title: "Title", controller: titleController),
            DefaultFormField(
                hint: "Subject ",
                title: "subject",
                controller: reportController),
            DefaultButton(
                label: "Submit",
                onTap: () async {
                  ErrorAlertWidget(
                      context,
                      "Thank you ",
                      "thank you for reporting a bugs , we will make sure to take it in concidration ",
                      "Done", () {
                    Navigator.pop(context);

                    reportEmail.clear();
                    titleController.clear();
                    reportController.clear();
                  });

                  // Utils.errorSnackBar("Thank you for reporting a bug ");
                })
          ],
        ),
      ),
    );
  }
}
