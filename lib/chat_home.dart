import 'package:chatgptapi/default.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  late bool loading;
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<GptMessage> message = [];

  @override
  void initState() {
    loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.appNmae,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Default.backgrounColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: message.length,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return ChatMessage(
                    messagetext: message[index].mesageText,
                    messageType: message[index].messagetype,
                  );
                }),
          ),
          Visibility(
              visible: loading,
              child: const CircularProgressIndicator(
                color: Colors.white,
              )),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: textController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Default.inputColor,
                    focusedBorder: InputBorder.none,
                  ),
                )),
                Visibility(
                    visible: !loading,
                    child: Container(
                      color: Default.inputColor,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send,
                            color: Default.buttonColor,
                          )),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String messagetext;
  final MessageType messageType;

  const ChatMessage(
      {super.key, required this.messagetext, required this.messageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.all(15),
      color: messageType == MessageType.bot
          ? Default.inputColor
          : Default.backgrounColor,
      child: Row(
        children: [
          messageType == MessageType.bot
              ? Container(
                  margin: EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    child: Image.asset("images/chat.png"),
                  ),
                )
              : Container(
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Text(
                  messagetext,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
