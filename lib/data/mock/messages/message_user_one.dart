import 'package:test_messager/data/mock/messages/data_message.dart';
import 'package:test_messager/data/models/message.dart';

class DataMessageUserOne implements DataMessage {
  @override
  final messages = [
    Message(
      id: 431431,
      content: 'Привет',
      companionId: 1,
      isRead: true,
      created: DateTime(
        2024,
        07,
        09,
        14,
        55,
      ),
      isMy: true,
    ),
    Message(
      id: 6645344,
      content: 'Привет',
      companionId: 1,
      isRead: true,
      isMy: false,
      created: DateTime(
        2024,
        07,
        09,
        14,
        56,
      ),
    ),
    Message(
      id: 4325766,
      content: 'Как дела?',
      companionId: 1,
      isRead: true,
      isMy: true,
      created: DateTime(
        2024,
        07,
        09,
        15,
        03,
      ),
    ),
    Message(
      id: 767554,
      content: 'Да все хорошо, у тебя как?',
      companionId: 1,
      isRead: true,
      isMy: false,
      created: DateTime(
        2024,
        07,
        09,
        15,
        04,
      ),
    ),
    Message(
      id: 134254657,
      content: 'Сорри, что вчера не ответил занят был',
      companionId: 1,
      isRead: true,
      isMy: true,
      created: DateTime(
        2024,
        07,
        10,
        10,
        03,
      ),
    ),
    Message(
      id: 676453,
      content: 'Да ничего',
      companionId: 1,
      isRead: true,
      isMy: false,
      created: DateTime(
        2024,
        07,
        10,
        11,
        25,
      ),
    ),
  ];
}
