import 'package:chatgptapi/default.dart';
import 'package:flutter/material.dart';


class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Chat GPT',style:TextStyle(color: Colors.white),),
        backgroundColor: Default.backgrounColor,
      ),

      body: Column(
        children: [

        ],
      ),

    );
  }
}
