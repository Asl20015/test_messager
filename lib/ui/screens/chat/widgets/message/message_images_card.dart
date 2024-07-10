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
                child: Image.network(
                  'https://cdn.tripster.ru/thumbs2/f5a8c1fe-b128-11ed-9e63-2e5ef03bee8d.1220x600.jpeg',
                  height: files.length > 2 ? 154 : 150,
                  fit: BoxFit.cover,
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
                      child: Image.network(
                        'https://cdn.tripster.ru/thumbs2/f5a8c1fe-b128-11ed-9e63-2e5ef03bee8d.1220x600.jpeg',
                        height: files.length == 2 ? 150 : 75,
                        fit: BoxFit.cover,
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
                            child: Image.network(
                              'https://cdn.tripster.ru/thumbs2/f5a8c1fe-b128-11ed-9e63-2e5ef03bee8d.1220x600.jpeg',
                              height: 75,
                              fit: BoxFit.cover,
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
