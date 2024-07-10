import 'package:flutter/material.dart';
import 'package:test_messager/data/models/chat.dart';
import 'package:test_messager/domain/di/get_it_service.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/utils/convert.dart';
import 'package:test_messager/ui/widgets/user_card.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;

  const ChatCard({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => getItService.navigatorService.onChat(user: chat.user),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: AppColors.greyRaw,
              width: 1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserCard(
              user: chat.user,
              content: Row(
                children: [
                  if (chat.lastMessage == null)
                    const Icon(
                      Icons.add,
                      size: 16,
                      color: AppColors.primary,
                    )
                  else if (chat.lastMessage!.isMy) ...[
                    const Text(
                      'Вы:',
                      style: AppTextStyle.text3,
                    ),
                    const SizedBox(width: 4),
                  ],
                  Text(
                    chat.lastMessage == null
                        ? 'Новый чат'
                        : chat.lastMessage!.content == ''
                            ? 'Изображение${(chat.lastMessage!.files ?? []).length > 1 ? ' (${(chat.lastMessage!.files ?? []).length})' : ''}'
                            : chat.lastMessage!.content,
                    style: AppTextStyle.text3.copyWith(
                      color: AppColors.greyMedium,
                    ),
                  ),
                ],
              ),
            ),
            if (chat.lastMessage != null)
              Text(
                Convert.dateConvert(chat.lastMessage!.created),
                style: AppTextStyle.text3.copyWith(
                  color: AppColors.greyMedium,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
