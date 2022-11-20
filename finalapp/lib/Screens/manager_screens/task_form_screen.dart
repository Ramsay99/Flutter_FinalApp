import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';

class TaskFormScreen extends StatefulWidget {
  const TaskFormScreen({Key? key}) : super(key: key);

  @override
  TaskForm createState() => TaskForm();
}

class TaskForm extends State<TaskFormScreen> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passController;
  TextEditingController? phoneNumberController;
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
    phoneNumberController = TextEditingController();
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
    phoneNumberController?.dispose();
    dOBController?.dispose();
    addressController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                DefaultFormField(
                  title: "Name",
                  hint: "Name",
                  controller: nameController!,
                ),
                DefaultFormField(
                  title: "Phone",
                  hint: "Phone",
                  controller: phoneNumberController!,
                ),
                DefaultFormField(
                  title: "Address",
                  hint: "Address",
                  controller: addressController!,
                ),
                _dateOfBirth(),
                _cities(),
                DefaultButton(
                  label: "Add Task",
                  onTap: () {
                    OrganizationService().savaTaskData(
                      nameController!.text,
                      addressController!.text,
                      "test note",
                      phoneNumberController!.text,
                      "123 E ID",
                      "123 P ID",
                      [
                        Timestamp.now(),
                        Timestamp.now(),
                      ],
                      "test city",
                      "test area",
                    );
                    Navigator.pop(context);
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
                setState(
                  () {
                    citiesValues[index] = value!;
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Padding _dateOfBirth() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
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
}
