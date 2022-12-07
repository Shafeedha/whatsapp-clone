// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/chat_screen/models/statusModel.dart';

class Status_screen extends StatelessWidget {
   Status_screen({super.key});

  List<StatusDetails> statuses = [

    StatusDetails(
      name: "sddd",
      image: "",
      updateAt: "today 2 pm",
      isStatus: true
    ),
    StatusDetails(
      name: "qqqqq",
      image: "",
      updateAt: "today 2 pm",
      isStatus: false
    ),
    StatusDetails(
      name: "eeeeee",
      image: "",
      updateAt: "today 2 pm",
      isStatus: true
    ),
    StatusDetails(
      name: "gggggg",
      image: "",
      updateAt: "today 2 pm",
      isStatus: false
    ),
    StatusDetails(
      name: "nnnnn",
      image: "",
      updateAt: "today 2 pm",
      isStatus: true
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
             ListTile(
      
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.amber,
                
              ),
              title: Text("My status"),
              subtitle: Text("Tap to add status update"),
            ),
             ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:statuses.length,
                itemBuilder: (context,index){
                  return  ListTile(
      
              leading: CircleAvatar(
                backgroundImage: NetworkImage(statuses[index].image!),
                
              ),
              title: Text(statuses[index].name!),
              subtitle: Text(statuses[index].updateAt!),
            );
                })
          ],
        ),
      ),
      
    );
  }


  
}