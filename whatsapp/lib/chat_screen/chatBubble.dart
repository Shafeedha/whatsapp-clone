import 'package:flutter/material.dart';
import 'package:whatsapp/chat_screen/models/messageModel.dart';

class ChatBubble extends StatelessWidget {
   ChatBubble({
    Key? key, required this.message
  }) : super(key: key);

  Messages message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (message.isSend!)? Alignment.centerRight: Alignment.centerLeft,
      child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 150),
              child: Card(color: (message.isSend!)? Color(0xffdcf8c6): Colors.white,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 30,
                    top: 10,
                    bottom: 15,
                  ),
                  child: Text(message.message!),
                ),
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Row(
                    children: [
                      Text(message.sendAt!,style: TextStyle(fontSize: 10),),
                      (message.isSend!)?
                      Icon(Icons.done_all, size: 15,color: (message.isReaded!)? Colors.blue: Colors.grey,):
                      SizedBox(),
                    ],
                  )),
              ]),
              ),
              ),
    );
  }
}