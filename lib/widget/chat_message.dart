import 'package:flutter/material.dart';

import 'constant/default.dart';
import '../model/model.dart';

class ChatMessage extends StatelessWidget {
  final String messagetext;
  final MessageType messageType;

  const ChatMessage(
      {super.key, required this.messagetext, required this.messageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Palet.pagePad,
      margin: Palet.pagePad,
      color: messageType == MessageType.bot
          ? Default.inputColor
          : Default.backgrounColor,
      child: Row(
        children: [
          messageType == MessageType.bot
              ? CircleAvatar(
                child: Image.asset(Strings.botImage),
              )
              : const CircleAvatar(
                  child: Icon(Icons.person),
                ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: Palet.pagePad,
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
