import 'dart:ui';

import 'package:flutter/material.dart';



@immutable
class Default {
  Default._();

  static const Color backgrounColor = Color(0xff444654);
  static const Color inputColor = Color(0xff343540);
  static const Color buttonColor = Color.fromRGBO(162, 107, 247, 0.9);
  static const Color textColor = Colors.white;
}




@immutable
class Strings {
  Strings._();

  static const String appNmae = 'Chat GPT';
  static const String botImage = "images/chat.png";
}




@immutable
class Palet {
  Palet._();

  static const Duration timeone = Duration(milliseconds: 60);
  static const EdgeInsets pagePad =EdgeInsets.all(10);
  static const EdgeInsets inputPad =EdgeInsets.all(20);

}
