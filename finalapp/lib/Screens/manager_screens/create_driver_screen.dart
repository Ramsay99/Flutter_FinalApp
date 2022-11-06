// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_debounce/easy_debounce.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:csv/csv.dart';

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
      appBar: AppBar(
        title: const Text(
          'Create Driver',
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Create New Driver either by Importing data from Excel file or Enter the new Driver data below",
                ),
                Column(
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
                            a();
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
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 30,
                        thickness: 3,
                      ),
                    ),
                    Text("OR"),
                    Expanded(
                      child: Divider(
                        height: 30,
                        thickness: 3,
                      ),
                    ),
                  ],
                ),
                _Name(),
                _Email(),
                _Password(),
                _PhoneNumber(),
                _DateOfBirth(),
                _Address(),
                _Cities(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _Cities() {
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
  Padding _Address() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: TextFormField(
        controller: addressController,
        onChanged: (_) => EasyDebounce.debounce(
          'textController6',
          const Duration(milliseconds: 2000),
          () => setState(() {}),
        ),
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Address',
          hintText: 'Amman, City Center',
          // hintStyle: FlutterFlowTheme.of(context).bodyText2,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          suffixIcon: addressController!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    addressController?.clear();
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Color(0xFF757575),
                    size: 22,
                  ),
                )
              : null,
        ),
        // style: FlutterFlowTheme.of(context).bodyText1,
        keyboardType: TextInputType.streetAddress,
      ),
    );
  }
  Padding _Password() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: TextFormField(
        controller: passController,
        onChanged: (_) => EasyDebounce.debounce(
          'textController5',
          const Duration(milliseconds: 2000),
          () => setState(() {}),
        ),
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Set Emp Account Password',
          hintText: '********',
          // hintStyle: FlutterFlowTheme.of(context).bodyText2,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          suffixIcon: dOBController!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    dOBController?.clear();
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Color(0xFF757575),
                    size: 22,
                  ),
                )
              : null,
        ),
        // style: FlutterFlowTheme.of(context).bodyText1,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }
  Padding _DateOfBirth() {
    TextEditingController _initVal = TextEditingController();
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: DateTimePicker(
        controller: dOBController,
        // initialValue: _initVal.text,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        dateLabelText: 'Date Of Birth',
        onChanged: (val) => print(val),
        validator: (val) {
          print(val);
        },
        onSaved: (val) {
          dOBController!.text = val!;
          print(val);
        },
      ),
    );
  }
  Padding _PhoneNumber() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: TextFormField(
        controller: phoneNumController,
        onChanged: (_) => EasyDebounce.debounce(
          'textController3',
          const Duration(milliseconds: 2000),
          () => setState(() {}),
        ),
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          hintText: '07 1234 5678',
          // // hintStyle: FlutterFlowTheme.of(context).bodyText2,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          suffixIcon: passController!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    passController?.clear();
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Color(0xFF757575),
                    size: 22,
                  ),
                )
              : null,
        ),
        // style: FlutterFlowTheme.of(context).bodyText1,
        keyboardType: TextInputType.phone,
      ),
    );
  }
  Padding _Email() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: TextFormField(
        controller: emailController,
        onChanged: (_) => EasyDebounce.debounce(
          'textController2',
          const Duration(milliseconds: 2000),
          () => setState(() {}),
        ),
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Ahamd@gmail.com',
          // // hintStyle: FlutterFlowTheme.of(context).bodyText2,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          suffixIcon: emailController!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    emailController?.clear();
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Color(0xFF757575),
                    size: 22,
                  ),
                )
              : null,
        ),
        // // style: FlutterFlowTheme.of(context).bodyText1,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
  Padding _Name() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: TextFormField(
        controller: nameController,
        onChanged: (_) => EasyDebounce.debounce(
          'textController1',
          const Duration(milliseconds: 2000),
          () => setState(() {}),
        ),
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Name',
          hintText: 'Ahmad',
          // // hintStyle: FlutterFlowTheme.of(context).bodyText2,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          suffixIcon: nameController!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    nameController?.clear();
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Color(0xFF757575),
                    size: 22,
                  ),
                )
              : null,
        ),
        // // style: FlutterFlowTheme.of(context).bodyText1,
        keyboardType: TextInputType.name,
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
  a() async {
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
