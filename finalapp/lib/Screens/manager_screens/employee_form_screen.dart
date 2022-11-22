// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/utility/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmployeeFormScreen extends StatefulWidget {
  const EmployeeFormScreen({Key? key}) : super(key: key);

  @override
  EmployeeForm createState() => EmployeeForm();
}

class EmployeeForm extends State<EmployeeFormScreen> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? phoneNumberController;
  TextEditingController? datePickerBController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List<String> cities;
  late List<bool> citiesValues;
  late List<String> selectedCities;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
    datePickerBController = TextEditingController();
    cities = [
      "Amman",
      "Salt",
      "Aqaba",
      "Irbid",
      "Zarqa",
      "Jarash",
      "Madaba",
      "Salt",
      "Kerak",
      "Ajlun",
      "Mafraq",
      "Tafela"
    ];
    selectedCities = [];
    citiesValues = [];
    for (var i = 0; i < cities.length; i++) {
      citiesValues.add(false);
    }
  }

  @override
  void dispose() {
    nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    phoneNumberController?.dispose();
    datePickerBController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Register Employee",
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
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Form(
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     //- #region Import file buttons.
                        //     ElevatedButton.icon(
                        //       style: ElevatedButton.styleFrom(
                        //           backgroundColor: Colors.lightGreenAccent[400],
                        //           foregroundColor: Colors.green.shade800),
                        //       onPressed: () {
                        //         print("One Person Started");
                        //         importCSV();
                        //         print("One Person Ended");
                        //       },
                        //       icon: Icon(Icons.person_add),
                        //       label: Text("One Driver"),
                        //     ),
                        //     Stack(
                        //       children: [
                        //         ElevatedButton.icon(
                        //           style: ElevatedButton.styleFrom(
                        //               backgroundColor: Colors.lightGreenAccent[400],
                        //               foregroundColor: Colors.green.shade800),
                        //           icon: Icon(Icons.people),
                        //           label: Text(
                        //             "Many Drivers",
                        //           ),
                        //           // Disabled Button, can be used as an example to
                        //           // buy the premium product to unlock this feature.
                        //           onPressed: null,
                        //         ),
                        //         Icon(
                        //           Icons.lock,
                        //           color: Colors.amber,
                        //           shadows: [Shadow(color: Colors.black)],
                        //           size: 25,
                        //         ),
                        //       ],
                        //     ),
                        //     // #endregion
                        //   ],
                        // ),
                        Column(
                          children: [
                            DefaultFormField(
                              title: "Name",
                              hint: "Full Name",
                              controller: nameController!,
                            ),
                            DefaultFormField(
                              title: "E-mail",
                              hint: "@email.com",
                              controller: emailController!,
                            ),
                            DefaultFormField(
                              title: "Password",
                              hint: "Password",
                              controller: passwordController!,
                            ),
                            DefaultFormField(
                              title: "Phone",
                              hint: "+962",
                              controller: phoneNumberController!,
                            ),
                            Wrap(children: [_cities()]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DefaultButton(
              label: "Register",
              onTap: () {
                AuthService()
                    .signUpUser(
                  emailController!.text,
                  passwordController!.text,
                  context,
                )
                    .then(
                  (userCredential) {
                    AuthService().saveUserData(
                      userCredential.user!,
                      nameController!.text,
                      phoneNumberController!.text,
                      selectedCities,
                      localUser.organization.name,
                    );
                    Navigator.pop(context);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _cities() {
    return SizedBox(
      width: 325,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            activeColor: blue_tint_1,
            title: Text(cities[index]),
            value: citiesValues[index],
            onChanged: (value) {
              setState(
                () {
                  value == true
                      ? selectedCities.add(cities[index])
                      : selectedCities.remove(cities[index]);
                  citiesValues[index] = value!;
                },
              );
            },
          );
        },
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
    setState(
      () {
        nameController!.text = fields[1][0];
        emailController!.text = fields[1][1];
        passwordController!.text = "PassWord Rand/Def";
        phoneNumberController!.text = fields[1][2].toString();
        datePickerBController!.text = fields[1][3].toString();
        // checkboxesControler = check where fields[1][].contains checkboxList // sm like that
      },
    );
  }
}
