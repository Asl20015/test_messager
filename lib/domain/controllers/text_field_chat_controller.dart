import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_messager/domain/controllers/files_controller.dart';
import 'package:test_messager/domain/di/get_it_service.dart';
import 'package:test_messager/ui/widgets/modals/get_image_modal.dart';

class TextFieldChatController {
  final List<File> files = [];
  final messageController = TextEditingController();
  bool isMicrophone = true;
  final Function() setState;
  final _filesController = FilesController();
  final int userId;

  TextFieldChatController({
    required this.setState,
    required this.userId,
  });

  void addFile() {
    if (getItService.navigatorService.navigatorKey.currentContext == null) return;
    showModalBottomSheet(
      isDismissible: true,
      context: getItService.navigatorService.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return GetImageModal(
          getImage: (source) async {
            final file = await _filesController.getImage(source);
            if (file != null) {
              files.add(file);
              switchButtonSend('');
              setState();
            }
          },
          getFile: () async {
            final file = await _filesController.getFile();
            if (file != null) {
              files.add(file);
              switchButtonSend('');
              setState();
            }
          },
        );
      },
    );
  }

  void deleteFile(int index) {
    files.removeAt(index);
    switchButtonSend('');
    setState();
  }

  void switchButtonSend(_) {
    if (messageController.text.isEmpty && files.isEmpty && !isMicrophone) {
      isMicrophone = true;
      setState();
    }

    if ((messageController.text.isNotEmpty || files.isNotEmpty) && isMicrophone) {
      isMicrophone = false;
      setState();
    }
  }

  void sendMessage() async {
    if (messageController.text == '' && files.isEmpty) return;
    await getItService.messageInteractors.createMessage(
      content: messageController.text,
      userId: userId,
      files: files.map((e) => e.path).toList(),
    );
    messageController.clear();
    files.clear();
    setState();
  }
}
