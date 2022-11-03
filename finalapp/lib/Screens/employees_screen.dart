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
              // ToDo : Make new folder called tabs and add class for each tab (Cleaner).
              Container(
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30, backgroundColor: Colors.blueAccent),
                      title: Text('Add Driver '),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 70,
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.blueAccent),
                              title: Text('Person ${index + 1} '),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                              thickness: 1,
                            )),
                  ),
                ],
              )),
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
