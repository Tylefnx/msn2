import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msn2/messages/domain/message.dart';

@RoutePage()
class ChatPage extends HookConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = useState<List<Message>>([]);
    final controller = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with dummy'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages.value[index].message),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Mesajınızı yazın...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {}, // _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// void sendMessage() {
//       if (controller.text.isNotEmpty) {
//         messages.value = [...messages.value, controller.text];
//         controller.clear();
//       }
//     }
