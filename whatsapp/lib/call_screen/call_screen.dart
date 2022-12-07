import 'package:flutter/material.dart';
import 'package:whatsapp/chat_screen/models/callModel.dart';

class CallScreen extends StatelessWidget {
  CallScreen({super.key});

  List<CallDetails> calls = [
    CallDetails(
        image: "https://www.onthisday.com/images/people/elizabeth-ii.jpg",
        name: "shefi",
        updateAt: "october 23 8:30am",
        isIncoming: false,
        isVoice: true,
        isGroup: false),
    CallDetails(
        image:
            "https://www.siasat.com/wp-content/uploads/2022/11/samantha-1.jpg",
        name: "samantha",
        updateAt: "may 5 am",
        isIncoming: true,
        isVoice: false,
        isGroup: true),
    CallDetails(
        image: "",
        name: "sherin",
        updateAt: "june 25 11:30pm",
        isIncoming: false,
        isVoice: false,
        isGroup: true),
    CallDetails(
        image:
            "https://i.pinimg.com/736x/1c/42/db/1c42dbe4cfb44025ac69d041568cf2c5.jpg",
        name: "mehra",
        updateAt: "may 21 9:30am",
        isIncoming: null,
        isVoice: true,
        isGroup: false),
    CallDetails(
        image: "",
        name: "anu",
        updateAt: "october5 6pm",
        isIncoming: false,
        isVoice: true,
        isGroup: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        return ListTile(
          //onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => CallDetails(data: calls[index],)),),) ,
          leading: CircleAvatar(
            backgroundImage: (calls[index].image != "")
                ? NetworkImage(calls[index].image!)
                : NetworkImage((calls[index].isGroup!)
                    ? "https://cdn6.aptoide.com/imgs/1/2/2/1221bc0bdd2354b42b293317ff2adbcf_icon.png"
                    : "https://www.meme-arsenal.com/memes/b6a18f0ffd345b22cd219ef0e73ea5fe.jpg"),
          ),
          title: Text(calls[index].name!),
          subtitle: Row(
            children: [
              Icon(Icons.call_received),
              Text(calls[index].updateAt!),
            ],
          ),
          trailing: Icon(Icons.call),
        );
      },
    ));
  }
}
