import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/icons.dart';
import 'package:test_messager/ui/resurses/text.dart';

class GetImageModal extends StatelessWidget {
  final Function(ImageSource sourse) getImage;
  final Function() getFile;

  const GetImageModal({
    super.key,
    required this.getImage,
    required this.getFile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Wrap(
        children: [
          _Container(
            onTap: () => getImage(ImageSource.camera),
            title: 'Камера',
            icon: AppIcons.camera,
          ),
          const Divider(color: AppColors.greyRaw),
          _Container(
            onTap: () => getImage(ImageSource.gallery),
            title: 'Галерея',
            icon: AppIcons.gallery,
          ),
          //const Divider(color: AppColors.greyRaw),
          //_Container(
          //  onTap: getFile,
          //  title: 'Файлы',
          //  icon: AppIcons.file,
          //),
        ],
      ),
    );
  }
}

class _Container extends StatelessWidget {
  final Function() onTap;
  final String icon;
  final String title;

  const _Container({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.transparent,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: AppTextStyle.text1,
            ),
          ],
        ),
      ),
    );
  }
}
