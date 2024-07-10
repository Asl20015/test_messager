// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MessageTableTable extends MessageTable
    with drift.TableInfo<$MessageTableTable, MessageTableData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessageTableTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _contentMeta =
      const drift.VerificationMeta('content');
  @override
  late final drift.GeneratedColumn<String> content =
      drift.GeneratedColumn<String>('content', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdMeta =
      const drift.VerificationMeta('created');
  @override
  late final drift.GeneratedColumn<DateTime> created =
      drift.GeneratedColumn<DateTime>('created', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const drift.VerificationMeta _companionIdMeta =
      const drift.VerificationMeta('companionId');
  @override
  late final drift.GeneratedColumn<int> companionId =
      drift.GeneratedColumn<int>('companion_id', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _isReadMeta =
      const drift.VerificationMeta('isRead');
  @override
  late final drift.GeneratedColumn<bool> isRead = drift.GeneratedColumn<bool>(
      'is_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'));
  static const drift.VerificationMeta _isMyMeta =
      const drift.VerificationMeta('isMy');
  @override
  late final drift.GeneratedColumn<bool> isMy = drift.GeneratedColumn<bool>(
      'is_my', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_my" IN (0, 1))'));
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, content, created, companionId, isRead, isMy];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'message_table';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<MessageTableData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('companion_id')) {
      context.handle(
          _companionIdMeta,
          companionId.isAcceptableOrUnknown(
              data['companion_id']!, _companionIdMeta));
    } else if (isInserting) {
      context.missing(_companionIdMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    } else if (isInserting) {
      context.missing(_isReadMeta);
    }
    if (data.containsKey('is_my')) {
      context.handle(
          _isMyMeta, isMy.isAcceptableOrUnknown(data['is_my']!, _isMyMeta));
    } else if (isInserting) {
      context.missing(_isMyMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  MessageTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessageTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      companionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}companion_id'])!,
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
      isMy: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_my'])!,
    );
  }

  @override
  $MessageTableTable createAlias(String alias) {
    return $MessageTableTable(attachedDatabase, alias);
  }
}

class MessageTableData extends drift.DataClass
    implements drift.Insertable<MessageTableData> {
  final int id;
  final String content;
  final DateTime created;
  final int companionId;
  final bool isRead;
  final bool isMy;
  const MessageTableData(
      {required this.id,
      required this.content,
      required this.created,
      required this.companionId,
      required this.isRead,
      required this.isMy});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['content'] = drift.Variable<String>(content);
    map['created'] = drift.Variable<DateTime>(created);
    map['companion_id'] = drift.Variable<int>(companionId);
    map['is_read'] = drift.Variable<bool>(isRead);
    map['is_my'] = drift.Variable<bool>(isMy);
    return map;
  }

  MessageTableCompanion toCompanion(bool nullToAbsent) {
    return MessageTableCompanion(
      id: drift.Value(id),
      content: drift.Value(content),
      created: drift.Value(created),
      companionId: drift.Value(companionId),
      isRead: drift.Value(isRead),
      isMy: drift.Value(isMy),
    );
  }

  factory MessageTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return MessageTableData(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      created: serializer.fromJson<DateTime>(json['created']),
      companionId: serializer.fromJson<int>(json['companionId']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      isMy: serializer.fromJson<bool>(json['isMy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'created': serializer.toJson<DateTime>(created),
      'companionId': serializer.toJson<int>(companionId),
      'isRead': serializer.toJson<bool>(isRead),
      'isMy': serializer.toJson<bool>(isMy),
    };
  }

  MessageTableData copyWith(
          {int? id,
          String? content,
          DateTime? created,
          int? companionId,
          bool? isRead,
          bool? isMy}) =>
      MessageTableData(
        id: id ?? this.id,
        content: content ?? this.content,
        created: created ?? this.created,
        companionId: companionId ?? this.companionId,
        isRead: isRead ?? this.isRead,
        isMy: isMy ?? this.isMy,
      );
  @override
  String toString() {
    return (StringBuffer('MessageTableData(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('created: $created, ')
          ..write('companionId: $companionId, ')
          ..write('isRead: $isRead, ')
          ..write('isMy: $isMy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, content, created, companionId, isRead, isMy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageTableData &&
          other.id == this.id &&
          other.content == this.content &&
          other.created == this.created &&
          other.companionId == this.companionId &&
          other.isRead == this.isRead &&
          other.isMy == this.isMy);
}

class MessageTableCompanion extends drift.UpdateCompanion<MessageTableData> {
  final drift.Value<int> id;
  final drift.Value<String> content;
  final drift.Value<DateTime> created;
  final drift.Value<int> companionId;
  final drift.Value<bool> isRead;
  final drift.Value<bool> isMy;
  const MessageTableCompanion({
    this.id = const drift.Value.absent(),
    this.content = const drift.Value.absent(),
    this.created = const drift.Value.absent(),
    this.companionId = const drift.Value.absent(),
    this.isRead = const drift.Value.absent(),
    this.isMy = const drift.Value.absent(),
  });
  MessageTableCompanion.insert({
    this.id = const drift.Value.absent(),
    required String content,
    required DateTime created,
    required int companionId,
    required bool isRead,
    required bool isMy,
  })  : content = drift.Value(content),
        created = drift.Value(created),
        companionId = drift.Value(companionId),
        isRead = drift.Value(isRead),
        isMy = drift.Value(isMy);
  static drift.Insertable<MessageTableData> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? content,
    drift.Expression<DateTime>? created,
    drift.Expression<int>? companionId,
    drift.Expression<bool>? isRead,
    drift.Expression<bool>? isMy,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (created != null) 'created': created,
      if (companionId != null) 'companion_id': companionId,
      if (isRead != null) 'is_read': isRead,
      if (isMy != null) 'is_my': isMy,
    });
  }

  MessageTableCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? content,
      drift.Value<DateTime>? created,
      drift.Value<int>? companionId,
      drift.Value<bool>? isRead,
      drift.Value<bool>? isMy}) {
    return MessageTableCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      created: created ?? this.created,
      companionId: companionId ?? this.companionId,
      isRead: isRead ?? this.isRead,
      isMy: isMy ?? this.isMy,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = drift.Variable<String>(content.value);
    }
    if (created.present) {
      map['created'] = drift.Variable<DateTime>(created.value);
    }
    if (companionId.present) {
      map['companion_id'] = drift.Variable<int>(companionId.value);
    }
    if (isRead.present) {
      map['is_read'] = drift.Variable<bool>(isRead.value);
    }
    if (isMy.present) {
      map['is_my'] = drift.Variable<bool>(isMy.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageTableCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('created: $created, ')
          ..write('companionId: $companionId, ')
          ..write('isRead: $isRead, ')
          ..write('isMy: $isMy')
          ..write(')'))
        .toString();
  }
}

class $FilesTableTable extends FilesTable
    with drift.TableInfo<$FilesTableTable, FilesTableData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FilesTableTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _fileMeta =
      const drift.VerificationMeta('file');
  @override
  late final drift.GeneratedColumn<String> file = drift.GeneratedColumn<String>(
      'file', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _messageIdMeta =
      const drift.VerificationMeta('messageId');
  @override
  late final drift.GeneratedColumn<int> messageId = drift.GeneratedColumn<int>(
      'message_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [id, file, messageId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'files_table';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<FilesTableData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('file')) {
      context.handle(
          _fileMeta, file.isAcceptableOrUnknown(data['file']!, _fileMeta));
    } else if (isInserting) {
      context.missing(_fileMeta);
    }
    if (data.containsKey('message_id')) {
      context.handle(_messageIdMeta,
          messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta));
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  FilesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FilesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      file: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file'])!,
      messageId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}message_id'])!,
    );
  }

  @override
  $FilesTableTable createAlias(String alias) {
    return $FilesTableTable(attachedDatabase, alias);
  }
}

class FilesTableData extends drift.DataClass
    implements drift.Insertable<FilesTableData> {
  final int id;
  final String file;
  final int messageId;
  const FilesTableData(
      {required this.id, required this.file, required this.messageId});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['file'] = drift.Variable<String>(file);
    map['message_id'] = drift.Variable<int>(messageId);
    return map;
  }

  FilesTableCompanion toCompanion(bool nullToAbsent) {
    return FilesTableCompanion(
      id: drift.Value(id),
      file: drift.Value(file),
      messageId: drift.Value(messageId),
    );
  }

  factory FilesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return FilesTableData(
      id: serializer.fromJson<int>(json['id']),
      file: serializer.fromJson<String>(json['file']),
      messageId: serializer.fromJson<int>(json['messageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'file': serializer.toJson<String>(file),
      'messageId': serializer.toJson<int>(messageId),
    };
  }

  FilesTableData copyWith({int? id, String? file, int? messageId}) =>
      FilesTableData(
        id: id ?? this.id,
        file: file ?? this.file,
        messageId: messageId ?? this.messageId,
      );
  @override
  String toString() {
    return (StringBuffer('FilesTableData(')
          ..write('id: $id, ')
          ..write('file: $file, ')
          ..write('messageId: $messageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, file, messageId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FilesTableData &&
          other.id == this.id &&
          other.file == this.file &&
          other.messageId == this.messageId);
}

class FilesTableCompanion extends drift.UpdateCompanion<FilesTableData> {
  final drift.Value<int> id;
  final drift.Value<String> file;
  final drift.Value<int> messageId;
  const FilesTableCompanion({
    this.id = const drift.Value.absent(),
    this.file = const drift.Value.absent(),
    this.messageId = const drift.Value.absent(),
  });
  FilesTableCompanion.insert({
    this.id = const drift.Value.absent(),
    required String file,
    required int messageId,
  })  : file = drift.Value(file),
        messageId = drift.Value(messageId);
  static drift.Insertable<FilesTableData> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? file,
    drift.Expression<int>? messageId,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (file != null) 'file': file,
      if (messageId != null) 'message_id': messageId,
    });
  }

  FilesTableCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? file,
      drift.Value<int>? messageId}) {
    return FilesTableCompanion(
      id: id ?? this.id,
      file: file ?? this.file,
      messageId: messageId ?? this.messageId,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (file.present) {
      map['file'] = drift.Variable<String>(file.value);
    }
    if (messageId.present) {
      map['message_id'] = drift.Variable<int>(messageId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FilesTableCompanion(')
          ..write('id: $id, ')
          ..write('file: $file, ')
          ..write('messageId: $messageId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDataBase extends drift.GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(e);
  _$AppDataBaseManager get managers => _$AppDataBaseManager(this);
  late final $MessageTableTable messageTable = $MessageTableTable(this);
  late final $FilesTableTable filesTable = $FilesTableTable(this);
  @override
  Iterable<drift.TableInfo<drift.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<drift.TableInfo<drift.Table, Object?>>();
  @override
  List<drift.DatabaseSchemaEntity> get allSchemaEntities =>
      [messageTable, filesTable];
}

typedef $$MessageTableTableInsertCompanionBuilder = MessageTableCompanion
    Function({
  drift.Value<int> id,
  required String content,
  required DateTime created,
  required int companionId,
  required bool isRead,
  required bool isMy,
});
typedef $$MessageTableTableUpdateCompanionBuilder = MessageTableCompanion
    Function({
  drift.Value<int> id,
  drift.Value<String> content,
  drift.Value<DateTime> created,
  drift.Value<int> companionId,
  drift.Value<bool> isRead,
  drift.Value<bool> isMy,
});

class $$MessageTableTableTableManager extends drift.RootTableManager<
    _$AppDataBase,
    $MessageTableTable,
    MessageTableData,
    $$MessageTableTableFilterComposer,
    $$MessageTableTableOrderingComposer,
    $$MessageTableTableProcessedTableManager,
    $$MessageTableTableInsertCompanionBuilder,
    $$MessageTableTableUpdateCompanionBuilder> {
  $$MessageTableTableTableManager(_$AppDataBase db, $MessageTableTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MessageTableTableFilterComposer(drift.ComposerState(db, table)),
          orderingComposer: $$MessageTableTableOrderingComposer(
              drift.ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MessageTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> content = const drift.Value.absent(),
            drift.Value<DateTime> created = const drift.Value.absent(),
            drift.Value<int> companionId = const drift.Value.absent(),
            drift.Value<bool> isRead = const drift.Value.absent(),
            drift.Value<bool> isMy = const drift.Value.absent(),
          }) =>
              MessageTableCompanion(
            id: id,
            content: content,
            created: created,
            companionId: companionId,
            isRead: isRead,
            isMy: isMy,
          ),
          getInsertCompanionBuilder: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String content,
            required DateTime created,
            required int companionId,
            required bool isRead,
            required bool isMy,
          }) =>
              MessageTableCompanion.insert(
            id: id,
            content: content,
            created: created,
            companionId: companionId,
            isRead: isRead,
            isMy: isMy,
          ),
        ));
}

class $$MessageTableTableProcessedTableManager
    extends drift.ProcessedTableManager<
        _$AppDataBase,
        $MessageTableTable,
        MessageTableData,
        $$MessageTableTableFilterComposer,
        $$MessageTableTableOrderingComposer,
        $$MessageTableTableProcessedTableManager,
        $$MessageTableTableInsertCompanionBuilder,
        $$MessageTableTableUpdateCompanionBuilder> {
  $$MessageTableTableProcessedTableManager(super.$state);
}

class $$MessageTableTableFilterComposer
    extends drift.FilterComposer<_$AppDataBase, $MessageTableTable> {
  $$MessageTableTableFilterComposer(super.$state);
  drift.ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          drift.ColumnFilters(column, joinBuilders: joinBuilders));

  drift.ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          drift.ColumnFilters(column, joinBuilders: joinBuilders));

  drift.ColumnFilters<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          drift.ColumnFilters(column, joinBuilders: joinBuilders));

  drift.ColumnFilters<int> get companionId => $state.composableBuilder(
      column: $state.table.companionId,
      builder: (column, joinBuilders) =>
          drift.ColumnFilters(column, joinBuilders: joinBuilders));

  drift.ColumnFilters<bool> get isRead => $state.composableBuilder(
      column: $state.table.isRead,
      builder: (column, joinBuilders) =>
          drift.ColumnFilters(column, joinBuilders: joinBuilders));

  drift.ColumnFilters<bool> get isMy => $state.composableBuilder(
      column: $state.table.isMy,
      builder: (column, joinBuilders) =>
          drift.ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MessageTableTableOrderingComposer
    extends drift.OrderingComposer<_$AppDataBase, $MessageTableTable> {
  $$MessageTableTableOrderingComposer(super.$state);
  drift.ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          drift.ColumnOrderings(column, joinBuilders: joinBuilders));

  drift.ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          drift.ColumnOrderings(column, joinBuilders: joinBuilders));

  drift.ColumnOrderings<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          drift.ColumnOrderings(column, joinBuilders: joinBuilders));

  drift.ColumnOrderings<int> get companionId => $state.composableBuilder(
      column: $state.table.companionId,
      builder: (column, joinBuilders) =>
          drift.ColumnOrderings(column, joinBuilders: joinBuilders));

  drift.ColumnOrderings<bool> get isRead => $state.composableBuilder(
      column: $state.table.isRead,
      builder: (column, joinBuilders) =>
          drift.ColumnOrderings(column, joinBuilders: joinBuilders));

  drift.ColumnOrderings<bool> get isMy => $state.composableBuilder(
      column: $state.table.isMy,
      builder: (column, joinBuilders) =>
          drift.ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$FilesTableTableInsertCompanionBuilder = FilesTableCompanion Function({
  drift.Value<int> id,
  required String file,
  required int messageId,
});
typedef $$FilesTableTableUpdateCompanionBuilder = FilesTableCompanion Function({
  drift.Value<int> id,
  drift.Value<String> file,
  drift.Value<int> messageId,
});

class $$FilesTableTableTableManager extends drift.RootTableManager<
    _$AppDataBase,
    $FilesTableTable,
    FilesTableData,
    $$FilesTableTableFilterComposer,
    $$FilesTableTableOrderingComposer,
    $$FilesTableTableProcessedTableManager,
    $$FilesTableTableInsertCompanionBuilder,
    $$FilesTableTableUpdateCompanionBuilder> {
  $$FilesTableTableTableManager(_$AppDataBase db, $FilesTableTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FilesTableTableFilterComposer(drift.ComposerState(db, table)),
          orderingComposer:
              $$FilesTableTableOrderingComposer(drift.ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$FilesTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> file = const drift.Value.absent(),
            drift.Value<int> messageId = const drift.Value.absent(),
          }) =>
              FilesTableCompanion(
            id: id,
            file: file,
            messageId: messageId,
          ),
          getInsertCompanionBuilder: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String file,
            required int messageId,
          }) =>
              FilesTableCompanion.insert(
            id: id,
            file: file,
            messageId: messageId,
          ),
        ));
}

class $$FilesTableTableProcessedTableManager
    extends drift.ProcessedTableManager<
        _$AppDataBase,
        $FilesTableTable,
        FilesTableData,
        $$FilesTableTableFilterComposer,
        $$FilesTableTableOrderingComposer,
        $$FilesTableTableProcessedTableManager,
        $$FilesTableTableInsertCompanionBuilder,
        $$FilesTableTableUpdateCompanionBuilder> {
  $$FilesTableTableProcessedTableManager(super.$state);
}

class $$FilesTableTableFilterComposer
    extends drift.FilterComposer<_$AppDataBase, $FilesTableTable> {
  $$FilesTableTableFilterComposer(super.$state);
  drift.ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          drift.ColumnFilters(column, joinBuilders: joinBuilders));

  drift.ColumnFilters<String> get file => $state.composableBuilder(
      column: $state.table.file,
      builder: (column, joinBuilders) =>
          drift.ColumnFilters(column, joinBuilders: joinBuilders));

  drift.ColumnFilters<int> get messageId => $state.composableBuilder(
      column: $state.table.messageId,
      builder: (column, joinBuilders) =>
          drift.ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FilesTableTableOrderingComposer
    extends drift.OrderingComposer<_$AppDataBase, $FilesTableTable> {
  $$FilesTableTableOrderingComposer(super.$state);
  drift.ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          drift.ColumnOrderings(column, joinBuilders: joinBuilders));

  drift.ColumnOrderings<String> get file => $state.composableBuilder(
      column: $state.table.file,
      builder: (column, joinBuilders) =>
          drift.ColumnOrderings(column, joinBuilders: joinBuilders));

  drift.ColumnOrderings<int> get messageId => $state.composableBuilder(
      column: $state.table.messageId,
      builder: (column, joinBuilders) =>
          drift.ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDataBaseManager {
  final _$AppDataBase _db;
  _$AppDataBaseManager(this._db);
  $$MessageTableTableTableManager get messageTable =>
      $$MessageTableTableTableManager(_db, _db.messageTable);
  $$FilesTableTableTableManager get filesTable =>
      $$FilesTableTableTableManager(_db, _db.filesTable);
}
