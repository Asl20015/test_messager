import 'package:test_messager/data/mock/messages/data_message.dart';
import 'package:test_messager/data/models/message.dart';

class DataMessageUserThree implements DataMessage {
  @override
  final messages = [
    Message(
      id: 786785,
      content: 'Привет',
      userId: -1,
      isRead: true,
      created: DateTime(
        2024,
        05,
        10,
        14,
        55,
      ),
    ),
    Message(
      id: 655242,
      content: 'Привет',
      userId: 3,
      isRead: true,
      created: DateTime(
        2024,
        05,
        10,
        14,
        56,
      ),
    ),
  ];
}
