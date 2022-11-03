import 'package:flutter/material.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  static BottomNavigationBarItem bottomNavBarItem =
      const BottomNavigationBarItem(
    icon: Icon(Icons.account_circle),
    label: 'Profile',
  );
  @override
  State<EmployeesScreen> createState() => _EState();
}

class _EState extends State<EmployeesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(children: [
          const TabBar(
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
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: const ListTile(
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
                              leading: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.blueAccent),
                              title: Text('Person ${index + 1} '),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                              thickness: 1,
                            )),
                  ),
                ],
              )),
              Container(
                child: Column(children: [const Text("data")]),
              ),
              Container(
                child: Column(children: [const Text("data")]),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
