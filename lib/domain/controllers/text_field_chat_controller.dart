import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_messager/domain/di/get_it_service.dart';
import 'package:test_messager/ui/widgets/modals/get_image_modal.dart';
import 'package:test_messager/ui/widgets/modals/open_settings_modal.dart';

class TextFieldChatController {
  final List<File> files = [];
  final messageController = TextEditingController();
  bool isMicrophone = true;
  final Function() setState;
  final _picker = ImagePicker();

  TextFieldChatController({required this.setState});

  Future<void> getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        files.add(File(pickedFile.path));
        setState();
      }
    } catch (_) {
      if (getItService.navigatorService.navigatorKey.currentContext != null) {
        Future(
          () => showDialog(
            context: getItService.navigatorService.navigatorKey.currentContext!,
            builder: (BuildContext context) => const OpenSettingsModal(),
          ),
        );
      }
    }
  }

  void getFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(allowMultiple: false);
      if (result != null) {
        files.add(File(result.files.first.path!));
        setState();
      }
    } catch (_) {
      if (getItService.navigatorService.navigatorKey.currentContext != null) {
        Future(
          () => showDialog(
            context: getItService.navigatorService.navigatorKey.currentContext!,
            builder: (BuildContext context) => const OpenSettingsModal(),
          ),
        );
      }
    }
  }

  void addFile() {
    if (getItService.navigatorService.navigatorKey.currentContext == null) return;
    showModalBottomSheet(
      isDismissible: true,
      context: getItService.navigatorService.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return GetImageModal(
          getImage: getImage,
          getFile: getFile,
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
