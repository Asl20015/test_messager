import 'package:flutter/material.dart';
import 'package:test_messager/data/models/message.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/screens/chat/widgets/message/message_card.dart';
import 'package:test_messager/ui/utils/convert.dart';

class MessageGroupCard extends StatelessWidget {
  final List<Message> messages;

  const MessageGroupCard({
    super.key,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    String date = '';
    return Column(
      children: messages.reversed.map((message) {
        if (date == Convert.dateConvert(message.created)) {
          return MessageCard(message: message);
        } else {
          date = Convert.dateConvert(message.created);
          return Column(
            children: [
              _Date(date: date),
              MessageCard(message: message),
            ],
          );
        }
      }).toList(),
    );
  }
}

class _Date extends StatelessWidget {
  final String date;

  const _Date({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 6),
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              color: AppColors.greyLight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            date,
            style: AppTextStyle.text2.copyWith(
              color: AppColors.greyLight,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              color: AppColors.greyLight,
            ),
          ),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}
