import 'package:flutter/material.dart';
import 'package:whatsapp/chat_screen/chatDetail_screen.dart';
import 'package:whatsapp/chat_screen/models/chat_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  List<UserDetails> users = [
    UserDetails(
      image: "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcRiULU6xp8Ls7qSNmipLUuaC9BMdy_8j_vvz6KfXTpoaRusojsRb0x2hBNdmeZrCwPzuNflBFvgz1a2yrk",
      name: "CR7",
      message: "hii",
      updatedlast: '9am',
      isGroup: false,
    ),
    UserDetails(
      image: "",
      name: "virad",
      message: "hloo",
      updatedlast: '10:30am',
      isGroup: true,
    ),
    UserDetails(
      image: "https://blog.playo.co/wp-content/uploads/2017/08/mary-kom-boxing.jpg",
      name: "marycom",
      message: "aey",
      updatedlast: '8:35am',
      isGroup: false
    ),
    UserDetails(
      image: "",
      name: "sindu",
      message: "haa",
      updatedlast: '10pm',
      isGroup: false,
    ),
    UserDetails(
      image: "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQTBIkxproxJHBsj2ZOkeFr3CYyVJjrfW8qcovw9whTrkRjsqYnBRlprpmyAknfOsug43oiT9iqS9cJe6s",
      name: "messi",
      message: "haaaai",
      updatedlast: '4:30pm',
      isGroup: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return  ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => ChatDetails(data: users[index],)),),) ,
            leading: CircleAvatar(
              backgroundImage:
              (users[index].image!="")?
               NetworkImage(users[index].image!):
               
               NetworkImage( (users[index].isGroup!)?"https://cdn6.aptoide.com/imgs/1/2/2/1221bc0bdd2354b42b293317ff2adbcf_icon.png":
               "https://www.meme-arsenal.com/memes/b6a18f0ffd345b22cd219ef0e73ea5fe.jpg"),
            ),
            title: Text(users[index].name!),
            subtitle: Text(users[index].message!),
            trailing: Text(users[index].updatedlast!));
      },
    )
    );
  }
}
