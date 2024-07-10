import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_messager/domain/controllers/text_field_chat_controller.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/icons.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/widgets/file_container.dart';

class TextFieldMessage extends StatefulWidget {
  const TextFieldMessage({super.key});

  @override
  State<TextFieldMessage> createState() => _TextFieldMessageState();
}

class _TextFieldMessageState extends State<TextFieldMessage> {
  late TextFieldChatController textFieldChatController;

  @override
  void initState() {
    super.initState();
    textFieldChatController = TextFieldChatController(
      setState: () => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.back,
        border: Border(
          top: BorderSide(
            color: AppColors.greyRaw,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.only(
        bottom: 16,
        top: 14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (textFieldChatController.files.isNotEmpty) ...[
            SizedBox(
              height: 52,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 20),
                  for (int i = 0; i < textFieldChatController.files.length; i++) ...[
                    FileContainer(
                      file: textFieldChatController.files[i],
                      onDelete: () => textFieldChatController.deleteFile(i),
                    ),
                    const SizedBox(width: 4),
                  ],
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: textFieldChatController.addFile,
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: AppColors.greyRaw,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.clip,
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        AppColors.greyDark,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: textFieldChatController.messageController,
                      textInputAction: TextInputAction.go,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.multiline,
                      onChanged: textFieldChatController.switchButtonSend,
                      maxLines: null,
                      style: AppTextStyle.h3,
                      decoration: InputDecoration(
                        hintText: 'Сообщение',
                        hintStyle: AppTextStyle.h3.copyWith(
                          color: AppColors.greyLight,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: AppColors.greyRaw,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      textFieldChatController.isMicrophone ? AppIcons.microphone : AppIcons.send,
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        AppColors.greyDark,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
