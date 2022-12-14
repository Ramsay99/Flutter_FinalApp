import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(250, 255, 255, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(250, 255, 255, 255),
          title: Row(
            children: [
              CircleAvatar(
                radius: 22,
                child: FlutterLogo(),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Chats",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(93, 0, 0, 0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration:
                          new InputDecoration.collapsed(hintText: 'Search'),
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext, index) {
                  return Row(
                    children: [
                      Container(
                        width: 60,
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: FlutterLogo(),
                                ),
                                CircleAvatar(
                                  radius: 9,
                                  backgroundColor:
                                      Color.fromARGB(250, 255, 255, 255),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      bottom: 3, end: 2),
                                  child: CircleAvatar(
                                    radius: 7,
                                    backgroundColor: Colors.green,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Name ${index + 1}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 16,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: FlutterLogo(),
                              ),
                              CircleAvatar(
                                radius: 9,
                                backgroundColor:
                                    Color.fromARGB(250, 255, 255, 255),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    bottom: 3, end: 2),
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.green,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name ${index + 1}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "THE MESSAGE IS HERE ",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Time",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(thickness: 1),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
