import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_messager/domain/di/get_it_service.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/text.dart';

class FileContainer extends StatelessWidget {
  final File file;
  final Function() onDelete;

  const FileContainer({
    super.key,
    required this.file,
    required this.onDelete,
  });

  String get type => file.path.split('.').last.toLowerCase();

  bool get isImage => ['png', 'jpg', 'jpeg'].contains(type);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, right: 4),
          child: isImage ? _Image(file: file) : _File(file: file),
        ),
        GestureDetector(
          onTap: onDelete,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyRaw,
              border: Border.all(
                color: Colors.red,
              ),
            ),
            child: const Icon(
              Icons.clear,
              size: 10,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  final File file;

  const _Image({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => getItService.navigatorService.onImage(files: [file]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          file,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _File extends StatelessWidget {
  final File file;

  const _File({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.greyRaw,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          file.path.split('.').last.toUpperCase(),
          style: AppTextStyle.text1.copyWith(
            color: AppColors.greyMedium,
          ),
        ),
      ),
    );
  }
}
