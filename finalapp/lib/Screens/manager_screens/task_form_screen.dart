import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:finalapp/style/style_barrel.dart';

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
  TextEditingController? notesController;
  TextEditingController? cityController;
  TextEditingController? productController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List<String> cities;
  late List<String> products;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    datePickerBController = TextEditingController();
    notesController = TextEditingController();
    cityController = TextEditingController();
    productController = TextEditingController();
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
      "Tafela",
      "Maan"
    ];
    products = [];
  }

  @override
  void dispose() {
    nameController?.dispose();
    emailController?.dispose();
    phoneNumberController?.dispose();
    datePickerBController?.dispose();
    notesController?.dispose();
    cityController?.dispose();
    productController?.dispose();
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
              child: SingleChildScrollView(
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
                    Stack(
                      children: [
                        DefaultFormField(
                          title: "Address",
                          hint: "Street",
                          controller: mapPickerAddress,
                        ),
                        Positioned(
                          bottom: 12,
                          left: 255,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/mapPicker");
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.locationDot,
                              color: oxford_blue_tint_5,
                              size: 23,
                            ),
                          ),
                        ),
                      ],
                    ),
                    DefaultFormField(
                      title: "Notes",
                      hint: "Notes",
                      controller: notesController!,
                      lines: 8,
                    ),
                    DefaultFormField(
                      title: "Phone",
                      hint: "+962",
                      controller: phoneNumberController!,
                    ),
                    DropDownWidget(
                      items: cities,
                      title: "City",
                      hint: "City",
                      controller: cityController!,
                    ),
                    StreamBuilder(
                      stream: OrganizationService().getOrgProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState !=
                            ConnectionState.active) {
                          return const Center(child: LoadingIndicatorWidget());
                        } else {
                          for (int i = 0; i < snapshot.data.docs.length; i++) {
                            products.add(snapshot.data!.docs[i]['model']);
                          }
                          return DropDownWidget(
                            items: products,
                            title: "Product",
                            hint: "Product",
                            controller: productController!,
                          );
                        }
                      },
                    ),
                    DefaultButton(
                      label: "Add Task",
                      onTap: () {
                        OrganizationService().savaTaskData(
                          nameController!.text,
                          mapPickerAddress.text,
                          notesController!.text,
                          phoneNumberController!.text,
                          productController!.text,
                          datePickerBController!.text,
                          cityController!.text,
                          {"name": "", "phone": ""},
                          0,
                          [globalLat, globalLng],
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
