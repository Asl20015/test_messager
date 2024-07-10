import 'package:flutter/material.dart';
import 'package:test_messager/data/models/user.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/utils/convert.dart';

class UserCard extends StatelessWidget {
  final User user;
  final Widget? content;

  const UserCard({
    super.key,
    required this.user,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
            content ??
                Text(
                  Convert.onlineConvert(user.lastOnline),
                  style: AppTextStyle.text3.copyWith(
                    color: AppColors.greyMedium,
                  ),
                ),
          ],
        ),
      ],
    );
  }
}
