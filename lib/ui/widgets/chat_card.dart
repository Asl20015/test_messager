import 'package:flutter/material.dart';
import 'package:test_messager/data/models/user.dart';
import 'package:test_messager/domain/di/get_it_service.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/widgets/user_card.dart';

class ChatCard extends StatelessWidget {
  final User user;

  const ChatCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => getItService.navigatorService.onChat(user: user),
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
              user: user,
              content: Text(
                'Сообщение',
                style: AppTextStyle.text3.copyWith(
                  color: AppColors.greyMedium,
                ),
              ),
            ),
            Text(
              'Вчера',
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
