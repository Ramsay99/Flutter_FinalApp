import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImportScreen extends StatefulWidget {
  const ImportScreen({super.key});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Import CVS file",
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
      body: Center(
        child: GestureDetector(
          onTap: () {
            importCSV();
          },
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              border: Border.all(
                color: light_grey_tint_1,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(
                  FontAwesomeIcons.upload,
                  size: 50,
                  color: blue_tint_1,
                ),
                SizedBox(height: 20),
                Text(
                  "Select a CSV file to upload",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Bug: While importing an Excel file, it displays todays data.
  //      However, the expected date value should be as it set in the Excel file.
  // Why this Bug exist: [Ramzi]: because CSV file only uses one DateTime EmploeeForm,
  // meanwhile this '_dateOfBirth' TextField EmploeeForm is different
  // How it can be solved: [Ramzi]: using a EmploeeFormter here to convert the EmploeeForm taken
  // from CSV file to this TextField
  // When to work on: [Ramzi]: after Designing; to chose the best DateTime EmploeeForm.
  importCSV() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    String filePath = result.files.first.path!;
    final input = File(filePath).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
    // ignore: use_build_context_synchronously
    AuthService()
        .signUpUser(
      fields[1][1],
      "test1234",
      context,
    )
        .then(
      (userCredential) {
        AuthService().saveUserData(
          userCredential.user!,
          fields[1][0],
          fields[1][2].toString(),
          [],
          localUser.organization.name,
        );
        Navigator.pop(context);
      },
    );
  }
}
