import 'package:flutter/material.dart';

class DefaultDrawer extends StatefulWidget {
  const DefaultDrawer({super.key});

  @override
  State<DefaultDrawer> createState() => _DefaultDrawerState();
}

class _DefaultDrawerState extends State<DefaultDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 50,
              ),
              SizedBox(
                width: 12,
              ),
              Text("USER NAME HERE ")
            ],
          ),
        ),
        // TODO CLEANER CODE
        Container(
          padding: EdgeInsets.all(12),
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          child: ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Account Info'),
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          child: ListTile(
            leading: Icon(Icons.bug_report),
            title: Text('Report Issue'),
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          child: ListTile(
            leading: Icon(Icons.question_mark),
            title: Text('How To DO'),
          ),
        ),
        Container(
          color: Colors.red,
          padding: EdgeInsets.all(12),
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text('LOGOUT'),
          ),
        ),
      ],
    );
  }
}
