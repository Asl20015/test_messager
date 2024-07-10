import 'package:flutter/material.dart';
import 'package:test_messager/data/models/message_group.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/screens/chat/widgets/message/message_card.dart';
import 'package:test_messager/ui/utils/convert.dart';

class MessageGroupCard extends StatelessWidget {
  final MessageGroup messageGroup;

  const MessageGroupCard({
    super.key,
    required this.messageGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                Convert.dateConvert(DateTime(2024,7,7 )),
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
        ),
        for (var message in messageGroup.messages) MessageCard(message: message),
      ],
    );
  }
}
