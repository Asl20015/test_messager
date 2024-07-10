import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_messager/domain/di/get_it_service.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/icons.dart';

class LeftButton extends StatelessWidget {
  final Color? color;

  const LeftButton({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 23),
        GestureDetector(
          onTap: getItService.navigatorService.onPop,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              AppIcons.arrowLeft,
              height: 18,
              colorFilter: ColorFilter.mode(
                color ?? AppColors.greyDark,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
