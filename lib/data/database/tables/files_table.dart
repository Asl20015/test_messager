import 'package:drift/drift.dart';

class FilesTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get file => text()();

  IntColumn get messageId => integer()();
}
