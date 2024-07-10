import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_messager/data/models/message.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/icons.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/utils/convert.dart';

class MessageStatus extends StatelessWidget {
  final Message message;
  final Color? color;

  const MessageStatus({
    super.key,
    required this.message,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 15),
        Text(
          Convert.timeConvert(message.created),
          style: AppTextStyle.text3.copyWith(
            color:
                color ?? (message.isMy ? AppColors.greenDark : AppColors.greyDark).withOpacity(0.8),
          ),
        ),
        if (message.isMy) ...[
          const SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              message.isRead ? AppIcons.doubleCheck : AppIcons.check,
              colorFilter: ColorFilter.mode(
                color ?? AppColors.greenDark,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
