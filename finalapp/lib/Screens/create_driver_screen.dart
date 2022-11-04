// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class CreateDriverScreen extends StatefulWidget {
  const CreateDriverScreen({Key? key}) : super(key: key);

  @override
  _CreateDriverScreenState createState() => _CreateDriverScreenState();
}

class _CreateDriverScreenState extends State<CreateDriverScreen> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List cities;
  late List<bool> citiesValues;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
    cities = ["Amman", "Salt", "Aqaba"];
    citiesValues = [];
    for (var i = 0; i < cities.length; i++) {
      citiesValues.add(false);
    }
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
    textController6?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        // backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        // automaticallyImplyLeading: false,
        title: const Text(
          'Create Driver',
          // style: FlutterFlowTheme.of(context).title2.override(
          //       fontFamily: 'Poppins',
          //       color: Colors.white,
          //       fontSize: 22,
          //     ),
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
                    "Create New Driver either by Importing data from Excel file or Enter the new Driver data below"),
                Column(
                  children: [
                    Image(
                        image: NetworkImage(
                            "https://cdn.windowsreport.com/wp-content/uploads/2021/01/microsoft-excel.png")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreenAccent[400],
                              foregroundColor: Colors.green.shade800),
                          onPressed: () {},
                          icon: Icon(Icons.person_add),
                          label: Text("One Driver"),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreenAccent[400],
                              foregroundColor: Colors.green.shade800),
                          onPressed: () {},
                          icon: Icon(Icons.people),
                          label: Text(
                            "Many Drivers",
                          ),
                        ),
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
        controller: textController6,
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
          suffixIcon: textController6!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    textController6?.clear();
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
        controller: textController5,
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
          suffixIcon: textController5!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    textController5?.clear();
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
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: DateTimePicker(
        initialValue: '',
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        dateLabelText: 'Date Of Birth',
        onChanged: (val) => print(val),
        validator: (val) {
          print(val);
          return null;
        },
        onSaved: (val) => print(val),
      ),
    );
  }

  Padding _PhoneNumber() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: TextFormField(
        controller: textController3,
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
          suffixIcon: textController3!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    textController3?.clear();
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
        controller: textController2,
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
          suffixIcon: textController2!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    textController2?.clear();
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
        controller: textController1,
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
          suffixIcon: textController1!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    textController1?.clear();
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
}
