import 'package:chatgptapi/widget/constant/default.dart';
import 'package:chatgptapi/services/post_services.dart';
import 'package:chatgptapi/widget/chat_message.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

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
        title: const Text(
          Strings.appNmae,
          style: TextStyle(color: Default.textColor),
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
                color: Default.textColor,
              )),
          Padding(
            padding: Palet.inputPad,
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  style: const TextStyle(color: Default.textColor),
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
                          onPressed: () {
                            setState(() {
                              message.add(GptMessage(
                                  mesageText: textController.text,
                                  messagetype: MessageType.user));
                              loading = true;
                            });
                            String input = textController.text;
                            textController.clear();
                            Future.delayed(Palet.timeone)
                                .then((value) {
                              return touchDown();
                            });
                           PostServices().createResponse(input).then((value) {
                              setState(() {
                                loading = false;
                                message.add(GptMessage(
                                    mesageText: value,
                                    messagetype: MessageType.bot));
                              });
                            });
                            textController.clear();
                            Future.delayed(Palet.timeone)
                                .then((value) => touchDown());
                          },
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

  void touchDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
