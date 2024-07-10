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

  TextFieldChatController({required this.setState});

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
              setState();
            }
          },
          getFile: () async {
            final file = await _filesController.getFile();
            if (file != null) {
              files.add(file);
              setState();
            }
          },
        );
      },
    );
  }

  void deleteFile(int index) {
    files.removeAt(index);
    setState();
  }

  void switchButtonSend(_) {
    if (messageController.text.isEmpty && files.isEmpty && !isMicrophone) {
      isMicrophone = true;
      setState();
    }

    if (messageController.text.isNotEmpty && files.isNotEmpty && isMicrophone) {
      isMicrophone = false;
      setState();
    }
  }
}
