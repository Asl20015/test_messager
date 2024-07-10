import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/widgets/buttons/left_button.dart';

class ImageScreen extends StatefulWidget {
  final List<File> files;
  final List<String> urls;

  const ImageScreen({
    super.key,
    required this.files,
    required this.urls,
  });

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final pageController = PageController();
  int page = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      if (pageController.page != null) {
        page = pageController.page!.toInt();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyDark,
      appBar: AppBar(
        backgroundColor: AppColors.greyDark,
        leading: const LeftButton(color: Colors.white),
        centerTitle: true,
        title: Text(
          '${page + 1}/${widget.files.isNotEmpty ? widget.files.length : widget.urls.length}',
          style: AppTextStyle.h2.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: [
          if (widget.files.isNotEmpty)
            for (var file in widget.files)
              InteractiveViewer(
                child: Center(
                  child: Image.file(file),
                ),
              )
          else
            for (var url in widget.urls)
              InteractiveViewer(
                child: Center(
                  child: Image.network(
                    url,
                    loadingBuilder: (_, __, ___) {
                      return const CircularProgressIndicator(color: Colors.white);
                    },
                    errorBuilder: (_, __, ___) {
                      return const Icon(
                        Icons.error,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              )
        ],
      ),
    );
  }
}
