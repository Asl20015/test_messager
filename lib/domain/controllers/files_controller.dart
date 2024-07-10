import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_messager/domain/di/get_it_service.dart';
import 'package:test_messager/ui/widgets/modals/open_settings_modal.dart';

class FilesController {
  final _picker = ImagePicker();

  void _showSettings() {
    if (getItService.navigatorService.navigatorKey.currentContext != null) {
      Future(
        () => showDialog(
          context: getItService.navigatorService.navigatorKey.currentContext!,
          builder: (BuildContext context) => const OpenSettingsModal(),
        ),
      );
    }
  }

  Future<File?> getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) return File(pickedFile.path);
      return null;
    } catch (_) {
      _showSettings();
      return null;
    }
  }

  Future<File?> getFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(allowMultiple: false);
      if (result != null) return File(result.files.first.path!);
      return null;
    } catch (_) {
      _showSettings();
      return null;
    }
  }
}
