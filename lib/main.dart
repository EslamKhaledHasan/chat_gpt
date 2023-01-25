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
  late bool isLoading;
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.chat)],
        toolbarHeight: 60,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "AI Chat",
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: botBackgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildList(),
            ),
            Visibility(
              visible: isLoading,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  //textfield
                  _buildInput(),
                  //button
                  _buildSubmit(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Expanded _buildInput() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Colors.white),
        controller: _textController,
        decoration: const InputDecoration(
          fillColor: botBackgroundColor,
          filled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }    
  
  
  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        //icon
        child: IconButton(
          icon: const Icon(
            Icons.send_rounded,
            color: Color.fromARGB(255, 207, 207, 207),
          ),
          onPressed: () async {},
                  ),
                )
                
              
      );
  }
 

  

       ListView _buildList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        var message = _messages[index];
        return ChatMessageWidget(
          text: message.text,
          chatMessageType: message.chatMessageType,
        );
      },
    );
  }   
  }
   
        
