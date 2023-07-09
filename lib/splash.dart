import 'package:flutter/material.dart';

import 'chat_home.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
        return const ChatHome();
      }));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('images/chat.png',fit: BoxFit.cover,),
      )),


    );
  }
}

