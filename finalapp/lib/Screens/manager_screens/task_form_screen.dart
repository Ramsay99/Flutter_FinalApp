import 'package:finalapp/style/style_barrel.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskFormScreen extends StatefulWidget {
  const TaskFormScreen({Key? key}) : super(key: key);

  @override
  TaskForm createState() => TaskForm();
}

class TaskForm extends State<TaskFormScreen> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? phoneNumberController;
  TextEditingController? datePickerBController;
  TextEditingController? addressController;
  TextEditingController? notesController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List cities;
  late List<bool> citiesValues;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    datePickerBController = TextEditingController();
    addressController = TextEditingController();
    notesController = TextEditingController();
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
    phoneNumberController?.dispose();
    datePickerBController?.dispose();
    addressController?.dispose();
    notesController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Schedule Task",
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
        child: SingleChildScrollView(
          child: Form(
            child: Center(
              child: Column(
                children: [
                  DatePickerWidget(
                    hint: DateTime.now().toString(),
                    title: "Select Date",
                    controller: datePickerBController!,
                  ),
                  DefaultFormField(
                    title: "Customer Name",
                    hint: "Full Name",
                    controller: nameController!,
                  ),
                  DefaultFormField(
                    title: "Address",
                    hint: "Street",
                    controller: addressController!,
                  ),
                  DefaultFormField(
                    title: "Notes",
                    hint: "Notes",
                    controller: notesController!,
                    lines: 8,
                  ),
                  DefaultFormField(
                    title: "Phone",
                    hint: "Phone",
                    controller: phoneNumberController!,
                  ),
                  //! ADD DROP DOWN MENUS FOR PRODUCT / DRIVER / AREA. !
                  DefaultButton(
                    label: "Add Task",
                    onTap: () {
                      OrganizationService().savaTaskData(
                        nameController!.text,
                        addressController!.text,
                        notesController!.text,
                        phoneNumberController!.text,
                        "123 E ID", //? DROP DOWN WIP
                        "123 P ID", //? DROP DOWN WIP
                        datePickerBController!.text,
                        "test city", //? DROP DOWN WIP
                        ["0.000000","0.000000"]
                      );
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
