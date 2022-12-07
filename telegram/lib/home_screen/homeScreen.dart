import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length:4,
      child: Scaffold(
        appBar: AppBar(
          leading:
          PopupMenuButton(itemBuilder: (context) {
              return [
    
                  const PopupMenuItem(child: Text('Null'))
              ];
          },
          ),
          title: const
          Text('Telegram'),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            const Icon(Icons.search)
          ]
        
      ),
      body:  Text( "shafeedha",style: TextStyle(
          color: Colors.green,
          fontSize: 20),
      )),

    );
  }
}