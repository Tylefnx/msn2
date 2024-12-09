import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  final String username;
  const ChatPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $username'),
      ),
      body: const Center(
        child: Text('Mesajlaşma ekranı'),
      ),
    );
  }
}
