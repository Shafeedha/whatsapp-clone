import 'package:flutter/material.dart';
import 'package:whatsapp/call_screen/call_screen.dart';
import 'package:whatsapp/camera_screen/camera_page.dart';
import 'package:whatsapp/chat_screen/chat_screen.dart';
import 'package:whatsapp/status_screen/status_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length:4,
      child: Scaffold(
        appBar: AppBar(
          title: const 
          Text('whatsApp'),
          actions: [
            const Icon(Icons.search),
            PopupMenuButton(itemBuilder: (context) {
              return [
    
                  const PopupMenuItem(child: Text('New group')),
                  const PopupMenuItem(child: Text('New Broadcast')),
                  const PopupMenuItem(child: Text('Linked Device')),
                  const PopupMenuItem(child: Text('Starred Messages')),
                  const PopupMenuItem(child: Text('Settings'))
              ];
            },)
          ],
          bottom:const TabBar(tabs: [
            Icon(Icons.camera_alt),
            Text('CHATS'),
            Text('STATUS'),
            Text('CALLS')
          ]) ,
        ) ,
        body:  TabBarView(
          children: [
           CameraScreen(),
            ChatScreen(),
            Status_screen(),
            CallScreen()
        ]),
      ),
    );
  }
}