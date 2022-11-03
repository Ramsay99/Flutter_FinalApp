import 'package:flutter/material.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EState();
}

class _EState extends State<EmployeesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(color: Colors.black),
              tabs: [
                Tab(
                  text: "Employees",
                ),
                Tab(
                  text: "Label",
                ),
                Tab(
                  text: "Label",
                ),
              ]),
          Expanded(
            child: TabBarView(children: [
              Container(
                child: Column(children: [Text("data")]),
              ),
              Container(
                child: Column(children: [Text("data")]),
              ),
              Container(
                child: Column(children: [Text("data")]),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
