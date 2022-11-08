import 'dart:math';

import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ContextChatScreen extends StatefulWidget {
  const ContextChatScreen({super.key});

  @override
  State<ContextChatScreen> createState() => _ContextChatScreenState();
}

class _ContextChatScreenState extends State<ContextChatScreen> {
  List<Message> Messages = [
    Message(
        text: "TEST{ NOT ME }",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: false),
    Message(
        text: "TEST{ ME }",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 4)),
        isSentByMe: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chat"),
      ),
      body: Column(children: [
        Expanded(
            child: GroupedListView<Message, DateTime>(
          reverse: true,
          order: GroupedListOrder.DESC,
          useStickyGroupSeparators: true,
          floatingHeader: true,
          padding: const EdgeInsets.all(8),
          elements: Messages,
          groupBy: (element) =>
              DateTime(element.date.year, element.date.month, element.date.day),
          groupHeaderBuilder: (Message message) => SizedBox(
            height: 40,
            child: Center(
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  DateFormat.yMMMd().format(message.date),
                ),
              )),
            ),
          ),
          itemBuilder: (context, element) => Align(
            alignment: element.isSentByMe
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Card(
              elevation: 7,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(element.text),
              ),
            ),
          ),
        )),
        Container(
          color: Colors.grey,
          child: TextField(
              onSubmitted: (value) {
                final message = Message(
                    text: value, date: DateTime.now(), isSentByMe: true);
                setState(() {
                  Messages.add(message);
                });
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: "Type here ...")),
        )
      ]),
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message(
      {required this.text, required this.date, required this.isSentByMe});
}
