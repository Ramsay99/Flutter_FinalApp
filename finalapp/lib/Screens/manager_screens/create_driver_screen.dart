// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/utility/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';

class CreateDriverScreen extends StatefulWidget {
  const CreateDriverScreen({Key? key}) : super(key: key);

  @override
  Format createState() => Format();
}

class Format extends State<CreateDriverScreen> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passController;
  TextEditingController? phoneNumController;
  TextEditingController? dOBController;
  TextEditingController? addressController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List cities;
  late List<bool> citiesValues;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    phoneNumController = TextEditingController();
    dOBController = TextEditingController();
    addressController = TextEditingController();
    cities = ["Amman", "Salt", "Aqaba"];
    citiesValues = [];
    for (var i = 0; i < cities.length; i++) {
      citiesValues.add(false);
    }
  }

  @override
  void dispose() {
    nameController?.dispose();
    emailController?.dispose();
    passController?.dispose();
    phoneNumController?.dispose();
    dOBController?.dispose();
    addressController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //- #region Import file buttons.
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreenAccent[400],
                          foregroundColor: Colors.green.shade800),
                      onPressed: () {
                        print("One Person Started");
                        importCSV();
                        print("One Person Ended");
                      },
                      icon: Icon(Icons.person_add),
                      label: Text("One Driver"),
                    ),
                    Stack(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreenAccent[400],
                              foregroundColor: Colors.green.shade800),
                          icon: Icon(Icons.people),
                          label: Text(
                            "Many Drivers",
                          ),
                          // Disabled Button, can be used as an example to
                          // buy the premium product to unlock this feature.
                          onPressed: null,
                        ),
                        Icon(
                          Icons.lock,
                          color: Colors.amber,
                          shadows: [Shadow(color: Colors.black)],
                          size: 25,
                        ),
                      ],
                    ),
                    // #endregion
                  ],
                ),
                DefaultFormField(
                  textHint: "Name",
                  controller: nameController!,
                ),
                DefaultFormField(
                  textHint: "E-mail",
                  controller: emailController!,
                ),
                DefaultFormField(
                  textHint: "Password",
                  controller: passController!,
                ),
                DefaultFormField(
                  textHint: "Phone",
                  controller: phoneNumController!,
                ),
                DefaultFormField(
                  textHint: "Address",
                  controller: addressController!,
                ),
                _dateOfBirth(),
                _cities(),
                DefaultButton(
                  label: "Sign-up",
                  onTap: () {
                    AuthService()
                        .signUpUser(
                      emailController!.text,
                      passController!.text,
                    )
                        .then(
                      (userCredential) {
                        AuthService().saveUserData(
                          userCredential.user!,
                          nameController!.text,
                          phoneNumController!.text,
                          true,
                          true,
                          [
                            Timestamp.now(),
                            Timestamp.now(),
                          ],
                          [
                            "amman",
                            "irbid",
                          ],
                          [
                            "test",
                            "test2",
                          ],
                          "org1",
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _cities() {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
        child: SizedBox(
          height: 130,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(cities[index]),
                value: citiesValues[index],
                onChanged: (value) {
                  setState(() {
                    citiesValues[index] = value!;
                  });
                },
              );
            },
          ),
        ));
  }

  Padding _dateOfBirth() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: DateTimePicker(
        controller: dOBController,
        // initialValue: _initVal.text,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        dateLabelText: 'Date',
        onSaved: (val) {
          dOBController!.text = val!;
        },
      ),
    );
  }

  // Bug: While importing an Excel file, it displays todays data.
  //      However, the expected date value should be as it set in the Excel file.
  // Why this Bug exist: [Ramzi]: because CSV file only uses one DateTime format,
  // meanwhile this '_dateOfBirth' TextField format is different
  // How it can be solved: [Ramzi]: using a formatter here to convert the format taken
  // from CSV file to this TextField
  // When to work on: [Ramzi]: after Designing; to chose the best DateTime format.
  importCSV() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    String filePath = result.files.first.path!;
    print(filePath);
    final input = File(filePath).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
    print(fields);
    setState(() {
      nameController!.text = fields[1][0];
      emailController!.text = fields[1][1];
      passController!.text = "PassWord Rand/Def";
      phoneNumController!.text = fields[1][2].toString();
      dOBController!.text = fields[1][3].toString();
      addressController!.text = fields[1][4];
      // checkboxesControler = check where fields[1][].contains checkboxList // sm like that
    });
  }
}
