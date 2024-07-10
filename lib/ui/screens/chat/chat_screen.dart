import 'package:flutter/material.dart';
import 'package:test_messager/data/models/user.dart';
import 'package:test_messager/ui/screens/chat/widgets/text_field_message.dart';
import 'package:test_messager/ui/widgets/user_card.dart';
import 'package:test_messager/ui/widgets/buttons/left_button.dart';

class ChatScreen extends StatelessWidget {
  final User user;

  const ChatScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeftButton(),
        titleSpacing: 10,
        elevation: 1,
        title: UserCard(user: user),
      ),
      body: ListView(
        reverse: true,
        children: [],
      ),
      bottomSheet: const TextFieldMessage(),
    );
  }
}
