import 'package:flutter/material.dart';
import 'package:test_messager/data/models/user.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/text.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: user.colors ??
                        [
                          AppColors.primary,
                          AppColors.greenDark,
                        ],
                  ),
                ),
                child: Center(
                  child: Text(
                    user.lettersName,
                    style: AppTextStyle.h2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: AppTextStyle.text1,
                  ),
                  Text(
                    'Сообщение',
                    style: AppTextStyle.text3.copyWith(
                      color: AppColors.greyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Вчера',
            style: AppTextStyle.text3.copyWith(
              color: AppColors.greyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
