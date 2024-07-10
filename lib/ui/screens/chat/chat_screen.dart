import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:test_messager/data/models/user.dart';
import 'package:test_messager/domain/state_manager/message/action.dart';
import 'package:test_messager/domain/state_manager/message/state.dart';
import 'package:test_messager/domain/state_manager/store.dart';
import 'package:test_messager/ui/resurses/colors.dart';
import 'package:test_messager/ui/resurses/text.dart';
import 'package:test_messager/ui/screens/chat/widgets/message/message_group_card.dart';
import 'package:test_messager/ui/screens/chat/widgets/text_field_message.dart';
import 'package:test_messager/ui/widgets/user_card.dart';
import 'package:test_messager/ui/widgets/buttons/left_button.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  const ChatScreen({
    super.key,
    required this.user,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Store<AppState> _store;

  @override
  void initState() {
    super.initState();
    _store = StoreProvider.of<AppState>(context, listen: false);
    if (_store.state.messageListState.companionId != widget.user.id) {
      _store.dispatch(LoadMessageListAction(userId: widget.user.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeftButton(),
        titleSpacing: 10,
        elevation: 1,
        title: UserCard(user: widget.user),
      ),
      body: StoreConnector<AppState, MessageListState>(
        converter: (store) => store.state.messageListState,
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

          if (state.messages.isEmpty) {
            return const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 8),
                  Text('Это новый чат', style: AppTextStyle.text1),
                ],
              ),
            );
          }

          return ListView(
            reverse: true,
            padding: const EdgeInsets.all(10),
            children: [
              MessageGroupCard(messages: state.messages),
            ],
          );
        },
      ),
      bottomNavigationBar: const TextFieldMessage(),
    );
  }
}
