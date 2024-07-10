import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_messager/data/models/message.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/icons.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/screens/chat/widgets/message/message_images_card.dart';
import 'package:test_messager/ui/screens/chat/widgets/message/message_status.dart';

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

  bool get haveFiles => (message.files ?? []).isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: message.isMy ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!message.isMy)
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
              bottom: message.content != '' ? 12 : 4,
            ),
            decoration: BoxDecoration(
              borderRadius: message.isMy ? borderForMyMessage : borderForUserMessage,
              color: message.isMy ? AppColors.primary : AppColors.greyRaw,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (haveFiles) ...[
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      MessageImagesCard(
                        files: message.files!,
                        isContextEmpty: message.content.isEmpty,
                      ),
                      if (message.content.isEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: MessageStatus(
                            message: message,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                  if (message.content.isNotEmpty) const SizedBox(height: 8),
                ],
                if (message.content != '')
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      alignment: WrapAlignment.end,
                      children: [
                        Text(
                          message.content,
                          style: AppTextStyle.text2.copyWith(
                            color: message.isMy ? AppColors.greenDark : AppColors.greyDark,
                          ),
                        ),
                        MessageStatus(message: message),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          if (message.isMy)
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
