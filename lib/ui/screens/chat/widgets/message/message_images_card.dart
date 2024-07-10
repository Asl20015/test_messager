import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_messager/domain/di/get_it_service.dart';
import 'package:test_messager/ui/resurses/text.dart';

class MessageImagesCard extends StatelessWidget {
  final List<String> files;

  const MessageImagesCard({
    super.key,
    required this.files,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => getItService.navigatorService.onImage(urls: files),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: files.length == 1
                    ? const BorderRadius.vertical(
                        top: Radius.circular(19),
                        bottom: Radius.circular(8),
                      )
                    : BorderRadius.only(
                        topLeft: const Radius.circular(19),
                        topRight: const Radius.circular(8),
                        bottomLeft: const Radius.circular(8),
                        bottomRight: Radius.circular(files.length > 1 ? 4 : 8),
                      ),
                child: _Image(
                  file: files.first,
                  height: files.length > 2 ? 154 : 150,
                ),
              ),
            ),
            if (files.length > 1) ...[
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(8),
                        topRight: const Radius.circular(19),
                        bottomLeft: const Radius.circular(4),
                        bottomRight: Radius.circular(files.length > 2 ? 4 : 8),
                      ),
                      child: _Image(
                        file: files[1],
                        height: files.length == 2 ? 150 : 75,
                      ),
                    ),
                    if (files.length > 2) ...[
                      const SizedBox(height: 4),
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                              bottomRight: Radius.circular(8),
                            ),
                            child: _Image(
                              file: files[2],
                              height: 75,
                            ),
                          ),
                          if (files.length > 3)
                            Container(
                              width: double.infinity,
                              height: 75,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '+${files.length - 3}',
                                  style: AppTextStyle.h1.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final String file;
  final double height;

  const _Image({
    super.key,
    required this.file,
    required this.height,
  });

  bool get isFile => !file.startsWith('http');

  @override
  Widget build(BuildContext context) {
    if (isFile) {
      return Image.file(
        File(file),
        height: height,
        fit: BoxFit.cover,
      );
    }
    return Image.network(
      file,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
