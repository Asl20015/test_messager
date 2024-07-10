import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/widgets/buttons/left_button.dart';

class ImageScreen extends StatelessWidget {
  final File file;

  const ImageScreen({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyDark,
      appBar: AppBar(
        backgroundColor: AppColors.greyDark,
        leading: const LeftButton(color: Colors.white),
        title: Text(
          'Назад',
          style: AppTextStyle.h2.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: InteractiveViewer(
        child: Center(
          child: Image.file(file),
        ),
      ),
    );
  }
}
