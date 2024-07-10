import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart' as drift;
import 'package:test_messager/data/database/tables/files_table.dart';
import 'package:test_messager/data/database/tables/message_table.dart';
import 'package:test_messager/data/mock/messages/data_message.dart';
import 'package:test_messager/data/models/message.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'database'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [
  MessageTable,
  FilesTable,
])
class AppDataBase extends _$AppDataBase {
  AppDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //Message
  Future<void> initMockMessage({required DataMessage mock}) async {
    for (var message in mock.messages) {
      final companion = MessageTableCompanion(
        userId: drift.Value(message.userId),
        isRead: const drift.Value(true),
        created: drift.Value(message.created),
        content: drift.Value(message.content),
      );
      final id = await into(messageTable).insert(companion);
      if ((message.files ?? []).isNotEmpty) {
        for (var file in message.files!) {
          final fileCompanion = FilesTableCompanion(
            file: drift.Value(file),
            messageId: drift.Value(id),
          );
          await into(filesTable).insert(fileCompanion);
        }
      }
    }
  }

  Future<List<Message>> getListMessage({required int userId}) async {
    final messages = await (select(messageTable)..where((tbl) => tbl.userId.isIn([userId]))).get();
    List<Message> results = [];
    for (var message in messages) {
      final dto = await getMessage(message: message);
      results.add(dto);
    }
    return results;
  }

  Future<Message?> getLastMessage({required int userId}) async {
    final messages = await (select(messageTable)..where((tbl) => tbl.userId.isIn([userId]))).get();
    if (messages.isEmpty) return null;
    final dto = await getMessage(message: messages.last);
    return dto;
  }

  //Files
  Future<Message> getMessage({required MessageTableData message}) async {
    final files = await (select(filesTable)
          ..where(
            (tbl) => tbl.messageId.isIn([message.id]),
          ))
        .get();
    return Message(
      id: message.id,
      userId: message.userId,
      content: message.content,
      isRead: message.isRead,
      created: message.created,
      files: files.map((e) => e.file).toList(),
    );
  }
}
