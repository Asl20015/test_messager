import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';
import 'package:test_messager/domain/state_manager/chat/action.dart';
import 'package:test_messager/domain/state_manager/chat/state.dart';
import 'package:test_messager/domain/state_manager/store.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/icons.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/widgets/chat_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Store<AppState> _store;

  @override
  void initState() {
    super.initState();
    _store = StoreProvider.of<AppState>(context, listen: false);
    if (_store.state.chatListState.chats.isEmpty) _store.dispatch(LoadChatListAction());
  }

  Future<void> onRefresh() => Future(() => _store.dispatch(LoadChatListAction()));

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
            child: StoreConnector<AppState, ChatListState>(
              converter: (store) => store.state.chatListState,
              builder: (context, state) {
                if (state.isLoading) return const Center(child: CircularProgressIndicator());

                if (state.isError) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 16,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          state.errorMessage,
                          style: AppTextStyle.text1,
                        ),
                      ],
                    ),
                  );
                }

                if (state.chats.isEmpty) {
                  return const Center(
                    child: Text(
                      'У вас нет чатов',
                      style: AppTextStyle.text1,
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: onRefresh,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      for (var chat in state.chats) ChatCard(chat: chat),
                    ],
                  ),
                );
              },
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
