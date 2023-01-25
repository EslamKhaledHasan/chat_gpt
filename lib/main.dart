import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
const backgroundColor = Color.fromARGB(255, 66, 68, 68);
const botBackgroundColor = Color.fromARGB(255, 4, 116, 124);

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override 
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
        )
        
        ,)
    )
  }
}
