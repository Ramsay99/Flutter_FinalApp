import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:finalapp/Screens/global_screens/chat/chat_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class People extends StatefulWidget {
  const People({super.key});

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  var currentUser = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .where("uid", isNotEqualTo: currentUser)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Something went wrong"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text("Loading"),
          );
        }

        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text("People"),
              ),
              SliverList(
                  delegate: SliverChildListDelegate(
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic>? data =
                    document.data()! as Map<String, dynamic>?;
                return CupertinoListTile(
                  onTap: () => callChatScreen(data["name"], data["uid"]),
                  title: Text(
                    data!["name"],
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList()))
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  callChatScreen(String name, String uid) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: ((context) =>
                ChatDetail(friendUid: uid, friendName: name))));
  }
}
