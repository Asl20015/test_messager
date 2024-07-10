import 'package:test_messager/data/mock/messages/data_message.dart';
import 'package:test_messager/data/models/message.dart';

class DataMessageUserTwo implements DataMessage {
  @override
  final messages = [
    Message(
      id: 23545,
      content: 'Привет, скинь фото гор',
      userId: -1,
      isRead: true,
      created: DateTime(
        2024,
        07,
        10,
        14,
        55,
      ),
    ),
    Message(
      id: 6534,
      content: 'Да, сейчас',
      userId: 2,
      isRead: true,
      created: DateTime(
        2024,
        07,
        10,
        14,
        56,
      ),
    ),
    Message(
      id: 3547667,
      files: ['https://cdn.tripster.ru/thumbs2/f5a8c1fe-b128-11ed-9e63-2e5ef03bee8d.1220x600.jpeg'],
      content: 'Вот смотри',
      userId: 2,
      isRead: true,
      created: DateTime(
        2024,
        07,
        10,
        15,
        03,
      ),
    ),
    Message(
      id: 7865,
      content: 'Вау',
      userId: -1,
      isRead: true,
      created: DateTime(
        2024,
        07,
        10,
        15,
        04,
      ),
    ),
  ];
}
