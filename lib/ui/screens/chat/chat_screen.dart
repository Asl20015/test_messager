import 'package:flutter/material.dart';
import 'package:test_messager/data/models/message.dart';
import 'package:test_messager/data/models/user.dart';
import 'package:test_messager/ui/screens/chat/widgets/message/message_card.dart';
import 'package:test_messager/ui/screens/chat/widgets/text_field_message.dart';
import 'package:test_messager/ui/widgets/user_card.dart';
import 'package:test_messager/ui/widgets/buttons/left_button.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  const ChatScreen({
    super.key,
    required this.user,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeftButton(),
        titleSpacing: 10,
        elevation: 1,
        title: UserCard(user: widget.user),
      ),
      body: ListView(
        reverse: true,
        padding: const EdgeInsets.only(
          bottom: 10,
          right: 10,
          left: 10,
        ),
        children: [
          MessageCard(
            message: Message(
              id: 1,
              isRead: true,
              content: 'lfer lr,elg ,rl,k,g ,rl,g lr,gllrflrgprlgplrglgr',
              created: DateTime.now(),
            ),
          ),
          MessageCard(
            message: Message(
              id: 1,
              userId: 2,
              isRead: true,
              files: ['ds', 'sd'],
              content: 'lfer lr,elg ,rl,k,g ,rl,g lr,gllrflrgprlgplrglgr',
              created: DateTime.now(),
            ),
          ),
          MessageCard(
            message: Message(
              id: 1,
              isRead: false,
              content: 'Привет',
              files: ['ds', 'd', 'd'],
              created: DateTime.now(),
            ),
          ),
          MessageCard(
            message: Message(
              id: 1,
              userId: 2,
              isRead: true,
              content: 'Привет',
              created: DateTime.now(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const TextFieldMessage(),
    );
  }
}
