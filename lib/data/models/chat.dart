import 'package:test_messager/data/models/message.dart';
import 'package:test_messager/data/models/user.dart';

class Chat {
  late Message? lastMessage;
  final User user;

  Chat({
    required this.user,
    required this.lastMessage,
  });
}
