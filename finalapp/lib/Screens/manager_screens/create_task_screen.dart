import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  TaskForm createState() => TaskForm();
}

class TaskForm extends State<CreateTaskScreen> {
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
                  label: "Add Task",
                  onTap: () {
                    TaskService().savaTaskData(
                      nameController!.text,
                      phoneNumController!.text,
                      [
                        Timestamp.now(),
                        Timestamp.now(),
                      ],
                      "amman",
                      "test",
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
