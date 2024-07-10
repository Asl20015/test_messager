import 'package:test_messager/data/mock/messages/data_message.dart';
import 'package:test_messager/data/models/message.dart';

class DataMessageUserTwo implements DataMessage {
  @override
  final messages = [
    Message(
      id: 23545,
      content: 'Привет, скинь фото гор',
      companionId: 2,
      isMy: true,
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
      companionId: 2,
      isRead: true,
      isMy: false,
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
      companionId: 2,
      isRead: true,
      isMy: true,
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
      companionId: 2,
      isRead: true,
      isMy: false,
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
