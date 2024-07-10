import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/icons.dart';
import 'package:test_messager/ui/resurses/text.dart';

class TextFieldMessage extends StatefulWidget {
  const TextFieldMessage({super.key});

  @override
  State<TextFieldMessage> createState() => _TextFieldMessageState();
}

class _TextFieldMessageState extends State<TextFieldMessage> {
  late File? file;
  final textController = TextEditingController();
  bool isMicrophone = true;

  @override
  void initState() {
    super.initState();
    file = null;
  }

  void _addFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(allowMultiple: false);
      if (result != null) setState(() => file = File(result.files.first.path!));
    } catch (_) {
      Future(
        () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container();
            //return const DialogOpenSettings();
          },
        ),
      );
    }
  }

  void _deleteFile() => setState(() => file = null);

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
        left: 20,
        right: 20,
        top: 14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _addFile,
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
                    controller: textController,
                    textInputAction: TextInputAction.go,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.multiline,
                    onChanged: (_) {
                      if (textController.text.isEmpty && file == null && !isMicrophone) {
                        isMicrophone = true;
                        setState(() {});
                      }

                      if (textController.text.isNotEmpty && file != null && isMicrophone) {
                        isMicrophone = false;
                        setState(() {});
                      }
                    },
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
                    isMicrophone ? AppIcons.microphone : AppIcons.send,
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
        ],
      ),
    );
  }
}
