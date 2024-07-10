import 'package:drift/drift.dart';

class MessageTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get content => text()();

  DateTimeColumn get created => dateTime()();

  IntColumn get userId => integer()();

  BoolColumn get isRead => boolean()();
}
