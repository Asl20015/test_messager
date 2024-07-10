import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_messager/data/data/data_users.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/icons.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/widgets/chat_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [const _Header()],
          body: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.greyRaw,
                  width: 1,
                ),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                for (var user in DataUsers().users) ChatCard(user: user),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 10,
      shadowColor: Colors.red,
      expandedHeight: MediaQuery.of(context).size.height / 6,
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          'Чаты',
          style: AppTextStyle.h1,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: TextField(
              style: AppTextStyle.h3,
              decoration: InputDecoration(
                hintText: 'Поиск',
                hintStyle: AppTextStyle.h3.copyWith(
                  color: AppColors.greyLight,
                ),
                prefixIconConstraints: const BoxConstraints(maxWidth: 38, minWidth: 38),
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      AppIcons.search,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        AppColors.greyLight,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
