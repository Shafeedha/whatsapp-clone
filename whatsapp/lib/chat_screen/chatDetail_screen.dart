// ignore_for_file: prefer_const_constructors

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp/chat_screen/chatBubble.dart';
import 'package:whatsapp/chat_screen/models/chat_model.dart';
import 'package:whatsapp/chat_screen/models/messageModel.dart';

class ChatDetails extends StatefulWidget {
  ChatDetails({super.key, required this.data});
  UserDetails data;

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
TextEditingController messageController = TextEditingController();

  bool showSend = false;
  bool showImoji = true;

  List<Messages> messages = [
    Messages(isSend: true, isReaded: true, message: "haaaii", sendAt: "9:30am"),
    Messages(isSend: true, isReaded: false, message: "hii", sendAt: "11:30am"),
    Messages(isSend: false, isReaded: true, message: "aeyy", sendAt: "12pm"),
    Messages(isSend: false, isReaded: false, message: "haaaii", sendAt: "8pm"),
    Messages(isSend: true, isReaded: true, message: "hii", sendAt: "11:30am"),
    Messages(isSend: false, isReaded: true, message: "aeyy", sendAt: "12pm"),
    Messages(isSend: true, isReaded: false, message: "hii", sendAt: "11:30am"),
    Messages(isSend: false, isReaded: true, message: "aeyy", sendAt: "12pm"),
  ];

ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        titleSpacing: 5,
        leading: Row(
          children: [
            // ignore: prefer_const_constructors
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 3),
                child: Icon(Icons.arrow_back),
              ),
              onTap: () => Navigator.pop(context),
            ),
            CircleAvatar(
              backgroundImage: (widget.data.image != "")
                  ? NetworkImage(widget.data.image!)
                  : NetworkImage((widget.data.isGroup!)
                      ? "https://cdn6.aptoide.com/imgs/1/2/2/1221bc0bdd2354b42b293317ff2adbcf_icon.png"
                      : "https://www.meme-arsenal.com/memes/b6a18f0ffd345b22cd219ef0e73ea5fe.jpg"),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(widget.data.name!),
            Text(
              'online',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          Icon(Icons.video_call),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.call),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: Text((widget.data.isGroup!)
                        ? "Group info"
                        : "View contact")),
                PopupMenuItem(
                    child: Text((widget.data.isGroup!)
                        ? "Group media"
                        : "Media,links & docs")),
                PopupMenuItem(child: Text("Search")),
                PopupMenuItem(child: Text("Mute notifications")),
                PopupMenuItem(child: Text("Disappearing messages")),
                PopupMenuItem(child: Text("Wallpaper")),
                PopupMenuItem(child: Text("More")),
              ];
            },
          )
        ],
      ),
      body: Container(
        child: Stack(children: [
          Image.asset(
            "assets/images/bg.jpg",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          ListView.builder(
            controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  message: messages[index],
                );
              }),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                            controller: messageController,
                            onTap: () {
                              setState(() {
                                showImoji = true;
                              });
                            },
                            onChanged: (value) {
                              if (value.length > 0) {
                                setState(() {
                                  showSend = true;
                                });
                              } else {
                                setState(() {
                                  showSend = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "message",
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    if(showImoji){
                                      FocusScope.of(context).unfocus();
                                    }
                                    setState(() {
                                      showImoji = !showImoji;
                                    }
                                    
                                    );
                                  },
                                  icon: Icon((showImoji)
                                      ? Icons.emoji_emotions_outlined
                                      : Icons.keyboard),
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (builder) => menu(context),
                                          );
                                        },
                                        icon: Icon(Icons.attach_file)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(Icons.camera_alt),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: (() {
                          final time = DateFormat("hh:mm:ss a").format(DateTime.now());
                          print(time);
                          print(messageController.text);
                          setState(() {
                            messages.add(Messages(
                              isReaded: false,
                              isSend: true,
                              message: messageController.text,
                              sendAt: time
                            ));
                          }
                          );
                          messageController.clear();
                        }),
                        child: Icon((showSend) ? Icons.send : Icons.mic),
                      )
                    ],
                  ),
                  Offstage(offstage: showImoji,
                  child: SizedBox(
                    height: 250,
                    child: EmojiPicker(
                       textEditingController:messageController ,
                    ),
                  ),)
                ],
              )
              )
        ]),
      ),
    );
  }

  Container menu(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    text: "Document",
                    icon: Icon(Icons.insert_drive_file),
                    color: Colors.purple),
                iconWidget(
                    text: "Camera",
                    icon: Icon(Icons.camera),
                    color: Colors.red),
                iconWidget(
                    text: "Gallery",
                    icon: Icon(Icons.insert_photo),
                    color: Colors.deepPurple)
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: iconWidget(
                      text: "Audio",
                      icon: Icon(Icons.headset),
                      color: Colors.orange),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: iconWidget(
                      text: "Location",
                      icon: Icon(Icons.location_pin),
                      color: Colors.green),
                ),
                iconWidget(
                    text: "Contact",
                    icon: Icon(Icons.contact_phone),
                    color: Colors.blue)
              ],
            )
          ],
        ),
      ),
    );
  }

  Column iconWidget({String? text, Icon? icon, Color? color}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: icon,
          backgroundColor: color,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text!,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
