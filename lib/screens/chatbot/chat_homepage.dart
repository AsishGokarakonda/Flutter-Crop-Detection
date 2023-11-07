
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({Key? key}) : super(key: key);

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  // call a function to get the token from the .env file
  getEnv() async {
    await dotenv.load();
  print(dotenv.env['OPENAI_CHATBOT']);
  }

  final _openAI = OpenAI.instance.build(token: '', baseOption: HttpSetup(receiveTimeout: const Duration(
      seconds: 60
  )),
  enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'asish',
    lastName: 'kumar',
  );

  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: 'GPT',
    lastName: 'Bot',
  );

  final List<ChatMessage> _messages = <ChatMessage>[];
  List <ChatUser> _typingUsers = <ChatUser>[];


  Future<void> onSend(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });
    List <Messages> _messagesHistory = _messages.reversed.map((m){
      if (m.user == _currentUser){
        return Messages(role: Role.user, content: m.text);
      }
      else{
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();
    final request = ChatCompleteText(model: GptTurbo0301ChatModel(), messages: _messagesHistory,);
    // getEnv();
    print('his;dkjf;l');
    final response = await _openAI.onChatCompletion(request: request);

    for (var ele in response!.choices ) {
      print('object');
      if (ele.message != null){
        setState(() {
          _messages.insert(0, 
          ChatMessage(user: _gptChatUser, createdAt: DateTime.now(), text: ele.message!.content),
          );
        });
      }
    }
    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // remove the back button
        centerTitle: true,
        toolbarHeight: 70 ,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(0, 160, 120, 1) ,
        title: const Text('Chatbot',style: TextStyle(color: Colors.white),),
      ),
      body: DashChat(currentUser: _currentUser, onSend: (ChatMessage m){
          onSend(m);
        }, messages: _messages,
        typingUsers: _typingUsers,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Colors.blue,
          containerColor: Color.fromRGBO(0, 160, 120, 1),
          textColor: Colors.white
        ) ,
        )
    );
  }
}
