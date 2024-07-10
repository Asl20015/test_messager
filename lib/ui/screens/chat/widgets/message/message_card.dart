import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_messager/data/models/message.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/icons.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/screens/chat/widgets/message/message_images_card.dart';
import 'package:test_messager/ui/utils/convert.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({
    super.key,
    required this.message,
  });

  BorderRadiusGeometry get borderForMyMessage => const BorderRadius.only(
        topLeft: Radius.circular(21),
        topRight: Radius.circular(21),
        bottomLeft: Radius.circular(21),
      );

  BorderRadiusGeometry get borderForUserMessage => const BorderRadius.only(
        topLeft: Radius.circular(21),
        topRight: Radius.circular(21),
        bottomRight: Radius.circular(21),
      );

  bool get isMy => message.userId == -1;

  bool get haveFiles => (message.files ?? []).isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: isMy ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMy)
            Transform.flip(
              flipX: true,
              child: SvgPicture.asset(
                AppIcons.suffixMessage,
                colorFilter: const ColorFilter.mode(
                  AppColors.greyRaw,
                  BlendMode.srcIn,
                ),
              ),
            ),
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
            padding: EdgeInsets.only(
              top: !haveFiles ? 12 : 4,
              right: 4,
              left: 4,
              bottom: 12,
            ),
            decoration: BoxDecoration(
              borderRadius: isMy ? borderForMyMessage : borderForUserMessage,
              color: isMy ? AppColors.primary : AppColors.greyRaw,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (haveFiles) ...[
                  MessageImagesCard(files: message.files!),
                  const SizedBox(height: 8),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    alignment: WrapAlignment.end,
                    children: [
                      Text(
                        message.content,
                        style: AppTextStyle.text2.copyWith(
                          color: isMy ? AppColors.greenDark : AppColors.greyDark,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 15),
                          Text(
                            Convert.timeConvert(message.created),
                            style: AppTextStyle.text3.copyWith(
                              color: (isMy ? AppColors.greenDark : AppColors.greyDark)
                                  .withOpacity(0.8),
                            ),
                          ),
                          if (isMy) ...[
                            const SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: SvgPicture.asset(
                                message.isRead ? AppIcons.doubleCheck : AppIcons.check,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.greenDark,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isMy)
            SvgPicture.asset(
              AppIcons.suffixMessage,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
        ],
      ),
    );
  }
}
