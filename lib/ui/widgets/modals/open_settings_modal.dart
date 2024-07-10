import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/text.dart';

class OpenSettingsModal extends StatelessWidget {
  const OpenSettingsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      title: const Text(
        'Настройка',
        style: AppTextStyle.h2,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Приложение запрашивает доступ к вашей библиотеке медиафайлов, чтобы загрузить медиафайлы. Пожалуйста разрешите доступ к медиафайлам приложения.',
              style: AppTextStyle.text1.copyWith(
                color: AppColors.greyMedium,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final storageStatus = await Permission.storage.status;
                if (storageStatus.isDenied) {
                  await Permission.storage.request();
                  if (storageStatus.isDenied) {
                    final manageStatus = await Permission.manageExternalStorage.request();
                    if (manageStatus.isDenied) await openAppSettings();
                  }
                }
                Future(() => Navigator.of(context).pop());
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primary,
                ),
                child: Center(
                  child: Text(
                    'Перейти в настройки',
                    style: AppTextStyle.text1.copyWith(
                      color: AppColors.greenDark,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
