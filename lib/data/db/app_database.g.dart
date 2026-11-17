// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SubjectPacksTable extends SubjectPacks
    with TableInfo<$SubjectPacksTable, SubjectPack> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectPacksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectCodeMeta = const VerificationMeta(
    'subjectCode',
  );
  @override
  late final GeneratedColumn<String> subjectCode = GeneratedColumn<String>(
    'subject_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _examTrackMeta = const VerificationMeta(
    'examTrack',
  );
  @override
  late final GeneratedColumn<String> examTrack = GeneratedColumn<String>(
    'exam_track',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nerdcLevelMeta = const VerificationMeta(
    'nerdcLevel',
  );
  @override
  late final GeneratedColumn<String> nerdcLevel = GeneratedColumn<String>(
    'nerdc_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _sizeBytesMeta = const VerificationMeta(
    'sizeBytes',
  );
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
    'size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _checksumMeta = const VerificationMeta(
    'checksum',
  );
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
    'checksum',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('installed'),
  );
  static const VerificationMeta _installedAtMeta = const VerificationMeta(
    'installedAt',
  );
  @override
  late final GeneratedColumn<DateTime> installedAt = GeneratedColumn<DateTime>(
    'installed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectCode,
    title,
    examTrack,
    nerdcLevel,
    version,
    sizeBytes,
    checksum,
    status,
    installedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subject_packs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubjectPack> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject_code')) {
      context.handle(
        _subjectCodeMeta,
        subjectCode.isAcceptableOrUnknown(
          data['subject_code']!,
          _subjectCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subjectCodeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('exam_track')) {
      context.handle(
        _examTrackMeta,
        examTrack.isAcceptableOrUnknown(data['exam_track']!, _examTrackMeta),
      );
    } else if (isInserting) {
      context.missing(_examTrackMeta);
    }
    if (data.containsKey('nerdc_level')) {
      context.handle(
        _nerdcLevelMeta,
        nerdcLevel.isAcceptableOrUnknown(data['nerdc_level']!, _nerdcLevelMeta),
      );
    } else if (isInserting) {
      context.missing(_nerdcLevelMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('size_bytes')) {
      context.handle(
        _sizeBytesMeta,
        sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta),
      );
    }
    if (data.containsKey('checksum')) {
      context.handle(
        _checksumMeta,
        checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta),
      );
    } else if (isInserting) {
      context.missing(_checksumMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('installed_at')) {
      context.handle(
        _installedAtMeta,
        installedAt.isAcceptableOrUnknown(
          data['installed_at']!,
          _installedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubjectPack map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubjectPack(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      subjectCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_code'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      examTrack: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exam_track'],
      )!,
      nerdcLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nerdc_level'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      sizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size_bytes'],
      )!,
      checksum: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checksum'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      installedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}installed_at'],
      ),
    );
  }

  @override
  $SubjectPacksTable createAlias(String alias) {
    return $SubjectPacksTable(attachedDatabase, alias);
  }
}

class SubjectPack extends DataClass implements Insertable<SubjectPack> {
  final String id;
  final String subjectCode;
  final String title;
  final String examTrack;
  final String nerdcLevel;
  final int version;
  final int sizeBytes;
  final String checksum;
  final String status;
  final DateTime? installedAt;
  const SubjectPack({
    required this.id,
    required this.subjectCode,
    required this.title,
    required this.examTrack,
    required this.nerdcLevel,
    required this.version,
    required this.sizeBytes,
    required this.checksum,
    required this.status,
    this.installedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject_code'] = Variable<String>(subjectCode);
    map['title'] = Variable<String>(title);
    map['exam_track'] = Variable<String>(examTrack);
    map['nerdc_level'] = Variable<String>(nerdcLevel);
    map['version'] = Variable<int>(version);
    map['size_bytes'] = Variable<int>(sizeBytes);
    map['checksum'] = Variable<String>(checksum);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || installedAt != null) {
      map['installed_at'] = Variable<DateTime>(installedAt);
    }
    return map;
  }

  SubjectPacksCompanion toCompanion(bool nullToAbsent) {
    return SubjectPacksCompanion(
      id: Value(id),
      subjectCode: Value(subjectCode),
      title: Value(title),
      examTrack: Value(examTrack),
      nerdcLevel: Value(nerdcLevel),
      version: Value(version),
      sizeBytes: Value(sizeBytes),
      checksum: Value(checksum),
      status: Value(status),
      installedAt: installedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(installedAt),
    );
  }

  factory SubjectPack.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectPack(
      id: serializer.fromJson<String>(json['id']),
      subjectCode: serializer.fromJson<String>(json['subjectCode']),
      title: serializer.fromJson<String>(json['title']),
      examTrack: serializer.fromJson<String>(json['examTrack']),
      nerdcLevel: serializer.fromJson<String>(json['nerdcLevel']),
      version: serializer.fromJson<int>(json['version']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      checksum: serializer.fromJson<String>(json['checksum']),
      status: serializer.fromJson<String>(json['status']),
      installedAt: serializer.fromJson<DateTime?>(json['installedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subjectCode': serializer.toJson<String>(subjectCode),
      'title': serializer.toJson<String>(title),
      'examTrack': serializer.toJson<String>(examTrack),
      'nerdcLevel': serializer.toJson<String>(nerdcLevel),
      'version': serializer.toJson<int>(version),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'checksum': serializer.toJson<String>(checksum),
      'status': serializer.toJson<String>(status),
      'installedAt': serializer.toJson<DateTime?>(installedAt),
    };
  }

  SubjectPack copyWith({
    String? id,
    String? subjectCode,
    String? title,
    String? examTrack,
    String? nerdcLevel,
    int? version,
    int? sizeBytes,
    String? checksum,
    String? status,
    Value<DateTime?> installedAt = const Value.absent(),
  }) => SubjectPack(
    id: id ?? this.id,
    subjectCode: subjectCode ?? this.subjectCode,
    title: title ?? this.title,
    examTrack: examTrack ?? this.examTrack,
    nerdcLevel: nerdcLevel ?? this.nerdcLevel,
    version: version ?? this.version,
    sizeBytes: sizeBytes ?? this.sizeBytes,
    checksum: checksum ?? this.checksum,
    status: status ?? this.status,
    installedAt: installedAt.present ? installedAt.value : this.installedAt,
  );
  SubjectPack copyWithCompanion(SubjectPacksCompanion data) {
    return SubjectPack(
      id: data.id.present ? data.id.value : this.id,
      subjectCode: data.subjectCode.present
          ? data.subjectCode.value
          : this.subjectCode,
      title: data.title.present ? data.title.value : this.title,
      examTrack: data.examTrack.present ? data.examTrack.value : this.examTrack,
      nerdcLevel: data.nerdcLevel.present
          ? data.nerdcLevel.value
          : this.nerdcLevel,
      version: data.version.present ? data.version.value : this.version,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      status: data.status.present ? data.status.value : this.status,
      installedAt: data.installedAt.present
          ? data.installedAt.value
          : this.installedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubjectPack(')
          ..write('id: $id, ')
          ..write('subjectCode: $subjectCode, ')
          ..write('title: $title, ')
          ..write('examTrack: $examTrack, ')
          ..write('nerdcLevel: $nerdcLevel, ')
          ..write('version: $version, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('checksum: $checksum, ')
          ..write('status: $status, ')
          ..write('installedAt: $installedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subjectCode,
    title,
    examTrack,
    nerdcLevel,
    version,
    sizeBytes,
    checksum,
    status,
    installedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectPack &&
          other.id == this.id &&
          other.subjectCode == this.subjectCode &&
          other.title == this.title &&
          other.examTrack == this.examTrack &&
          other.nerdcLevel == this.nerdcLevel &&
          other.version == this.version &&
          other.sizeBytes == this.sizeBytes &&
          other.checksum == this.checksum &&
          other.status == this.status &&
          other.installedAt == this.installedAt);
}

class SubjectPacksCompanion extends UpdateCompanion<SubjectPack> {
  final Value<String> id;
  final Value<String> subjectCode;
  final Value<String> title;
  final Value<String> examTrack;
  final Value<String> nerdcLevel;
  final Value<int> version;
  final Value<int> sizeBytes;
  final Value<String> checksum;
  final Value<String> status;
  final Value<DateTime?> installedAt;
  final Value<int> rowid;
  const SubjectPacksCompanion({
    this.id = const Value.absent(),
    this.subjectCode = const Value.absent(),
    this.title = const Value.absent(),
    this.examTrack = const Value.absent(),
    this.nerdcLevel = const Value.absent(),
    this.version = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.checksum = const Value.absent(),
    this.status = const Value.absent(),
    this.installedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubjectPacksCompanion.insert({
    required String id,
    required String subjectCode,
    required String title,
    required String examTrack,
    required String nerdcLevel,
    this.version = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    required String checksum,
    this.status = const Value.absent(),
    this.installedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       subjectCode = Value(subjectCode),
       title = Value(title),
       examTrack = Value(examTrack),
       nerdcLevel = Value(nerdcLevel),
       checksum = Value(checksum);
  static Insertable<SubjectPack> custom({
    Expression<String>? id,
    Expression<String>? subjectCode,
    Expression<String>? title,
    Expression<String>? examTrack,
    Expression<String>? nerdcLevel,
    Expression<int>? version,
    Expression<int>? sizeBytes,
    Expression<String>? checksum,
    Expression<String>? status,
    Expression<DateTime>? installedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectCode != null) 'subject_code': subjectCode,
      if (title != null) 'title': title,
      if (examTrack != null) 'exam_track': examTrack,
      if (nerdcLevel != null) 'nerdc_level': nerdcLevel,
      if (version != null) 'version': version,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (checksum != null) 'checksum': checksum,
      if (status != null) 'status': status,
      if (installedAt != null) 'installed_at': installedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubjectPacksCompanion copyWith({
    Value<String>? id,
    Value<String>? subjectCode,
    Value<String>? title,
    Value<String>? examTrack,
    Value<String>? nerdcLevel,
    Value<int>? version,
    Value<int>? sizeBytes,
    Value<String>? checksum,
    Value<String>? status,
    Value<DateTime?>? installedAt,
    Value<int>? rowid,
  }) {
    return SubjectPacksCompanion(
      id: id ?? this.id,
      subjectCode: subjectCode ?? this.subjectCode,
      title: title ?? this.title,
      examTrack: examTrack ?? this.examTrack,
      nerdcLevel: nerdcLevel ?? this.nerdcLevel,
      version: version ?? this.version,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      checksum: checksum ?? this.checksum,
      status: status ?? this.status,
      installedAt: installedAt ?? this.installedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (subjectCode.present) {
      map['subject_code'] = Variable<String>(subjectCode.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (examTrack.present) {
      map['exam_track'] = Variable<String>(examTrack.value);
    }
    if (nerdcLevel.present) {
      map['nerdc_level'] = Variable<String>(nerdcLevel.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (installedAt.present) {
      map['installed_at'] = Variable<DateTime>(installedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectPacksCompanion(')
          ..write('id: $id, ')
          ..write('subjectCode: $subjectCode, ')
          ..write('title: $title, ')
          ..write('examTrack: $examTrack, ')
          ..write('nerdcLevel: $nerdcLevel, ')
          ..write('version: $version, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('checksum: $checksum, ')
          ..write('status: $status, ')
          ..write('installedAt: $installedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LessonsTable extends Lessons with TableInfo<$LessonsTable, Lesson> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LessonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _packIdMeta = const VerificationMeta('packId');
  @override
  late final GeneratedColumn<String> packId = GeneratedColumn<String>(
    'pack_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subject_packs (id)',
    ),
  );
  static const VerificationMeta _moduleTitleMeta = const VerificationMeta(
    'moduleTitle',
  );
  @override
  late final GeneratedColumn<String> moduleTitle = GeneratedColumn<String>(
    'module_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estimatedMinutesMeta = const VerificationMeta(
    'estimatedMinutes',
  );
  @override
  late final GeneratedColumn<int> estimatedMinutes = GeneratedColumn<int>(
    'estimated_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(8),
  );
  static const VerificationMeta _objectivesJsonMeta = const VerificationMeta(
    'objectivesJson',
  );
  @override
  late final GeneratedColumn<String> objectivesJson = GeneratedColumn<String>(
    'objectives_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _simpleSummaryMarkdownMeta =
      const VerificationMeta('simpleSummaryMarkdown');
  @override
  late final GeneratedColumn<String> simpleSummaryMarkdown =
      GeneratedColumn<String>(
        'simple_summary_markdown',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _formalSummaryMarkdownMeta =
      const VerificationMeta('formalSummaryMarkdown');
  @override
  late final GeneratedColumn<String> formalSummaryMarkdown =
      GeneratedColumn<String>(
        'formal_summary_markdown',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _keyRulesJsonMeta = const VerificationMeta(
    'keyRulesJson',
  );
  @override
  late final GeneratedColumn<String> keyRulesJson = GeneratedColumn<String>(
    'key_rules_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isBookmarkedMeta = const VerificationMeta(
    'isBookmarked',
  );
  @override
  late final GeneratedColumn<bool> isBookmarked = GeneratedColumn<bool>(
    'is_bookmarked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_bookmarked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    packId,
    moduleTitle,
    orderIndex,
    title,
    estimatedMinutes,
    objectivesJson,
    simpleSummaryMarkdown,
    formalSummaryMarkdown,
    keyRulesJson,
    isBookmarked,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lessons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Lesson> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pack_id')) {
      context.handle(
        _packIdMeta,
        packId.isAcceptableOrUnknown(data['pack_id']!, _packIdMeta),
      );
    } else if (isInserting) {
      context.missing(_packIdMeta);
    }
    if (data.containsKey('module_title')) {
      context.handle(
        _moduleTitleMeta,
        moduleTitle.isAcceptableOrUnknown(
          data['module_title']!,
          _moduleTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_moduleTitleMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('estimated_minutes')) {
      context.handle(
        _estimatedMinutesMeta,
        estimatedMinutes.isAcceptableOrUnknown(
          data['estimated_minutes']!,
          _estimatedMinutesMeta,
        ),
      );
    }
    if (data.containsKey('objectives_json')) {
      context.handle(
        _objectivesJsonMeta,
        objectivesJson.isAcceptableOrUnknown(
          data['objectives_json']!,
          _objectivesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_objectivesJsonMeta);
    }
    if (data.containsKey('simple_summary_markdown')) {
      context.handle(
        _simpleSummaryMarkdownMeta,
        simpleSummaryMarkdown.isAcceptableOrUnknown(
          data['simple_summary_markdown']!,
          _simpleSummaryMarkdownMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_simpleSummaryMarkdownMeta);
    }
    if (data.containsKey('formal_summary_markdown')) {
      context.handle(
        _formalSummaryMarkdownMeta,
        formalSummaryMarkdown.isAcceptableOrUnknown(
          data['formal_summary_markdown']!,
          _formalSummaryMarkdownMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_formalSummaryMarkdownMeta);
    }
    if (data.containsKey('key_rules_json')) {
      context.handle(
        _keyRulesJsonMeta,
        keyRulesJson.isAcceptableOrUnknown(
          data['key_rules_json']!,
          _keyRulesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_keyRulesJsonMeta);
    }
    if (data.containsKey('is_bookmarked')) {
      context.handle(
        _isBookmarkedMeta,
        isBookmarked.isAcceptableOrUnknown(
          data['is_bookmarked']!,
          _isBookmarkedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Lesson map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Lesson(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      packId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pack_id'],
      )!,
      moduleTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}module_title'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      estimatedMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_minutes'],
      )!,
      objectivesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}objectives_json'],
      )!,
      simpleSummaryMarkdown: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}simple_summary_markdown'],
      )!,
      formalSummaryMarkdown: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}formal_summary_markdown'],
      )!,
      keyRulesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key_rules_json'],
      )!,
      isBookmarked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_bookmarked'],
      )!,
    );
  }

  @override
  $LessonsTable createAlias(String alias) {
    return $LessonsTable(attachedDatabase, alias);
  }
}

class Lesson extends DataClass implements Insertable<Lesson> {
  final String id;
  final String packId;
  final String moduleTitle;
  final int orderIndex;
  final String title;
  final int estimatedMinutes;
  final String objectivesJson;
  final String simpleSummaryMarkdown;
  final String formalSummaryMarkdown;
  final String keyRulesJson;
  final bool isBookmarked;
  const Lesson({
    required this.id,
    required this.packId,
    required this.moduleTitle,
    required this.orderIndex,
    required this.title,
    required this.estimatedMinutes,
    required this.objectivesJson,
    required this.simpleSummaryMarkdown,
    required this.formalSummaryMarkdown,
    required this.keyRulesJson,
    required this.isBookmarked,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pack_id'] = Variable<String>(packId);
    map['module_title'] = Variable<String>(moduleTitle);
    map['order_index'] = Variable<int>(orderIndex);
    map['title'] = Variable<String>(title);
    map['estimated_minutes'] = Variable<int>(estimatedMinutes);
    map['objectives_json'] = Variable<String>(objectivesJson);
    map['simple_summary_markdown'] = Variable<String>(simpleSummaryMarkdown);
    map['formal_summary_markdown'] = Variable<String>(formalSummaryMarkdown);
    map['key_rules_json'] = Variable<String>(keyRulesJson);
    map['is_bookmarked'] = Variable<bool>(isBookmarked);
    return map;
  }

  LessonsCompanion toCompanion(bool nullToAbsent) {
    return LessonsCompanion(
      id: Value(id),
      packId: Value(packId),
      moduleTitle: Value(moduleTitle),
      orderIndex: Value(orderIndex),
      title: Value(title),
      estimatedMinutes: Value(estimatedMinutes),
      objectivesJson: Value(objectivesJson),
      simpleSummaryMarkdown: Value(simpleSummaryMarkdown),
      formalSummaryMarkdown: Value(formalSummaryMarkdown),
      keyRulesJson: Value(keyRulesJson),
      isBookmarked: Value(isBookmarked),
    );
  }

  factory Lesson.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Lesson(
      id: serializer.fromJson<String>(json['id']),
      packId: serializer.fromJson<String>(json['packId']),
      moduleTitle: serializer.fromJson<String>(json['moduleTitle']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      title: serializer.fromJson<String>(json['title']),
      estimatedMinutes: serializer.fromJson<int>(json['estimatedMinutes']),
      objectivesJson: serializer.fromJson<String>(json['objectivesJson']),
      simpleSummaryMarkdown: serializer.fromJson<String>(
        json['simpleSummaryMarkdown'],
      ),
      formalSummaryMarkdown: serializer.fromJson<String>(
        json['formalSummaryMarkdown'],
      ),
      keyRulesJson: serializer.fromJson<String>(json['keyRulesJson']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'packId': serializer.toJson<String>(packId),
      'moduleTitle': serializer.toJson<String>(moduleTitle),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'title': serializer.toJson<String>(title),
      'estimatedMinutes': serializer.toJson<int>(estimatedMinutes),
      'objectivesJson': serializer.toJson<String>(objectivesJson),
      'simpleSummaryMarkdown': serializer.toJson<String>(simpleSummaryMarkdown),
      'formalSummaryMarkdown': serializer.toJson<String>(formalSummaryMarkdown),
      'keyRulesJson': serializer.toJson<String>(keyRulesJson),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
    };
  }

  Lesson copyWith({
    String? id,
    String? packId,
    String? moduleTitle,
    int? orderIndex,
    String? title,
    int? estimatedMinutes,
    String? objectivesJson,
    String? simpleSummaryMarkdown,
    String? formalSummaryMarkdown,
    String? keyRulesJson,
    bool? isBookmarked,
  }) => Lesson(
    id: id ?? this.id,
    packId: packId ?? this.packId,
    moduleTitle: moduleTitle ?? this.moduleTitle,
    orderIndex: orderIndex ?? this.orderIndex,
    title: title ?? this.title,
    estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
    objectivesJson: objectivesJson ?? this.objectivesJson,
    simpleSummaryMarkdown: simpleSummaryMarkdown ?? this.simpleSummaryMarkdown,
    formalSummaryMarkdown: formalSummaryMarkdown ?? this.formalSummaryMarkdown,
    keyRulesJson: keyRulesJson ?? this.keyRulesJson,
    isBookmarked: isBookmarked ?? this.isBookmarked,
  );
  Lesson copyWithCompanion(LessonsCompanion data) {
    return Lesson(
      id: data.id.present ? data.id.value : this.id,
      packId: data.packId.present ? data.packId.value : this.packId,
      moduleTitle: data.moduleTitle.present
          ? data.moduleTitle.value
          : this.moduleTitle,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      title: data.title.present ? data.title.value : this.title,
      estimatedMinutes: data.estimatedMinutes.present
          ? data.estimatedMinutes.value
          : this.estimatedMinutes,
      objectivesJson: data.objectivesJson.present
          ? data.objectivesJson.value
          : this.objectivesJson,
      simpleSummaryMarkdown: data.simpleSummaryMarkdown.present
          ? data.simpleSummaryMarkdown.value
          : this.simpleSummaryMarkdown,
      formalSummaryMarkdown: data.formalSummaryMarkdown.present
          ? data.formalSummaryMarkdown.value
          : this.formalSummaryMarkdown,
      keyRulesJson: data.keyRulesJson.present
          ? data.keyRulesJson.value
          : this.keyRulesJson,
      isBookmarked: data.isBookmarked.present
          ? data.isBookmarked.value
          : this.isBookmarked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Lesson(')
          ..write('id: $id, ')
          ..write('packId: $packId, ')
          ..write('moduleTitle: $moduleTitle, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('title: $title, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('objectivesJson: $objectivesJson, ')
          ..write('simpleSummaryMarkdown: $simpleSummaryMarkdown, ')
          ..write('formalSummaryMarkdown: $formalSummaryMarkdown, ')
          ..write('keyRulesJson: $keyRulesJson, ')
          ..write('isBookmarked: $isBookmarked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    packId,
    moduleTitle,
    orderIndex,
    title,
    estimatedMinutes,
    objectivesJson,
    simpleSummaryMarkdown,
    formalSummaryMarkdown,
    keyRulesJson,
    isBookmarked,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lesson &&
          other.id == this.id &&
          other.packId == this.packId &&
          other.moduleTitle == this.moduleTitle &&
          other.orderIndex == this.orderIndex &&
          other.title == this.title &&
          other.estimatedMinutes == this.estimatedMinutes &&
          other.objectivesJson == this.objectivesJson &&
          other.simpleSummaryMarkdown == this.simpleSummaryMarkdown &&
          other.formalSummaryMarkdown == this.formalSummaryMarkdown &&
          other.keyRulesJson == this.keyRulesJson &&
          other.isBookmarked == this.isBookmarked);
}

class LessonsCompanion extends UpdateCompanion<Lesson> {
  final Value<String> id;
  final Value<String> packId;
  final Value<String> moduleTitle;
  final Value<int> orderIndex;
  final Value<String> title;
  final Value<int> estimatedMinutes;
  final Value<String> objectivesJson;
  final Value<String> simpleSummaryMarkdown;
  final Value<String> formalSummaryMarkdown;
  final Value<String> keyRulesJson;
  final Value<bool> isBookmarked;
  final Value<int> rowid;
  const LessonsCompanion({
    this.id = const Value.absent(),
    this.packId = const Value.absent(),
    this.moduleTitle = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.title = const Value.absent(),
    this.estimatedMinutes = const Value.absent(),
    this.objectivesJson = const Value.absent(),
    this.simpleSummaryMarkdown = const Value.absent(),
    this.formalSummaryMarkdown = const Value.absent(),
    this.keyRulesJson = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LessonsCompanion.insert({
    required String id,
    required String packId,
    required String moduleTitle,
    required int orderIndex,
    required String title,
    this.estimatedMinutes = const Value.absent(),
    required String objectivesJson,
    required String simpleSummaryMarkdown,
    required String formalSummaryMarkdown,
    required String keyRulesJson,
    this.isBookmarked = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       packId = Value(packId),
       moduleTitle = Value(moduleTitle),
       orderIndex = Value(orderIndex),
       title = Value(title),
       objectivesJson = Value(objectivesJson),
       simpleSummaryMarkdown = Value(simpleSummaryMarkdown),
       formalSummaryMarkdown = Value(formalSummaryMarkdown),
       keyRulesJson = Value(keyRulesJson);
  static Insertable<Lesson> custom({
    Expression<String>? id,
    Expression<String>? packId,
    Expression<String>? moduleTitle,
    Expression<int>? orderIndex,
    Expression<String>? title,
    Expression<int>? estimatedMinutes,
    Expression<String>? objectivesJson,
    Expression<String>? simpleSummaryMarkdown,
    Expression<String>? formalSummaryMarkdown,
    Expression<String>? keyRulesJson,
    Expression<bool>? isBookmarked,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (packId != null) 'pack_id': packId,
      if (moduleTitle != null) 'module_title': moduleTitle,
      if (orderIndex != null) 'order_index': orderIndex,
      if (title != null) 'title': title,
      if (estimatedMinutes != null) 'estimated_minutes': estimatedMinutes,
      if (objectivesJson != null) 'objectives_json': objectivesJson,
      if (simpleSummaryMarkdown != null)
        'simple_summary_markdown': simpleSummaryMarkdown,
      if (formalSummaryMarkdown != null)
        'formal_summary_markdown': formalSummaryMarkdown,
      if (keyRulesJson != null) 'key_rules_json': keyRulesJson,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LessonsCompanion copyWith({
    Value<String>? id,
    Value<String>? packId,
    Value<String>? moduleTitle,
    Value<int>? orderIndex,
    Value<String>? title,
    Value<int>? estimatedMinutes,
    Value<String>? objectivesJson,
    Value<String>? simpleSummaryMarkdown,
    Value<String>? formalSummaryMarkdown,
    Value<String>? keyRulesJson,
    Value<bool>? isBookmarked,
    Value<int>? rowid,
  }) {
    return LessonsCompanion(
      id: id ?? this.id,
      packId: packId ?? this.packId,
      moduleTitle: moduleTitle ?? this.moduleTitle,
      orderIndex: orderIndex ?? this.orderIndex,
      title: title ?? this.title,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      objectivesJson: objectivesJson ?? this.objectivesJson,
      simpleSummaryMarkdown:
          simpleSummaryMarkdown ?? this.simpleSummaryMarkdown,
      formalSummaryMarkdown:
          formalSummaryMarkdown ?? this.formalSummaryMarkdown,
      keyRulesJson: keyRulesJson ?? this.keyRulesJson,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (packId.present) {
      map['pack_id'] = Variable<String>(packId.value);
    }
    if (moduleTitle.present) {
      map['module_title'] = Variable<String>(moduleTitle.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (estimatedMinutes.present) {
      map['estimated_minutes'] = Variable<int>(estimatedMinutes.value);
    }
    if (objectivesJson.present) {
      map['objectives_json'] = Variable<String>(objectivesJson.value);
    }
    if (simpleSummaryMarkdown.present) {
      map['simple_summary_markdown'] = Variable<String>(
        simpleSummaryMarkdown.value,
      );
    }
    if (formalSummaryMarkdown.present) {
      map['formal_summary_markdown'] = Variable<String>(
        formalSummaryMarkdown.value,
      );
    }
    if (keyRulesJson.present) {
      map['key_rules_json'] = Variable<String>(keyRulesJson.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LessonsCompanion(')
          ..write('id: $id, ')
          ..write('packId: $packId, ')
          ..write('moduleTitle: $moduleTitle, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('title: $title, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('objectivesJson: $objectivesJson, ')
          ..write('simpleSummaryMarkdown: $simpleSummaryMarkdown, ')
          ..write('formalSummaryMarkdown: $formalSummaryMarkdown, ')
          ..write('keyRulesJson: $keyRulesJson, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LessonStepsTable extends LessonSteps
    with TableInfo<$LessonStepsTable, LessonStep> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LessonStepsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<String> lessonId = GeneratedColumn<String>(
    'lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lessons (id)',
    ),
  );
  static const VerificationMeta _stepOrderMeta = const VerificationMeta(
    'stepOrder',
  );
  @override
  late final GeneratedColumn<int> stepOrder = GeneratedColumn<int>(
    'step_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stepTypeMeta = const VerificationMeta(
    'stepType',
  );
  @override
  late final GeneratedColumn<String> stepType = GeneratedColumn<String>(
    'step_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMarkdownMeta = const VerificationMeta(
    'contentMarkdown',
  );
  @override
  late final GeneratedColumn<String> contentMarkdown = GeneratedColumn<String>(
    'content_markdown',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _revealStepsJsonMeta = const VerificationMeta(
    'revealStepsJson',
  );
  @override
  late final GeneratedColumn<String> revealStepsJson = GeneratedColumn<String>(
    'reveal_steps_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _simConfigJsonMeta = const VerificationMeta(
    'simConfigJson',
  );
  @override
  late final GeneratedColumn<String> simConfigJson = GeneratedColumn<String>(
    'sim_config_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  static const VerificationMeta _checkpointQuestionJsonMeta =
      const VerificationMeta('checkpointQuestionJson');
  @override
  late final GeneratedColumn<String> checkpointQuestionJson =
      GeneratedColumn<String>(
        'checkpoint_question_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('{}'),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lessonId,
    stepOrder,
    stepType,
    contentMarkdown,
    revealStepsJson,
    simConfigJson,
    checkpointQuestionJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lesson_steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<LessonStep> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lessonIdMeta);
    }
    if (data.containsKey('step_order')) {
      context.handle(
        _stepOrderMeta,
        stepOrder.isAcceptableOrUnknown(data['step_order']!, _stepOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_stepOrderMeta);
    }
    if (data.containsKey('step_type')) {
      context.handle(
        _stepTypeMeta,
        stepType.isAcceptableOrUnknown(data['step_type']!, _stepTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_stepTypeMeta);
    }
    if (data.containsKey('content_markdown')) {
      context.handle(
        _contentMarkdownMeta,
        contentMarkdown.isAcceptableOrUnknown(
          data['content_markdown']!,
          _contentMarkdownMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentMarkdownMeta);
    }
    if (data.containsKey('reveal_steps_json')) {
      context.handle(
        _revealStepsJsonMeta,
        revealStepsJson.isAcceptableOrUnknown(
          data['reveal_steps_json']!,
          _revealStepsJsonMeta,
        ),
      );
    }
    if (data.containsKey('sim_config_json')) {
      context.handle(
        _simConfigJsonMeta,
        simConfigJson.isAcceptableOrUnknown(
          data['sim_config_json']!,
          _simConfigJsonMeta,
        ),
      );
    }
    if (data.containsKey('checkpoint_question_json')) {
      context.handle(
        _checkpointQuestionJsonMeta,
        checkpointQuestionJson.isAcceptableOrUnknown(
          data['checkpoint_question_json']!,
          _checkpointQuestionJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LessonStep map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LessonStep(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lesson_id'],
      )!,
      stepOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}step_order'],
      )!,
      stepType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}step_type'],
      )!,
      contentMarkdown: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_markdown'],
      )!,
      revealStepsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reveal_steps_json'],
      )!,
      simConfigJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sim_config_json'],
      )!,
      checkpointQuestionJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checkpoint_question_json'],
      )!,
    );
  }

  @override
  $LessonStepsTable createAlias(String alias) {
    return $LessonStepsTable(attachedDatabase, alias);
  }
}

class LessonStep extends DataClass implements Insertable<LessonStep> {
  final String id;
  final String lessonId;
  final int stepOrder;
  final String stepType;
  final String contentMarkdown;
  final String revealStepsJson;
  final String simConfigJson;
  final String checkpointQuestionJson;
  const LessonStep({
    required this.id,
    required this.lessonId,
    required this.stepOrder,
    required this.stepType,
    required this.contentMarkdown,
    required this.revealStepsJson,
    required this.simConfigJson,
    required this.checkpointQuestionJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['lesson_id'] = Variable<String>(lessonId);
    map['step_order'] = Variable<int>(stepOrder);
    map['step_type'] = Variable<String>(stepType);
    map['content_markdown'] = Variable<String>(contentMarkdown);
    map['reveal_steps_json'] = Variable<String>(revealStepsJson);
    map['sim_config_json'] = Variable<String>(simConfigJson);
    map['checkpoint_question_json'] = Variable<String>(checkpointQuestionJson);
    return map;
  }

  LessonStepsCompanion toCompanion(bool nullToAbsent) {
    return LessonStepsCompanion(
      id: Value(id),
      lessonId: Value(lessonId),
      stepOrder: Value(stepOrder),
      stepType: Value(stepType),
      contentMarkdown: Value(contentMarkdown),
      revealStepsJson: Value(revealStepsJson),
      simConfigJson: Value(simConfigJson),
      checkpointQuestionJson: Value(checkpointQuestionJson),
    );
  }

  factory LessonStep.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LessonStep(
      id: serializer.fromJson<String>(json['id']),
      lessonId: serializer.fromJson<String>(json['lessonId']),
      stepOrder: serializer.fromJson<int>(json['stepOrder']),
      stepType: serializer.fromJson<String>(json['stepType']),
      contentMarkdown: serializer.fromJson<String>(json['contentMarkdown']),
      revealStepsJson: serializer.fromJson<String>(json['revealStepsJson']),
      simConfigJson: serializer.fromJson<String>(json['simConfigJson']),
      checkpointQuestionJson: serializer.fromJson<String>(
        json['checkpointQuestionJson'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'lessonId': serializer.toJson<String>(lessonId),
      'stepOrder': serializer.toJson<int>(stepOrder),
      'stepType': serializer.toJson<String>(stepType),
      'contentMarkdown': serializer.toJson<String>(contentMarkdown),
      'revealStepsJson': serializer.toJson<String>(revealStepsJson),
      'simConfigJson': serializer.toJson<String>(simConfigJson),
      'checkpointQuestionJson': serializer.toJson<String>(
        checkpointQuestionJson,
      ),
    };
  }

  LessonStep copyWith({
    String? id,
    String? lessonId,
    int? stepOrder,
    String? stepType,
    String? contentMarkdown,
    String? revealStepsJson,
    String? simConfigJson,
    String? checkpointQuestionJson,
  }) => LessonStep(
    id: id ?? this.id,
    lessonId: lessonId ?? this.lessonId,
    stepOrder: stepOrder ?? this.stepOrder,
    stepType: stepType ?? this.stepType,
    contentMarkdown: contentMarkdown ?? this.contentMarkdown,
    revealStepsJson: revealStepsJson ?? this.revealStepsJson,
    simConfigJson: simConfigJson ?? this.simConfigJson,
    checkpointQuestionJson:
        checkpointQuestionJson ?? this.checkpointQuestionJson,
  );
  LessonStep copyWithCompanion(LessonStepsCompanion data) {
    return LessonStep(
      id: data.id.present ? data.id.value : this.id,
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      stepOrder: data.stepOrder.present ? data.stepOrder.value : this.stepOrder,
      stepType: data.stepType.present ? data.stepType.value : this.stepType,
      contentMarkdown: data.contentMarkdown.present
          ? data.contentMarkdown.value
          : this.contentMarkdown,
      revealStepsJson: data.revealStepsJson.present
          ? data.revealStepsJson.value
          : this.revealStepsJson,
      simConfigJson: data.simConfigJson.present
          ? data.simConfigJson.value
          : this.simConfigJson,
      checkpointQuestionJson: data.checkpointQuestionJson.present
          ? data.checkpointQuestionJson.value
          : this.checkpointQuestionJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LessonStep(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('stepOrder: $stepOrder, ')
          ..write('stepType: $stepType, ')
          ..write('contentMarkdown: $contentMarkdown, ')
          ..write('revealStepsJson: $revealStepsJson, ')
          ..write('simConfigJson: $simConfigJson, ')
          ..write('checkpointQuestionJson: $checkpointQuestionJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lessonId,
    stepOrder,
    stepType,
    contentMarkdown,
    revealStepsJson,
    simConfigJson,
    checkpointQuestionJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LessonStep &&
          other.id == this.id &&
          other.lessonId == this.lessonId &&
          other.stepOrder == this.stepOrder &&
          other.stepType == this.stepType &&
          other.contentMarkdown == this.contentMarkdown &&
          other.revealStepsJson == this.revealStepsJson &&
          other.simConfigJson == this.simConfigJson &&
          other.checkpointQuestionJson == this.checkpointQuestionJson);
}

class LessonStepsCompanion extends UpdateCompanion<LessonStep> {
  final Value<String> id;
  final Value<String> lessonId;
  final Value<int> stepOrder;
  final Value<String> stepType;
  final Value<String> contentMarkdown;
  final Value<String> revealStepsJson;
  final Value<String> simConfigJson;
  final Value<String> checkpointQuestionJson;
  final Value<int> rowid;
  const LessonStepsCompanion({
    this.id = const Value.absent(),
    this.lessonId = const Value.absent(),
    this.stepOrder = const Value.absent(),
    this.stepType = const Value.absent(),
    this.contentMarkdown = const Value.absent(),
    this.revealStepsJson = const Value.absent(),
    this.simConfigJson = const Value.absent(),
    this.checkpointQuestionJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LessonStepsCompanion.insert({
    required String id,
    required String lessonId,
    required int stepOrder,
    required String stepType,
    required String contentMarkdown,
    this.revealStepsJson = const Value.absent(),
    this.simConfigJson = const Value.absent(),
    this.checkpointQuestionJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       lessonId = Value(lessonId),
       stepOrder = Value(stepOrder),
       stepType = Value(stepType),
       contentMarkdown = Value(contentMarkdown);
  static Insertable<LessonStep> custom({
    Expression<String>? id,
    Expression<String>? lessonId,
    Expression<int>? stepOrder,
    Expression<String>? stepType,
    Expression<String>? contentMarkdown,
    Expression<String>? revealStepsJson,
    Expression<String>? simConfigJson,
    Expression<String>? checkpointQuestionJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lessonId != null) 'lesson_id': lessonId,
      if (stepOrder != null) 'step_order': stepOrder,
      if (stepType != null) 'step_type': stepType,
      if (contentMarkdown != null) 'content_markdown': contentMarkdown,
      if (revealStepsJson != null) 'reveal_steps_json': revealStepsJson,
      if (simConfigJson != null) 'sim_config_json': simConfigJson,
      if (checkpointQuestionJson != null)
        'checkpoint_question_json': checkpointQuestionJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LessonStepsCompanion copyWith({
    Value<String>? id,
    Value<String>? lessonId,
    Value<int>? stepOrder,
    Value<String>? stepType,
    Value<String>? contentMarkdown,
    Value<String>? revealStepsJson,
    Value<String>? simConfigJson,
    Value<String>? checkpointQuestionJson,
    Value<int>? rowid,
  }) {
    return LessonStepsCompanion(
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      stepOrder: stepOrder ?? this.stepOrder,
      stepType: stepType ?? this.stepType,
      contentMarkdown: contentMarkdown ?? this.contentMarkdown,
      revealStepsJson: revealStepsJson ?? this.revealStepsJson,
      simConfigJson: simConfigJson ?? this.simConfigJson,
      checkpointQuestionJson:
          checkpointQuestionJson ?? this.checkpointQuestionJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (lessonId.present) {
      map['lesson_id'] = Variable<String>(lessonId.value);
    }
    if (stepOrder.present) {
      map['step_order'] = Variable<int>(stepOrder.value);
    }
    if (stepType.present) {
      map['step_type'] = Variable<String>(stepType.value);
    }
    if (contentMarkdown.present) {
      map['content_markdown'] = Variable<String>(contentMarkdown.value);
    }
    if (revealStepsJson.present) {
      map['reveal_steps_json'] = Variable<String>(revealStepsJson.value);
    }
    if (simConfigJson.present) {
      map['sim_config_json'] = Variable<String>(simConfigJson.value);
    }
    if (checkpointQuestionJson.present) {
      map['checkpoint_question_json'] = Variable<String>(
        checkpointQuestionJson.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LessonStepsCompanion(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('stepOrder: $stepOrder, ')
          ..write('stepType: $stepType, ')
          ..write('contentMarkdown: $contentMarkdown, ')
          ..write('revealStepsJson: $revealStepsJson, ')
          ..write('simConfigJson: $simConfigJson, ')
          ..write('checkpointQuestionJson: $checkpointQuestionJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _packIdMeta = const VerificationMeta('packId');
  @override
  late final GeneratedColumn<String> packId = GeneratedColumn<String>(
    'pack_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subject_packs (id)',
    ),
  );
  static const VerificationMeta _relatedLessonIdMeta = const VerificationMeta(
    'relatedLessonId',
  );
  @override
  late final GeneratedColumn<String> relatedLessonId = GeneratedColumn<String>(
    'related_lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _examBodyMeta = const VerificationMeta(
    'examBody',
  );
  @override
  late final GeneratedColumn<String> examBody = GeneratedColumn<String>(
    'exam_body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _examYearMeta = const VerificationMeta(
    'examYear',
  );
  @override
  late final GeneratedColumn<int> examYear = GeneratedColumn<int>(
    'exam_year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paperTypeMeta = const VerificationMeta(
    'paperType',
  );
  @override
  late final GeneratedColumn<String> paperType = GeneratedColumn<String>(
    'paper_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stemMarkdownMeta = const VerificationMeta(
    'stemMarkdown',
  );
  @override
  late final GeneratedColumn<String> stemMarkdown = GeneratedColumn<String>(
    'stem_markdown',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _diagramAssetPathMeta = const VerificationMeta(
    'diagramAssetPath',
  );
  @override
  late final GeneratedColumn<String> diagramAssetPath = GeneratedColumn<String>(
    'diagram_asset_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _optionsJsonMeta = const VerificationMeta(
    'optionsJson',
  );
  @override
  late final GeneratedColumn<String> optionsJson = GeneratedColumn<String>(
    'options_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correctIndexMeta = const VerificationMeta(
    'correctIndex',
  );
  @override
  late final GeneratedColumn<int> correctIndex = GeneratedColumn<int>(
    'correct_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _answerSummaryMeta = const VerificationMeta(
    'answerSummary',
  );
  @override
  late final GeneratedColumn<String> answerSummary = GeneratedColumn<String>(
    'answer_summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _workedStepsJsonMeta = const VerificationMeta(
    'workedStepsJson',
  );
  @override
  late final GeneratedColumn<String> workedStepsJson = GeneratedColumn<String>(
    'worked_steps_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _distractorNotesJsonMeta =
      const VerificationMeta('distractorNotesJson');
  @override
  late final GeneratedColumn<String> distractorNotesJson =
      GeneratedColumn<String>(
        'distractor_notes_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _markingPointsJsonMeta = const VerificationMeta(
    'markingPointsJson',
  );
  @override
  late final GeneratedColumn<String> markingPointsJson =
      GeneratedColumn<String>(
        'marking_points_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('[]'),
      );
  static const VerificationMeta _examinerTipMeta = const VerificationMeta(
    'examinerTip',
  );
  @override
  late final GeneratedColumn<String> examinerTip = GeneratedColumn<String>(
    'examiner_tip',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('medium'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    packId,
    relatedLessonId,
    examBody,
    examYear,
    paperType,
    stemMarkdown,
    diagramAssetPath,
    optionsJson,
    correctIndex,
    answerSummary,
    workedStepsJson,
    distractorNotesJson,
    markingPointsJson,
    examinerTip,
    difficulty,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Question> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pack_id')) {
      context.handle(
        _packIdMeta,
        packId.isAcceptableOrUnknown(data['pack_id']!, _packIdMeta),
      );
    } else if (isInserting) {
      context.missing(_packIdMeta);
    }
    if (data.containsKey('related_lesson_id')) {
      context.handle(
        _relatedLessonIdMeta,
        relatedLessonId.isAcceptableOrUnknown(
          data['related_lesson_id']!,
          _relatedLessonIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relatedLessonIdMeta);
    }
    if (data.containsKey('exam_body')) {
      context.handle(
        _examBodyMeta,
        examBody.isAcceptableOrUnknown(data['exam_body']!, _examBodyMeta),
      );
    } else if (isInserting) {
      context.missing(_examBodyMeta);
    }
    if (data.containsKey('exam_year')) {
      context.handle(
        _examYearMeta,
        examYear.isAcceptableOrUnknown(data['exam_year']!, _examYearMeta),
      );
    } else if (isInserting) {
      context.missing(_examYearMeta);
    }
    if (data.containsKey('paper_type')) {
      context.handle(
        _paperTypeMeta,
        paperType.isAcceptableOrUnknown(data['paper_type']!, _paperTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_paperTypeMeta);
    }
    if (data.containsKey('stem_markdown')) {
      context.handle(
        _stemMarkdownMeta,
        stemMarkdown.isAcceptableOrUnknown(
          data['stem_markdown']!,
          _stemMarkdownMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stemMarkdownMeta);
    }
    if (data.containsKey('diagram_asset_path')) {
      context.handle(
        _diagramAssetPathMeta,
        diagramAssetPath.isAcceptableOrUnknown(
          data['diagram_asset_path']!,
          _diagramAssetPathMeta,
        ),
      );
    }
    if (data.containsKey('options_json')) {
      context.handle(
        _optionsJsonMeta,
        optionsJson.isAcceptableOrUnknown(
          data['options_json']!,
          _optionsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_optionsJsonMeta);
    }
    if (data.containsKey('correct_index')) {
      context.handle(
        _correctIndexMeta,
        correctIndex.isAcceptableOrUnknown(
          data['correct_index']!,
          _correctIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_correctIndexMeta);
    }
    if (data.containsKey('answer_summary')) {
      context.handle(
        _answerSummaryMeta,
        answerSummary.isAcceptableOrUnknown(
          data['answer_summary']!,
          _answerSummaryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_answerSummaryMeta);
    }
    if (data.containsKey('worked_steps_json')) {
      context.handle(
        _workedStepsJsonMeta,
        workedStepsJson.isAcceptableOrUnknown(
          data['worked_steps_json']!,
          _workedStepsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workedStepsJsonMeta);
    }
    if (data.containsKey('distractor_notes_json')) {
      context.handle(
        _distractorNotesJsonMeta,
        distractorNotesJson.isAcceptableOrUnknown(
          data['distractor_notes_json']!,
          _distractorNotesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_distractorNotesJsonMeta);
    }
    if (data.containsKey('marking_points_json')) {
      context.handle(
        _markingPointsJsonMeta,
        markingPointsJson.isAcceptableOrUnknown(
          data['marking_points_json']!,
          _markingPointsJsonMeta,
        ),
      );
    }
    if (data.containsKey('examiner_tip')) {
      context.handle(
        _examinerTipMeta,
        examinerTip.isAcceptableOrUnknown(
          data['examiner_tip']!,
          _examinerTipMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_examinerTipMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Question(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      packId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pack_id'],
      )!,
      relatedLessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_lesson_id'],
      )!,
      examBody: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exam_body'],
      )!,
      examYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exam_year'],
      )!,
      paperType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}paper_type'],
      )!,
      stemMarkdown: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stem_markdown'],
      )!,
      diagramAssetPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}diagram_asset_path'],
      ),
      optionsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}options_json'],
      )!,
      correctIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}correct_index'],
      )!,
      answerSummary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answer_summary'],
      )!,
      workedStepsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}worked_steps_json'],
      )!,
      distractorNotesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}distractor_notes_json'],
      )!,
      markingPointsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marking_points_json'],
      )!,
      examinerTip: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}examiner_tip'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      )!,
    );
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }
}

class Question extends DataClass implements Insertable<Question> {
  final String id;
  final String packId;
  final String relatedLessonId;
  final String examBody;
  final int examYear;
  final String paperType;
  final String stemMarkdown;
  final String? diagramAssetPath;
  final String optionsJson;
  final int correctIndex;
  final String answerSummary;
  final String workedStepsJson;
  final String distractorNotesJson;
  final String markingPointsJson;
  final String examinerTip;
  final String difficulty;
  const Question({
    required this.id,
    required this.packId,
    required this.relatedLessonId,
    required this.examBody,
    required this.examYear,
    required this.paperType,
    required this.stemMarkdown,
    this.diagramAssetPath,
    required this.optionsJson,
    required this.correctIndex,
    required this.answerSummary,
    required this.workedStepsJson,
    required this.distractorNotesJson,
    required this.markingPointsJson,
    required this.examinerTip,
    required this.difficulty,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pack_id'] = Variable<String>(packId);
    map['related_lesson_id'] = Variable<String>(relatedLessonId);
    map['exam_body'] = Variable<String>(examBody);
    map['exam_year'] = Variable<int>(examYear);
    map['paper_type'] = Variable<String>(paperType);
    map['stem_markdown'] = Variable<String>(stemMarkdown);
    if (!nullToAbsent || diagramAssetPath != null) {
      map['diagram_asset_path'] = Variable<String>(diagramAssetPath);
    }
    map['options_json'] = Variable<String>(optionsJson);
    map['correct_index'] = Variable<int>(correctIndex);
    map['answer_summary'] = Variable<String>(answerSummary);
    map['worked_steps_json'] = Variable<String>(workedStepsJson);
    map['distractor_notes_json'] = Variable<String>(distractorNotesJson);
    map['marking_points_json'] = Variable<String>(markingPointsJson);
    map['examiner_tip'] = Variable<String>(examinerTip);
    map['difficulty'] = Variable<String>(difficulty);
    return map;
  }

  QuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionsCompanion(
      id: Value(id),
      packId: Value(packId),
      relatedLessonId: Value(relatedLessonId),
      examBody: Value(examBody),
      examYear: Value(examYear),
      paperType: Value(paperType),
      stemMarkdown: Value(stemMarkdown),
      diagramAssetPath: diagramAssetPath == null && nullToAbsent
          ? const Value.absent()
          : Value(diagramAssetPath),
      optionsJson: Value(optionsJson),
      correctIndex: Value(correctIndex),
      answerSummary: Value(answerSummary),
      workedStepsJson: Value(workedStepsJson),
      distractorNotesJson: Value(distractorNotesJson),
      markingPointsJson: Value(markingPointsJson),
      examinerTip: Value(examinerTip),
      difficulty: Value(difficulty),
    );
  }

  factory Question.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Question(
      id: serializer.fromJson<String>(json['id']),
      packId: serializer.fromJson<String>(json['packId']),
      relatedLessonId: serializer.fromJson<String>(json['relatedLessonId']),
      examBody: serializer.fromJson<String>(json['examBody']),
      examYear: serializer.fromJson<int>(json['examYear']),
      paperType: serializer.fromJson<String>(json['paperType']),
      stemMarkdown: serializer.fromJson<String>(json['stemMarkdown']),
      diagramAssetPath: serializer.fromJson<String?>(json['diagramAssetPath']),
      optionsJson: serializer.fromJson<String>(json['optionsJson']),
      correctIndex: serializer.fromJson<int>(json['correctIndex']),
      answerSummary: serializer.fromJson<String>(json['answerSummary']),
      workedStepsJson: serializer.fromJson<String>(json['workedStepsJson']),
      distractorNotesJson: serializer.fromJson<String>(
        json['distractorNotesJson'],
      ),
      markingPointsJson: serializer.fromJson<String>(json['markingPointsJson']),
      examinerTip: serializer.fromJson<String>(json['examinerTip']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'packId': serializer.toJson<String>(packId),
      'relatedLessonId': serializer.toJson<String>(relatedLessonId),
      'examBody': serializer.toJson<String>(examBody),
      'examYear': serializer.toJson<int>(examYear),
      'paperType': serializer.toJson<String>(paperType),
      'stemMarkdown': serializer.toJson<String>(stemMarkdown),
      'diagramAssetPath': serializer.toJson<String?>(diagramAssetPath),
      'optionsJson': serializer.toJson<String>(optionsJson),
      'correctIndex': serializer.toJson<int>(correctIndex),
      'answerSummary': serializer.toJson<String>(answerSummary),
      'workedStepsJson': serializer.toJson<String>(workedStepsJson),
      'distractorNotesJson': serializer.toJson<String>(distractorNotesJson),
      'markingPointsJson': serializer.toJson<String>(markingPointsJson),
      'examinerTip': serializer.toJson<String>(examinerTip),
      'difficulty': serializer.toJson<String>(difficulty),
    };
  }

  Question copyWith({
    String? id,
    String? packId,
    String? relatedLessonId,
    String? examBody,
    int? examYear,
    String? paperType,
    String? stemMarkdown,
    Value<String?> diagramAssetPath = const Value.absent(),
    String? optionsJson,
    int? correctIndex,
    String? answerSummary,
    String? workedStepsJson,
    String? distractorNotesJson,
    String? markingPointsJson,
    String? examinerTip,
    String? difficulty,
  }) => Question(
    id: id ?? this.id,
    packId: packId ?? this.packId,
    relatedLessonId: relatedLessonId ?? this.relatedLessonId,
    examBody: examBody ?? this.examBody,
    examYear: examYear ?? this.examYear,
    paperType: paperType ?? this.paperType,
    stemMarkdown: stemMarkdown ?? this.stemMarkdown,
    diagramAssetPath: diagramAssetPath.present
        ? diagramAssetPath.value
        : this.diagramAssetPath,
    optionsJson: optionsJson ?? this.optionsJson,
    correctIndex: correctIndex ?? this.correctIndex,
    answerSummary: answerSummary ?? this.answerSummary,
    workedStepsJson: workedStepsJson ?? this.workedStepsJson,
    distractorNotesJson: distractorNotesJson ?? this.distractorNotesJson,
    markingPointsJson: markingPointsJson ?? this.markingPointsJson,
    examinerTip: examinerTip ?? this.examinerTip,
    difficulty: difficulty ?? this.difficulty,
  );
  Question copyWithCompanion(QuestionsCompanion data) {
    return Question(
      id: data.id.present ? data.id.value : this.id,
      packId: data.packId.present ? data.packId.value : this.packId,
      relatedLessonId: data.relatedLessonId.present
          ? data.relatedLessonId.value
          : this.relatedLessonId,
      examBody: data.examBody.present ? data.examBody.value : this.examBody,
      examYear: data.examYear.present ? data.examYear.value : this.examYear,
      paperType: data.paperType.present ? data.paperType.value : this.paperType,
      stemMarkdown: data.stemMarkdown.present
          ? data.stemMarkdown.value
          : this.stemMarkdown,
      diagramAssetPath: data.diagramAssetPath.present
          ? data.diagramAssetPath.value
          : this.diagramAssetPath,
      optionsJson: data.optionsJson.present
          ? data.optionsJson.value
          : this.optionsJson,
      correctIndex: data.correctIndex.present
          ? data.correctIndex.value
          : this.correctIndex,
      answerSummary: data.answerSummary.present
          ? data.answerSummary.value
          : this.answerSummary,
      workedStepsJson: data.workedStepsJson.present
          ? data.workedStepsJson.value
          : this.workedStepsJson,
      distractorNotesJson: data.distractorNotesJson.present
          ? data.distractorNotesJson.value
          : this.distractorNotesJson,
      markingPointsJson: data.markingPointsJson.present
          ? data.markingPointsJson.value
          : this.markingPointsJson,
      examinerTip: data.examinerTip.present
          ? data.examinerTip.value
          : this.examinerTip,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('id: $id, ')
          ..write('packId: $packId, ')
          ..write('relatedLessonId: $relatedLessonId, ')
          ..write('examBody: $examBody, ')
          ..write('examYear: $examYear, ')
          ..write('paperType: $paperType, ')
          ..write('stemMarkdown: $stemMarkdown, ')
          ..write('diagramAssetPath: $diagramAssetPath, ')
          ..write('optionsJson: $optionsJson, ')
          ..write('correctIndex: $correctIndex, ')
          ..write('answerSummary: $answerSummary, ')
          ..write('workedStepsJson: $workedStepsJson, ')
          ..write('distractorNotesJson: $distractorNotesJson, ')
          ..write('markingPointsJson: $markingPointsJson, ')
          ..write('examinerTip: $examinerTip, ')
          ..write('difficulty: $difficulty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    packId,
    relatedLessonId,
    examBody,
    examYear,
    paperType,
    stemMarkdown,
    diagramAssetPath,
    optionsJson,
    correctIndex,
    answerSummary,
    workedStepsJson,
    distractorNotesJson,
    markingPointsJson,
    examinerTip,
    difficulty,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Question &&
          other.id == this.id &&
          other.packId == this.packId &&
          other.relatedLessonId == this.relatedLessonId &&
          other.examBody == this.examBody &&
          other.examYear == this.examYear &&
          other.paperType == this.paperType &&
          other.stemMarkdown == this.stemMarkdown &&
          other.diagramAssetPath == this.diagramAssetPath &&
          other.optionsJson == this.optionsJson &&
          other.correctIndex == this.correctIndex &&
          other.answerSummary == this.answerSummary &&
          other.workedStepsJson == this.workedStepsJson &&
          other.distractorNotesJson == this.distractorNotesJson &&
          other.markingPointsJson == this.markingPointsJson &&
          other.examinerTip == this.examinerTip &&
          other.difficulty == this.difficulty);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<String> id;
  final Value<String> packId;
  final Value<String> relatedLessonId;
  final Value<String> examBody;
  final Value<int> examYear;
  final Value<String> paperType;
  final Value<String> stemMarkdown;
  final Value<String?> diagramAssetPath;
  final Value<String> optionsJson;
  final Value<int> correctIndex;
  final Value<String> answerSummary;
  final Value<String> workedStepsJson;
  final Value<String> distractorNotesJson;
  final Value<String> markingPointsJson;
  final Value<String> examinerTip;
  final Value<String> difficulty;
  final Value<int> rowid;
  const QuestionsCompanion({
    this.id = const Value.absent(),
    this.packId = const Value.absent(),
    this.relatedLessonId = const Value.absent(),
    this.examBody = const Value.absent(),
    this.examYear = const Value.absent(),
    this.paperType = const Value.absent(),
    this.stemMarkdown = const Value.absent(),
    this.diagramAssetPath = const Value.absent(),
    this.optionsJson = const Value.absent(),
    this.correctIndex = const Value.absent(),
    this.answerSummary = const Value.absent(),
    this.workedStepsJson = const Value.absent(),
    this.distractorNotesJson = const Value.absent(),
    this.markingPointsJson = const Value.absent(),
    this.examinerTip = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionsCompanion.insert({
    required String id,
    required String packId,
    required String relatedLessonId,
    required String examBody,
    required int examYear,
    required String paperType,
    required String stemMarkdown,
    this.diagramAssetPath = const Value.absent(),
    required String optionsJson,
    required int correctIndex,
    required String answerSummary,
    required String workedStepsJson,
    required String distractorNotesJson,
    this.markingPointsJson = const Value.absent(),
    required String examinerTip,
    this.difficulty = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       packId = Value(packId),
       relatedLessonId = Value(relatedLessonId),
       examBody = Value(examBody),
       examYear = Value(examYear),
       paperType = Value(paperType),
       stemMarkdown = Value(stemMarkdown),
       optionsJson = Value(optionsJson),
       correctIndex = Value(correctIndex),
       answerSummary = Value(answerSummary),
       workedStepsJson = Value(workedStepsJson),
       distractorNotesJson = Value(distractorNotesJson),
       examinerTip = Value(examinerTip);
  static Insertable<Question> custom({
    Expression<String>? id,
    Expression<String>? packId,
    Expression<String>? relatedLessonId,
    Expression<String>? examBody,
    Expression<int>? examYear,
    Expression<String>? paperType,
    Expression<String>? stemMarkdown,
    Expression<String>? diagramAssetPath,
    Expression<String>? optionsJson,
    Expression<int>? correctIndex,
    Expression<String>? answerSummary,
    Expression<String>? workedStepsJson,
    Expression<String>? distractorNotesJson,
    Expression<String>? markingPointsJson,
    Expression<String>? examinerTip,
    Expression<String>? difficulty,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (packId != null) 'pack_id': packId,
      if (relatedLessonId != null) 'related_lesson_id': relatedLessonId,
      if (examBody != null) 'exam_body': examBody,
      if (examYear != null) 'exam_year': examYear,
      if (paperType != null) 'paper_type': paperType,
      if (stemMarkdown != null) 'stem_markdown': stemMarkdown,
      if (diagramAssetPath != null) 'diagram_asset_path': diagramAssetPath,
      if (optionsJson != null) 'options_json': optionsJson,
      if (correctIndex != null) 'correct_index': correctIndex,
      if (answerSummary != null) 'answer_summary': answerSummary,
      if (workedStepsJson != null) 'worked_steps_json': workedStepsJson,
      if (distractorNotesJson != null)
        'distractor_notes_json': distractorNotesJson,
      if (markingPointsJson != null) 'marking_points_json': markingPointsJson,
      if (examinerTip != null) 'examiner_tip': examinerTip,
      if (difficulty != null) 'difficulty': difficulty,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionsCompanion copyWith({
    Value<String>? id,
    Value<String>? packId,
    Value<String>? relatedLessonId,
    Value<String>? examBody,
    Value<int>? examYear,
    Value<String>? paperType,
    Value<String>? stemMarkdown,
    Value<String?>? diagramAssetPath,
    Value<String>? optionsJson,
    Value<int>? correctIndex,
    Value<String>? answerSummary,
    Value<String>? workedStepsJson,
    Value<String>? distractorNotesJson,
    Value<String>? markingPointsJson,
    Value<String>? examinerTip,
    Value<String>? difficulty,
    Value<int>? rowid,
  }) {
    return QuestionsCompanion(
      id: id ?? this.id,
      packId: packId ?? this.packId,
      relatedLessonId: relatedLessonId ?? this.relatedLessonId,
      examBody: examBody ?? this.examBody,
      examYear: examYear ?? this.examYear,
      paperType: paperType ?? this.paperType,
      stemMarkdown: stemMarkdown ?? this.stemMarkdown,
      diagramAssetPath: diagramAssetPath ?? this.diagramAssetPath,
      optionsJson: optionsJson ?? this.optionsJson,
      correctIndex: correctIndex ?? this.correctIndex,
      answerSummary: answerSummary ?? this.answerSummary,
      workedStepsJson: workedStepsJson ?? this.workedStepsJson,
      distractorNotesJson: distractorNotesJson ?? this.distractorNotesJson,
      markingPointsJson: markingPointsJson ?? this.markingPointsJson,
      examinerTip: examinerTip ?? this.examinerTip,
      difficulty: difficulty ?? this.difficulty,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (packId.present) {
      map['pack_id'] = Variable<String>(packId.value);
    }
    if (relatedLessonId.present) {
      map['related_lesson_id'] = Variable<String>(relatedLessonId.value);
    }
    if (examBody.present) {
      map['exam_body'] = Variable<String>(examBody.value);
    }
    if (examYear.present) {
      map['exam_year'] = Variable<int>(examYear.value);
    }
    if (paperType.present) {
      map['paper_type'] = Variable<String>(paperType.value);
    }
    if (stemMarkdown.present) {
      map['stem_markdown'] = Variable<String>(stemMarkdown.value);
    }
    if (diagramAssetPath.present) {
      map['diagram_asset_path'] = Variable<String>(diagramAssetPath.value);
    }
    if (optionsJson.present) {
      map['options_json'] = Variable<String>(optionsJson.value);
    }
    if (correctIndex.present) {
      map['correct_index'] = Variable<int>(correctIndex.value);
    }
    if (answerSummary.present) {
      map['answer_summary'] = Variable<String>(answerSummary.value);
    }
    if (workedStepsJson.present) {
      map['worked_steps_json'] = Variable<String>(workedStepsJson.value);
    }
    if (distractorNotesJson.present) {
      map['distractor_notes_json'] = Variable<String>(
        distractorNotesJson.value,
      );
    }
    if (markingPointsJson.present) {
      map['marking_points_json'] = Variable<String>(markingPointsJson.value);
    }
    if (examinerTip.present) {
      map['examiner_tip'] = Variable<String>(examinerTip.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('id: $id, ')
          ..write('packId: $packId, ')
          ..write('relatedLessonId: $relatedLessonId, ')
          ..write('examBody: $examBody, ')
          ..write('examYear: $examYear, ')
          ..write('paperType: $paperType, ')
          ..write('stemMarkdown: $stemMarkdown, ')
          ..write('diagramAssetPath: $diagramAssetPath, ')
          ..write('optionsJson: $optionsJson, ')
          ..write('correctIndex: $correctIndex, ')
          ..write('answerSummary: $answerSummary, ')
          ..write('workedStepsJson: $workedStepsJson, ')
          ..write('distractorNotesJson: $distractorNotesJson, ')
          ..write('markingPointsJson: $markingPointsJson, ')
          ..write('examinerTip: $examinerTip, ')
          ..write('difficulty: $difficulty, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MistakeVaultSm2Table extends MistakeVaultSm2
    with TableInfo<$MistakeVaultSm2Table, MistakeVaultSm2Data> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MistakeVaultSm2Table(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES questions (id)',
    ),
  );
  static const VerificationMeta _easeFactorMeta = const VerificationMeta(
    'easeFactor',
  );
  @override
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
    'ease_factor',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(2.5),
  );
  static const VerificationMeta _intervalDaysMeta = const VerificationMeta(
    'intervalDays',
  );
  @override
  late final GeneratedColumn<int> intervalDays = GeneratedColumn<int>(
    'interval_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _repetitionsMeta = const VerificationMeta(
    'repetitions',
  );
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
    'repetitions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextReviewAtMeta = const VerificationMeta(
    'nextReviewAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextReviewAt = GeneratedColumn<DateTime>(
    'next_review_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastOutcomeMeta = const VerificationMeta(
    'lastOutcome',
  );
  @override
  late final GeneratedColumn<String> lastOutcome = GeneratedColumn<String>(
    'last_outcome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('wrong'),
  );
  static const VerificationMeta _userNoteMeta = const VerificationMeta(
    'userNote',
  );
  @override
  late final GeneratedColumn<String> userNote = GeneratedColumn<String>(
    'user_note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    questionId,
    easeFactor,
    intervalDays,
    repetitions,
    nextReviewAt,
    lastOutcome,
    userNote,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mistake_vault_sm2';
  @override
  VerificationContext validateIntegrity(
    Insertable<MistakeVaultSm2Data> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('ease_factor')) {
      context.handle(
        _easeFactorMeta,
        easeFactor.isAcceptableOrUnknown(data['ease_factor']!, _easeFactorMeta),
      );
    }
    if (data.containsKey('interval_days')) {
      context.handle(
        _intervalDaysMeta,
        intervalDays.isAcceptableOrUnknown(
          data['interval_days']!,
          _intervalDaysMeta,
        ),
      );
    }
    if (data.containsKey('repetitions')) {
      context.handle(
        _repetitionsMeta,
        repetitions.isAcceptableOrUnknown(
          data['repetitions']!,
          _repetitionsMeta,
        ),
      );
    }
    if (data.containsKey('next_review_at')) {
      context.handle(
        _nextReviewAtMeta,
        nextReviewAt.isAcceptableOrUnknown(
          data['next_review_at']!,
          _nextReviewAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nextReviewAtMeta);
    }
    if (data.containsKey('last_outcome')) {
      context.handle(
        _lastOutcomeMeta,
        lastOutcome.isAcceptableOrUnknown(
          data['last_outcome']!,
          _lastOutcomeMeta,
        ),
      );
    }
    if (data.containsKey('user_note')) {
      context.handle(
        _userNoteMeta,
        userNote.isAcceptableOrUnknown(data['user_note']!, _userNoteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {questionId};
  @override
  MistakeVaultSm2Data map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MistakeVaultSm2Data(
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_id'],
      )!,
      easeFactor: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ease_factor'],
      )!,
      intervalDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval_days'],
      )!,
      repetitions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetitions'],
      )!,
      nextReviewAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_review_at'],
      )!,
      lastOutcome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_outcome'],
      )!,
      userNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_note'],
      )!,
    );
  }

  @override
  $MistakeVaultSm2Table createAlias(String alias) {
    return $MistakeVaultSm2Table(attachedDatabase, alias);
  }
}

class MistakeVaultSm2Data extends DataClass
    implements Insertable<MistakeVaultSm2Data> {
  final String questionId;
  final double easeFactor;
  final int intervalDays;
  final int repetitions;
  final DateTime nextReviewAt;
  final String lastOutcome;
  final String userNote;
  const MistakeVaultSm2Data({
    required this.questionId,
    required this.easeFactor,
    required this.intervalDays,
    required this.repetitions,
    required this.nextReviewAt,
    required this.lastOutcome,
    required this.userNote,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['question_id'] = Variable<String>(questionId);
    map['ease_factor'] = Variable<double>(easeFactor);
    map['interval_days'] = Variable<int>(intervalDays);
    map['repetitions'] = Variable<int>(repetitions);
    map['next_review_at'] = Variable<DateTime>(nextReviewAt);
    map['last_outcome'] = Variable<String>(lastOutcome);
    map['user_note'] = Variable<String>(userNote);
    return map;
  }

  MistakeVaultSm2Companion toCompanion(bool nullToAbsent) {
    return MistakeVaultSm2Companion(
      questionId: Value(questionId),
      easeFactor: Value(easeFactor),
      intervalDays: Value(intervalDays),
      repetitions: Value(repetitions),
      nextReviewAt: Value(nextReviewAt),
      lastOutcome: Value(lastOutcome),
      userNote: Value(userNote),
    );
  }

  factory MistakeVaultSm2Data.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MistakeVaultSm2Data(
      questionId: serializer.fromJson<String>(json['questionId']),
      easeFactor: serializer.fromJson<double>(json['easeFactor']),
      intervalDays: serializer.fromJson<int>(json['intervalDays']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
      nextReviewAt: serializer.fromJson<DateTime>(json['nextReviewAt']),
      lastOutcome: serializer.fromJson<String>(json['lastOutcome']),
      userNote: serializer.fromJson<String>(json['userNote']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'questionId': serializer.toJson<String>(questionId),
      'easeFactor': serializer.toJson<double>(easeFactor),
      'intervalDays': serializer.toJson<int>(intervalDays),
      'repetitions': serializer.toJson<int>(repetitions),
      'nextReviewAt': serializer.toJson<DateTime>(nextReviewAt),
      'lastOutcome': serializer.toJson<String>(lastOutcome),
      'userNote': serializer.toJson<String>(userNote),
    };
  }

  MistakeVaultSm2Data copyWith({
    String? questionId,
    double? easeFactor,
    int? intervalDays,
    int? repetitions,
    DateTime? nextReviewAt,
    String? lastOutcome,
    String? userNote,
  }) => MistakeVaultSm2Data(
    questionId: questionId ?? this.questionId,
    easeFactor: easeFactor ?? this.easeFactor,
    intervalDays: intervalDays ?? this.intervalDays,
    repetitions: repetitions ?? this.repetitions,
    nextReviewAt: nextReviewAt ?? this.nextReviewAt,
    lastOutcome: lastOutcome ?? this.lastOutcome,
    userNote: userNote ?? this.userNote,
  );
  MistakeVaultSm2Data copyWithCompanion(MistakeVaultSm2Companion data) {
    return MistakeVaultSm2Data(
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      easeFactor: data.easeFactor.present
          ? data.easeFactor.value
          : this.easeFactor,
      intervalDays: data.intervalDays.present
          ? data.intervalDays.value
          : this.intervalDays,
      repetitions: data.repetitions.present
          ? data.repetitions.value
          : this.repetitions,
      nextReviewAt: data.nextReviewAt.present
          ? data.nextReviewAt.value
          : this.nextReviewAt,
      lastOutcome: data.lastOutcome.present
          ? data.lastOutcome.value
          : this.lastOutcome,
      userNote: data.userNote.present ? data.userNote.value : this.userNote,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MistakeVaultSm2Data(')
          ..write('questionId: $questionId, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('repetitions: $repetitions, ')
          ..write('nextReviewAt: $nextReviewAt, ')
          ..write('lastOutcome: $lastOutcome, ')
          ..write('userNote: $userNote')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    questionId,
    easeFactor,
    intervalDays,
    repetitions,
    nextReviewAt,
    lastOutcome,
    userNote,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MistakeVaultSm2Data &&
          other.questionId == this.questionId &&
          other.easeFactor == this.easeFactor &&
          other.intervalDays == this.intervalDays &&
          other.repetitions == this.repetitions &&
          other.nextReviewAt == this.nextReviewAt &&
          other.lastOutcome == this.lastOutcome &&
          other.userNote == this.userNote);
}

class MistakeVaultSm2Companion extends UpdateCompanion<MistakeVaultSm2Data> {
  final Value<String> questionId;
  final Value<double> easeFactor;
  final Value<int> intervalDays;
  final Value<int> repetitions;
  final Value<DateTime> nextReviewAt;
  final Value<String> lastOutcome;
  final Value<String> userNote;
  final Value<int> rowid;
  const MistakeVaultSm2Companion({
    this.questionId = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.nextReviewAt = const Value.absent(),
    this.lastOutcome = const Value.absent(),
    this.userNote = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MistakeVaultSm2Companion.insert({
    required String questionId,
    this.easeFactor = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.repetitions = const Value.absent(),
    required DateTime nextReviewAt,
    this.lastOutcome = const Value.absent(),
    this.userNote = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : questionId = Value(questionId),
       nextReviewAt = Value(nextReviewAt);
  static Insertable<MistakeVaultSm2Data> custom({
    Expression<String>? questionId,
    Expression<double>? easeFactor,
    Expression<int>? intervalDays,
    Expression<int>? repetitions,
    Expression<DateTime>? nextReviewAt,
    Expression<String>? lastOutcome,
    Expression<String>? userNote,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (questionId != null) 'question_id': questionId,
      if (easeFactor != null) 'ease_factor': easeFactor,
      if (intervalDays != null) 'interval_days': intervalDays,
      if (repetitions != null) 'repetitions': repetitions,
      if (nextReviewAt != null) 'next_review_at': nextReviewAt,
      if (lastOutcome != null) 'last_outcome': lastOutcome,
      if (userNote != null) 'user_note': userNote,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MistakeVaultSm2Companion copyWith({
    Value<String>? questionId,
    Value<double>? easeFactor,
    Value<int>? intervalDays,
    Value<int>? repetitions,
    Value<DateTime>? nextReviewAt,
    Value<String>? lastOutcome,
    Value<String>? userNote,
    Value<int>? rowid,
  }) {
    return MistakeVaultSm2Companion(
      questionId: questionId ?? this.questionId,
      easeFactor: easeFactor ?? this.easeFactor,
      intervalDays: intervalDays ?? this.intervalDays,
      repetitions: repetitions ?? this.repetitions,
      nextReviewAt: nextReviewAt ?? this.nextReviewAt,
      lastOutcome: lastOutcome ?? this.lastOutcome,
      userNote: userNote ?? this.userNote,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (easeFactor.present) {
      map['ease_factor'] = Variable<double>(easeFactor.value);
    }
    if (intervalDays.present) {
      map['interval_days'] = Variable<int>(intervalDays.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (nextReviewAt.present) {
      map['next_review_at'] = Variable<DateTime>(nextReviewAt.value);
    }
    if (lastOutcome.present) {
      map['last_outcome'] = Variable<String>(lastOutcome.value);
    }
    if (userNote.present) {
      map['user_note'] = Variable<String>(userNote.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MistakeVaultSm2Companion(')
          ..write('questionId: $questionId, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('repetitions: $repetitions, ')
          ..write('nextReviewAt: $nextReviewAt, ')
          ..write('lastOutcome: $lastOutcome, ')
          ..write('userNote: $userNote, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudyPreferencesTable extends StudyPreferences
    with TableInfo<$StudyPreferencesTable, StudyPreference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudyPreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _activeTrackMeta = const VerificationMeta(
    'activeTrack',
  );
  @override
  late final GeneratedColumn<String> activeTrack = GeneratedColumn<String>(
    'active_track',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('waec_neco'),
  );
  static const VerificationMeta _targetExamDateMeta = const VerificationMeta(
    'targetExamDate',
  );
  @override
  late final GeneratedColumn<DateTime> targetExamDate =
      GeneratedColumn<DateTime>(
        'target_exam_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _dailyGoalMinutesMeta = const VerificationMeta(
    'dailyGoalMinutes',
  );
  @override
  late final GeneratedColumn<int> dailyGoalMinutes = GeneratedColumn<int>(
    'daily_goal_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(20),
  );
  static const VerificationMeta _themeModeMeta = const VerificationMeta(
    'themeMode',
  );
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('light'),
  );
  static const VerificationMeta _fontScaleMeta = const VerificationMeta(
    'fontScale',
  );
  @override
  late final GeneratedColumn<String> fontScale = GeneratedColumn<String>(
    'font_scale',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('normal'),
  );
  static const VerificationMeta _streakDaysMeta = const VerificationMeta(
    'streakDays',
  );
  @override
  late final GeneratedColumn<int> streakDays = GeneratedColumn<int>(
    'streak_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _lastStudyDateMeta = const VerificationMeta(
    'lastStudyDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastStudyDate =
      GeneratedColumn<DateTime>(
        'last_study_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _diagnosticCompletedMeta =
      const VerificationMeta('diagnosticCompleted');
  @override
  late final GeneratedColumn<bool> diagnosticCompleted = GeneratedColumn<bool>(
    'diagnostic_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("diagnostic_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _diagnosticSummaryMeta = const VerificationMeta(
    'diagnosticSummary',
  );
  @override
  late final GeneratedColumn<String> diagnosticSummary =
      GeneratedColumn<String>(
        'diagnostic_summary',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    activeTrack,
    targetExamDate,
    dailyGoalMinutes,
    themeMode,
    fontScale,
    streakDays,
    lastStudyDate,
    diagnosticCompleted,
    diagnosticSummary,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudyPreference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('active_track')) {
      context.handle(
        _activeTrackMeta,
        activeTrack.isAcceptableOrUnknown(
          data['active_track']!,
          _activeTrackMeta,
        ),
      );
    }
    if (data.containsKey('target_exam_date')) {
      context.handle(
        _targetExamDateMeta,
        targetExamDate.isAcceptableOrUnknown(
          data['target_exam_date']!,
          _targetExamDateMeta,
        ),
      );
    }
    if (data.containsKey('daily_goal_minutes')) {
      context.handle(
        _dailyGoalMinutesMeta,
        dailyGoalMinutes.isAcceptableOrUnknown(
          data['daily_goal_minutes']!,
          _dailyGoalMinutesMeta,
        ),
      );
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _themeModeMeta,
        themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta),
      );
    }
    if (data.containsKey('font_scale')) {
      context.handle(
        _fontScaleMeta,
        fontScale.isAcceptableOrUnknown(data['font_scale']!, _fontScaleMeta),
      );
    }
    if (data.containsKey('streak_days')) {
      context.handle(
        _streakDaysMeta,
        streakDays.isAcceptableOrUnknown(data['streak_days']!, _streakDaysMeta),
      );
    }
    if (data.containsKey('last_study_date')) {
      context.handle(
        _lastStudyDateMeta,
        lastStudyDate.isAcceptableOrUnknown(
          data['last_study_date']!,
          _lastStudyDateMeta,
        ),
      );
    }
    if (data.containsKey('diagnostic_completed')) {
      context.handle(
        _diagnosticCompletedMeta,
        diagnosticCompleted.isAcceptableOrUnknown(
          data['diagnostic_completed']!,
          _diagnosticCompletedMeta,
        ),
      );
    }
    if (data.containsKey('diagnostic_summary')) {
      context.handle(
        _diagnosticSummaryMeta,
        diagnosticSummary.isAcceptableOrUnknown(
          data['diagnostic_summary']!,
          _diagnosticSummaryMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudyPreference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudyPreference(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      activeTrack: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}active_track'],
      )!,
      targetExamDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}target_exam_date'],
      ),
      dailyGoalMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_goal_minutes'],
      )!,
      themeMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_mode'],
      )!,
      fontScale: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}font_scale'],
      )!,
      streakDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak_days'],
      )!,
      lastStudyDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_study_date'],
      ),
      diagnosticCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}diagnostic_completed'],
      )!,
      diagnosticSummary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}diagnostic_summary'],
      )!,
    );
  }

  @override
  $StudyPreferencesTable createAlias(String alias) {
    return $StudyPreferencesTable(attachedDatabase, alias);
  }
}

class StudyPreference extends DataClass implements Insertable<StudyPreference> {
  final int id;
  final String activeTrack;
  final DateTime? targetExamDate;
  final int dailyGoalMinutes;
  final String themeMode;
  final String fontScale;
  final int streakDays;
  final DateTime? lastStudyDate;
  final bool diagnosticCompleted;
  final String diagnosticSummary;
  const StudyPreference({
    required this.id,
    required this.activeTrack,
    this.targetExamDate,
    required this.dailyGoalMinutes,
    required this.themeMode,
    required this.fontScale,
    required this.streakDays,
    this.lastStudyDate,
    required this.diagnosticCompleted,
    required this.diagnosticSummary,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['active_track'] = Variable<String>(activeTrack);
    if (!nullToAbsent || targetExamDate != null) {
      map['target_exam_date'] = Variable<DateTime>(targetExamDate);
    }
    map['daily_goal_minutes'] = Variable<int>(dailyGoalMinutes);
    map['theme_mode'] = Variable<String>(themeMode);
    map['font_scale'] = Variable<String>(fontScale);
    map['streak_days'] = Variable<int>(streakDays);
    if (!nullToAbsent || lastStudyDate != null) {
      map['last_study_date'] = Variable<DateTime>(lastStudyDate);
    }
    map['diagnostic_completed'] = Variable<bool>(diagnosticCompleted);
    map['diagnostic_summary'] = Variable<String>(diagnosticSummary);
    return map;
  }

  StudyPreferencesCompanion toCompanion(bool nullToAbsent) {
    return StudyPreferencesCompanion(
      id: Value(id),
      activeTrack: Value(activeTrack),
      targetExamDate: targetExamDate == null && nullToAbsent
          ? const Value.absent()
          : Value(targetExamDate),
      dailyGoalMinutes: Value(dailyGoalMinutes),
      themeMode: Value(themeMode),
      fontScale: Value(fontScale),
      streakDays: Value(streakDays),
      lastStudyDate: lastStudyDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastStudyDate),
      diagnosticCompleted: Value(diagnosticCompleted),
      diagnosticSummary: Value(diagnosticSummary),
    );
  }

  factory StudyPreference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudyPreference(
      id: serializer.fromJson<int>(json['id']),
      activeTrack: serializer.fromJson<String>(json['activeTrack']),
      targetExamDate: serializer.fromJson<DateTime?>(json['targetExamDate']),
      dailyGoalMinutes: serializer.fromJson<int>(json['dailyGoalMinutes']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      fontScale: serializer.fromJson<String>(json['fontScale']),
      streakDays: serializer.fromJson<int>(json['streakDays']),
      lastStudyDate: serializer.fromJson<DateTime?>(json['lastStudyDate']),
      diagnosticCompleted: serializer.fromJson<bool>(
        json['diagnosticCompleted'],
      ),
      diagnosticSummary: serializer.fromJson<String>(json['diagnosticSummary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activeTrack': serializer.toJson<String>(activeTrack),
      'targetExamDate': serializer.toJson<DateTime?>(targetExamDate),
      'dailyGoalMinutes': serializer.toJson<int>(dailyGoalMinutes),
      'themeMode': serializer.toJson<String>(themeMode),
      'fontScale': serializer.toJson<String>(fontScale),
      'streakDays': serializer.toJson<int>(streakDays),
      'lastStudyDate': serializer.toJson<DateTime?>(lastStudyDate),
      'diagnosticCompleted': serializer.toJson<bool>(diagnosticCompleted),
      'diagnosticSummary': serializer.toJson<String>(diagnosticSummary),
    };
  }

  StudyPreference copyWith({
    int? id,
    String? activeTrack,
    Value<DateTime?> targetExamDate = const Value.absent(),
    int? dailyGoalMinutes,
    String? themeMode,
    String? fontScale,
    int? streakDays,
    Value<DateTime?> lastStudyDate = const Value.absent(),
    bool? diagnosticCompleted,
    String? diagnosticSummary,
  }) => StudyPreference(
    id: id ?? this.id,
    activeTrack: activeTrack ?? this.activeTrack,
    targetExamDate: targetExamDate.present
        ? targetExamDate.value
        : this.targetExamDate,
    dailyGoalMinutes: dailyGoalMinutes ?? this.dailyGoalMinutes,
    themeMode: themeMode ?? this.themeMode,
    fontScale: fontScale ?? this.fontScale,
    streakDays: streakDays ?? this.streakDays,
    lastStudyDate: lastStudyDate.present
        ? lastStudyDate.value
        : this.lastStudyDate,
    diagnosticCompleted: diagnosticCompleted ?? this.diagnosticCompleted,
    diagnosticSummary: diagnosticSummary ?? this.diagnosticSummary,
  );
  StudyPreference copyWithCompanion(StudyPreferencesCompanion data) {
    return StudyPreference(
      id: data.id.present ? data.id.value : this.id,
      activeTrack: data.activeTrack.present
          ? data.activeTrack.value
          : this.activeTrack,
      targetExamDate: data.targetExamDate.present
          ? data.targetExamDate.value
          : this.targetExamDate,
      dailyGoalMinutes: data.dailyGoalMinutes.present
          ? data.dailyGoalMinutes.value
          : this.dailyGoalMinutes,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      fontScale: data.fontScale.present ? data.fontScale.value : this.fontScale,
      streakDays: data.streakDays.present
          ? data.streakDays.value
          : this.streakDays,
      lastStudyDate: data.lastStudyDate.present
          ? data.lastStudyDate.value
          : this.lastStudyDate,
      diagnosticCompleted: data.diagnosticCompleted.present
          ? data.diagnosticCompleted.value
          : this.diagnosticCompleted,
      diagnosticSummary: data.diagnosticSummary.present
          ? data.diagnosticSummary.value
          : this.diagnosticSummary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudyPreference(')
          ..write('id: $id, ')
          ..write('activeTrack: $activeTrack, ')
          ..write('targetExamDate: $targetExamDate, ')
          ..write('dailyGoalMinutes: $dailyGoalMinutes, ')
          ..write('themeMode: $themeMode, ')
          ..write('fontScale: $fontScale, ')
          ..write('streakDays: $streakDays, ')
          ..write('lastStudyDate: $lastStudyDate, ')
          ..write('diagnosticCompleted: $diagnosticCompleted, ')
          ..write('diagnosticSummary: $diagnosticSummary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    activeTrack,
    targetExamDate,
    dailyGoalMinutes,
    themeMode,
    fontScale,
    streakDays,
    lastStudyDate,
    diagnosticCompleted,
    diagnosticSummary,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudyPreference &&
          other.id == this.id &&
          other.activeTrack == this.activeTrack &&
          other.targetExamDate == this.targetExamDate &&
          other.dailyGoalMinutes == this.dailyGoalMinutes &&
          other.themeMode == this.themeMode &&
          other.fontScale == this.fontScale &&
          other.streakDays == this.streakDays &&
          other.lastStudyDate == this.lastStudyDate &&
          other.diagnosticCompleted == this.diagnosticCompleted &&
          other.diagnosticSummary == this.diagnosticSummary);
}

class StudyPreferencesCompanion extends UpdateCompanion<StudyPreference> {
  final Value<int> id;
  final Value<String> activeTrack;
  final Value<DateTime?> targetExamDate;
  final Value<int> dailyGoalMinutes;
  final Value<String> themeMode;
  final Value<String> fontScale;
  final Value<int> streakDays;
  final Value<DateTime?> lastStudyDate;
  final Value<bool> diagnosticCompleted;
  final Value<String> diagnosticSummary;
  const StudyPreferencesCompanion({
    this.id = const Value.absent(),
    this.activeTrack = const Value.absent(),
    this.targetExamDate = const Value.absent(),
    this.dailyGoalMinutes = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.fontScale = const Value.absent(),
    this.streakDays = const Value.absent(),
    this.lastStudyDate = const Value.absent(),
    this.diagnosticCompleted = const Value.absent(),
    this.diagnosticSummary = const Value.absent(),
  });
  StudyPreferencesCompanion.insert({
    this.id = const Value.absent(),
    this.activeTrack = const Value.absent(),
    this.targetExamDate = const Value.absent(),
    this.dailyGoalMinutes = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.fontScale = const Value.absent(),
    this.streakDays = const Value.absent(),
    this.lastStudyDate = const Value.absent(),
    this.diagnosticCompleted = const Value.absent(),
    this.diagnosticSummary = const Value.absent(),
  });
  static Insertable<StudyPreference> custom({
    Expression<int>? id,
    Expression<String>? activeTrack,
    Expression<DateTime>? targetExamDate,
    Expression<int>? dailyGoalMinutes,
    Expression<String>? themeMode,
    Expression<String>? fontScale,
    Expression<int>? streakDays,
    Expression<DateTime>? lastStudyDate,
    Expression<bool>? diagnosticCompleted,
    Expression<String>? diagnosticSummary,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activeTrack != null) 'active_track': activeTrack,
      if (targetExamDate != null) 'target_exam_date': targetExamDate,
      if (dailyGoalMinutes != null) 'daily_goal_minutes': dailyGoalMinutes,
      if (themeMode != null) 'theme_mode': themeMode,
      if (fontScale != null) 'font_scale': fontScale,
      if (streakDays != null) 'streak_days': streakDays,
      if (lastStudyDate != null) 'last_study_date': lastStudyDate,
      if (diagnosticCompleted != null)
        'diagnostic_completed': diagnosticCompleted,
      if (diagnosticSummary != null) 'diagnostic_summary': diagnosticSummary,
    });
  }

  StudyPreferencesCompanion copyWith({
    Value<int>? id,
    Value<String>? activeTrack,
    Value<DateTime?>? targetExamDate,
    Value<int>? dailyGoalMinutes,
    Value<String>? themeMode,
    Value<String>? fontScale,
    Value<int>? streakDays,
    Value<DateTime?>? lastStudyDate,
    Value<bool>? diagnosticCompleted,
    Value<String>? diagnosticSummary,
  }) {
    return StudyPreferencesCompanion(
      id: id ?? this.id,
      activeTrack: activeTrack ?? this.activeTrack,
      targetExamDate: targetExamDate ?? this.targetExamDate,
      dailyGoalMinutes: dailyGoalMinutes ?? this.dailyGoalMinutes,
      themeMode: themeMode ?? this.themeMode,
      fontScale: fontScale ?? this.fontScale,
      streakDays: streakDays ?? this.streakDays,
      lastStudyDate: lastStudyDate ?? this.lastStudyDate,
      diagnosticCompleted: diagnosticCompleted ?? this.diagnosticCompleted,
      diagnosticSummary: diagnosticSummary ?? this.diagnosticSummary,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activeTrack.present) {
      map['active_track'] = Variable<String>(activeTrack.value);
    }
    if (targetExamDate.present) {
      map['target_exam_date'] = Variable<DateTime>(targetExamDate.value);
    }
    if (dailyGoalMinutes.present) {
      map['daily_goal_minutes'] = Variable<int>(dailyGoalMinutes.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (fontScale.present) {
      map['font_scale'] = Variable<String>(fontScale.value);
    }
    if (streakDays.present) {
      map['streak_days'] = Variable<int>(streakDays.value);
    }
    if (lastStudyDate.present) {
      map['last_study_date'] = Variable<DateTime>(lastStudyDate.value);
    }
    if (diagnosticCompleted.present) {
      map['diagnostic_completed'] = Variable<bool>(diagnosticCompleted.value);
    }
    if (diagnosticSummary.present) {
      map['diagnostic_summary'] = Variable<String>(diagnosticSummary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudyPreferencesCompanion(')
          ..write('id: $id, ')
          ..write('activeTrack: $activeTrack, ')
          ..write('targetExamDate: $targetExamDate, ')
          ..write('dailyGoalMinutes: $dailyGoalMinutes, ')
          ..write('themeMode: $themeMode, ')
          ..write('fontScale: $fontScale, ')
          ..write('streakDays: $streakDays, ')
          ..write('lastStudyDate: $lastStudyDate, ')
          ..write('diagnosticCompleted: $diagnosticCompleted, ')
          ..write('diagnosticSummary: $diagnosticSummary')
          ..write(')'))
        .toString();
  }
}

class $LessonProgressTable extends LessonProgress
    with TableInfo<$LessonProgressTable, LessonProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LessonProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<String> lessonId = GeneratedColumn<String>(
    'lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lessons (id)',
    ),
  );
  static const VerificationMeta _completedStepsMeta = const VerificationMeta(
    'completedSteps',
  );
  @override
  late final GeneratedColumn<int> completedSteps = GeneratedColumn<int>(
    'completed_steps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalStepsMeta = const VerificationMeta(
    'totalSteps',
  );
  @override
  late final GeneratedColumn<int> totalSteps = GeneratedColumn<int>(
    'total_steps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lessonId,
    completedSteps,
    totalSteps,
    isCompleted,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lesson_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<LessonProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lessonIdMeta);
    }
    if (data.containsKey('completed_steps')) {
      context.handle(
        _completedStepsMeta,
        completedSteps.isAcceptableOrUnknown(
          data['completed_steps']!,
          _completedStepsMeta,
        ),
      );
    }
    if (data.containsKey('total_steps')) {
      context.handle(
        _totalStepsMeta,
        totalSteps.isAcceptableOrUnknown(data['total_steps']!, _totalStepsMeta),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lessonId};
  @override
  LessonProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LessonProgressData(
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lesson_id'],
      )!,
      completedSteps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_steps'],
      )!,
      totalSteps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_steps'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LessonProgressTable createAlias(String alias) {
    return $LessonProgressTable(attachedDatabase, alias);
  }
}

class LessonProgressData extends DataClass
    implements Insertable<LessonProgressData> {
  final String lessonId;
  final int completedSteps;
  final int totalSteps;
  final bool isCompleted;
  final DateTime updatedAt;
  const LessonProgressData({
    required this.lessonId,
    required this.completedSteps,
    required this.totalSteps,
    required this.isCompleted,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['lesson_id'] = Variable<String>(lessonId);
    map['completed_steps'] = Variable<int>(completedSteps);
    map['total_steps'] = Variable<int>(totalSteps);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LessonProgressCompanion toCompanion(bool nullToAbsent) {
    return LessonProgressCompanion(
      lessonId: Value(lessonId),
      completedSteps: Value(completedSteps),
      totalSteps: Value(totalSteps),
      isCompleted: Value(isCompleted),
      updatedAt: Value(updatedAt),
    );
  }

  factory LessonProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LessonProgressData(
      lessonId: serializer.fromJson<String>(json['lessonId']),
      completedSteps: serializer.fromJson<int>(json['completedSteps']),
      totalSteps: serializer.fromJson<int>(json['totalSteps']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lessonId': serializer.toJson<String>(lessonId),
      'completedSteps': serializer.toJson<int>(completedSteps),
      'totalSteps': serializer.toJson<int>(totalSteps),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LessonProgressData copyWith({
    String? lessonId,
    int? completedSteps,
    int? totalSteps,
    bool? isCompleted,
    DateTime? updatedAt,
  }) => LessonProgressData(
    lessonId: lessonId ?? this.lessonId,
    completedSteps: completedSteps ?? this.completedSteps,
    totalSteps: totalSteps ?? this.totalSteps,
    isCompleted: isCompleted ?? this.isCompleted,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LessonProgressData copyWithCompanion(LessonProgressCompanion data) {
    return LessonProgressData(
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      completedSteps: data.completedSteps.present
          ? data.completedSteps.value
          : this.completedSteps,
      totalSteps: data.totalSteps.present
          ? data.totalSteps.value
          : this.totalSteps,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LessonProgressData(')
          ..write('lessonId: $lessonId, ')
          ..write('completedSteps: $completedSteps, ')
          ..write('totalSteps: $totalSteps, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(lessonId, completedSteps, totalSteps, isCompleted, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LessonProgressData &&
          other.lessonId == this.lessonId &&
          other.completedSteps == this.completedSteps &&
          other.totalSteps == this.totalSteps &&
          other.isCompleted == this.isCompleted &&
          other.updatedAt == this.updatedAt);
}

class LessonProgressCompanion extends UpdateCompanion<LessonProgressData> {
  final Value<String> lessonId;
  final Value<int> completedSteps;
  final Value<int> totalSteps;
  final Value<bool> isCompleted;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LessonProgressCompanion({
    this.lessonId = const Value.absent(),
    this.completedSteps = const Value.absent(),
    this.totalSteps = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LessonProgressCompanion.insert({
    required String lessonId,
    this.completedSteps = const Value.absent(),
    this.totalSteps = const Value.absent(),
    this.isCompleted = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : lessonId = Value(lessonId),
       updatedAt = Value(updatedAt);
  static Insertable<LessonProgressData> custom({
    Expression<String>? lessonId,
    Expression<int>? completedSteps,
    Expression<int>? totalSteps,
    Expression<bool>? isCompleted,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (lessonId != null) 'lesson_id': lessonId,
      if (completedSteps != null) 'completed_steps': completedSteps,
      if (totalSteps != null) 'total_steps': totalSteps,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LessonProgressCompanion copyWith({
    Value<String>? lessonId,
    Value<int>? completedSteps,
    Value<int>? totalSteps,
    Value<bool>? isCompleted,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return LessonProgressCompanion(
      lessonId: lessonId ?? this.lessonId,
      completedSteps: completedSteps ?? this.completedSteps,
      totalSteps: totalSteps ?? this.totalSteps,
      isCompleted: isCompleted ?? this.isCompleted,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lessonId.present) {
      map['lesson_id'] = Variable<String>(lessonId.value);
    }
    if (completedSteps.present) {
      map['completed_steps'] = Variable<int>(completedSteps.value);
    }
    if (totalSteps.present) {
      map['total_steps'] = Variable<int>(totalSteps.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LessonProgressCompanion(')
          ..write('lessonId: $lessonId, ')
          ..write('completedSteps: $completedSteps, ')
          ..write('totalSteps: $totalSteps, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActiveExamSessionsTable extends ActiveExamSessions
    with TableInfo<$ActiveExamSessionsTable, ActiveExamSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActiveExamSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trackMeta = const VerificationMeta('track');
  @override
  late final GeneratedColumn<String> track = GeneratedColumn<String>(
    'track',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionIdsJsonMeta = const VerificationMeta(
    'questionIdsJson',
  );
  @override
  late final GeneratedColumn<String> questionIdsJson = GeneratedColumn<String>(
    'question_ids_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _answersJsonMeta = const VerificationMeta(
    'answersJson',
  );
  @override
  late final GeneratedColumn<String> answersJson = GeneratedColumn<String>(
    'answers_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remainingSecondsMeta = const VerificationMeta(
    'remainingSeconds',
  );
  @override
  late final GeneratedColumn<int> remainingSeconds = GeneratedColumn<int>(
    'remaining_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentIndexMeta = const VerificationMeta(
    'currentIndex',
  );
  @override
  late final GeneratedColumn<int> currentIndex = GeneratedColumn<int>(
    'current_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    track,
    mode,
    title,
    questionIdsJson,
    answersJson,
    remainingSeconds,
    currentIndex,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'active_exam_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActiveExamSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('track')) {
      context.handle(
        _trackMeta,
        track.isAcceptableOrUnknown(data['track']!, _trackMeta),
      );
    } else if (isInserting) {
      context.missing(_trackMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('question_ids_json')) {
      context.handle(
        _questionIdsJsonMeta,
        questionIdsJson.isAcceptableOrUnknown(
          data['question_ids_json']!,
          _questionIdsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_questionIdsJsonMeta);
    }
    if (data.containsKey('answers_json')) {
      context.handle(
        _answersJsonMeta,
        answersJson.isAcceptableOrUnknown(
          data['answers_json']!,
          _answersJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_answersJsonMeta);
    }
    if (data.containsKey('remaining_seconds')) {
      context.handle(
        _remainingSecondsMeta,
        remainingSeconds.isAcceptableOrUnknown(
          data['remaining_seconds']!,
          _remainingSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_remainingSecondsMeta);
    }
    if (data.containsKey('current_index')) {
      context.handle(
        _currentIndexMeta,
        currentIndex.isAcceptableOrUnknown(
          data['current_index']!,
          _currentIndexMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActiveExamSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActiveExamSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      track: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track'],
      )!,
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      questionIdsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_ids_json'],
      )!,
      answersJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answers_json'],
      )!,
      remainingSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remaining_seconds'],
      )!,
      currentIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_index'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ActiveExamSessionsTable createAlias(String alias) {
    return $ActiveExamSessionsTable(attachedDatabase, alias);
  }
}

class ActiveExamSession extends DataClass
    implements Insertable<ActiveExamSession> {
  final String id;
  final String track;
  final String mode;
  final String title;
  final String questionIdsJson;
  final String answersJson;
  final int remainingSeconds;
  final int currentIndex;
  final DateTime updatedAt;
  const ActiveExamSession({
    required this.id,
    required this.track,
    required this.mode,
    required this.title,
    required this.questionIdsJson,
    required this.answersJson,
    required this.remainingSeconds,
    required this.currentIndex,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['track'] = Variable<String>(track);
    map['mode'] = Variable<String>(mode);
    map['title'] = Variable<String>(title);
    map['question_ids_json'] = Variable<String>(questionIdsJson);
    map['answers_json'] = Variable<String>(answersJson);
    map['remaining_seconds'] = Variable<int>(remainingSeconds);
    map['current_index'] = Variable<int>(currentIndex);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ActiveExamSessionsCompanion toCompanion(bool nullToAbsent) {
    return ActiveExamSessionsCompanion(
      id: Value(id),
      track: Value(track),
      mode: Value(mode),
      title: Value(title),
      questionIdsJson: Value(questionIdsJson),
      answersJson: Value(answersJson),
      remainingSeconds: Value(remainingSeconds),
      currentIndex: Value(currentIndex),
      updatedAt: Value(updatedAt),
    );
  }

  factory ActiveExamSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActiveExamSession(
      id: serializer.fromJson<String>(json['id']),
      track: serializer.fromJson<String>(json['track']),
      mode: serializer.fromJson<String>(json['mode']),
      title: serializer.fromJson<String>(json['title']),
      questionIdsJson: serializer.fromJson<String>(json['questionIdsJson']),
      answersJson: serializer.fromJson<String>(json['answersJson']),
      remainingSeconds: serializer.fromJson<int>(json['remainingSeconds']),
      currentIndex: serializer.fromJson<int>(json['currentIndex']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'track': serializer.toJson<String>(track),
      'mode': serializer.toJson<String>(mode),
      'title': serializer.toJson<String>(title),
      'questionIdsJson': serializer.toJson<String>(questionIdsJson),
      'answersJson': serializer.toJson<String>(answersJson),
      'remainingSeconds': serializer.toJson<int>(remainingSeconds),
      'currentIndex': serializer.toJson<int>(currentIndex),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ActiveExamSession copyWith({
    String? id,
    String? track,
    String? mode,
    String? title,
    String? questionIdsJson,
    String? answersJson,
    int? remainingSeconds,
    int? currentIndex,
    DateTime? updatedAt,
  }) => ActiveExamSession(
    id: id ?? this.id,
    track: track ?? this.track,
    mode: mode ?? this.mode,
    title: title ?? this.title,
    questionIdsJson: questionIdsJson ?? this.questionIdsJson,
    answersJson: answersJson ?? this.answersJson,
    remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    currentIndex: currentIndex ?? this.currentIndex,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ActiveExamSession copyWithCompanion(ActiveExamSessionsCompanion data) {
    return ActiveExamSession(
      id: data.id.present ? data.id.value : this.id,
      track: data.track.present ? data.track.value : this.track,
      mode: data.mode.present ? data.mode.value : this.mode,
      title: data.title.present ? data.title.value : this.title,
      questionIdsJson: data.questionIdsJson.present
          ? data.questionIdsJson.value
          : this.questionIdsJson,
      answersJson: data.answersJson.present
          ? data.answersJson.value
          : this.answersJson,
      remainingSeconds: data.remainingSeconds.present
          ? data.remainingSeconds.value
          : this.remainingSeconds,
      currentIndex: data.currentIndex.present
          ? data.currentIndex.value
          : this.currentIndex,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActiveExamSession(')
          ..write('id: $id, ')
          ..write('track: $track, ')
          ..write('mode: $mode, ')
          ..write('title: $title, ')
          ..write('questionIdsJson: $questionIdsJson, ')
          ..write('answersJson: $answersJson, ')
          ..write('remainingSeconds: $remainingSeconds, ')
          ..write('currentIndex: $currentIndex, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    track,
    mode,
    title,
    questionIdsJson,
    answersJson,
    remainingSeconds,
    currentIndex,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActiveExamSession &&
          other.id == this.id &&
          other.track == this.track &&
          other.mode == this.mode &&
          other.title == this.title &&
          other.questionIdsJson == this.questionIdsJson &&
          other.answersJson == this.answersJson &&
          other.remainingSeconds == this.remainingSeconds &&
          other.currentIndex == this.currentIndex &&
          other.updatedAt == this.updatedAt);
}

class ActiveExamSessionsCompanion extends UpdateCompanion<ActiveExamSession> {
  final Value<String> id;
  final Value<String> track;
  final Value<String> mode;
  final Value<String> title;
  final Value<String> questionIdsJson;
  final Value<String> answersJson;
  final Value<int> remainingSeconds;
  final Value<int> currentIndex;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ActiveExamSessionsCompanion({
    this.id = const Value.absent(),
    this.track = const Value.absent(),
    this.mode = const Value.absent(),
    this.title = const Value.absent(),
    this.questionIdsJson = const Value.absent(),
    this.answersJson = const Value.absent(),
    this.remainingSeconds = const Value.absent(),
    this.currentIndex = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActiveExamSessionsCompanion.insert({
    required String id,
    required String track,
    required String mode,
    required String title,
    required String questionIdsJson,
    required String answersJson,
    required int remainingSeconds,
    this.currentIndex = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       track = Value(track),
       mode = Value(mode),
       title = Value(title),
       questionIdsJson = Value(questionIdsJson),
       answersJson = Value(answersJson),
       remainingSeconds = Value(remainingSeconds),
       updatedAt = Value(updatedAt);
  static Insertable<ActiveExamSession> custom({
    Expression<String>? id,
    Expression<String>? track,
    Expression<String>? mode,
    Expression<String>? title,
    Expression<String>? questionIdsJson,
    Expression<String>? answersJson,
    Expression<int>? remainingSeconds,
    Expression<int>? currentIndex,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (track != null) 'track': track,
      if (mode != null) 'mode': mode,
      if (title != null) 'title': title,
      if (questionIdsJson != null) 'question_ids_json': questionIdsJson,
      if (answersJson != null) 'answers_json': answersJson,
      if (remainingSeconds != null) 'remaining_seconds': remainingSeconds,
      if (currentIndex != null) 'current_index': currentIndex,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActiveExamSessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? track,
    Value<String>? mode,
    Value<String>? title,
    Value<String>? questionIdsJson,
    Value<String>? answersJson,
    Value<int>? remainingSeconds,
    Value<int>? currentIndex,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ActiveExamSessionsCompanion(
      id: id ?? this.id,
      track: track ?? this.track,
      mode: mode ?? this.mode,
      title: title ?? this.title,
      questionIdsJson: questionIdsJson ?? this.questionIdsJson,
      answersJson: answersJson ?? this.answersJson,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      currentIndex: currentIndex ?? this.currentIndex,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (track.present) {
      map['track'] = Variable<String>(track.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (questionIdsJson.present) {
      map['question_ids_json'] = Variable<String>(questionIdsJson.value);
    }
    if (answersJson.present) {
      map['answers_json'] = Variable<String>(answersJson.value);
    }
    if (remainingSeconds.present) {
      map['remaining_seconds'] = Variable<int>(remainingSeconds.value);
    }
    if (currentIndex.present) {
      map['current_index'] = Variable<int>(currentIndex.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActiveExamSessionsCompanion(')
          ..write('id: $id, ')
          ..write('track: $track, ')
          ..write('mode: $mode, ')
          ..write('title: $title, ')
          ..write('questionIdsJson: $questionIdsJson, ')
          ..write('answersJson: $answersJson, ')
          ..write('remainingSeconds: $remainingSeconds, ')
          ..write('currentIndex: $currentIndex, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExamAttemptsTable extends ExamAttempts
    with TableInfo<$ExamAttemptsTable, ExamAttempt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamAttemptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trackMeta = const VerificationMeta('track');
  @override
  late final GeneratedColumn<String> track = GeneratedColumn<String>(
    'track',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rawCorrectMeta = const VerificationMeta(
    'rawCorrect',
  );
  @override
  late final GeneratedColumn<int> rawCorrect = GeneratedColumn<int>(
    'raw_correct',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalQuestionsMeta = const VerificationMeta(
    'totalQuestions',
  );
  @override
  late final GeneratedColumn<int> totalQuestions = GeneratedColumn<int>(
    'total_questions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scaledScoreMeta = const VerificationMeta(
    'scaledScore',
  );
  @override
  late final GeneratedColumn<int> scaledScore = GeneratedColumn<int>(
    'scaled_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scaledMaxMeta = const VerificationMeta(
    'scaledMax',
  );
  @override
  late final GeneratedColumn<int> scaledMax = GeneratedColumn<int>(
    'scaled_max',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gradeCodeMeta = const VerificationMeta(
    'gradeCode',
  );
  @override
  late final GeneratedColumn<String> gradeCode = GeneratedColumn<String>(
    'grade_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    track,
    title,
    rawCorrect,
    totalQuestions,
    scaledScore,
    scaledMax,
    gradeCode,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exam_attempts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExamAttempt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('track')) {
      context.handle(
        _trackMeta,
        track.isAcceptableOrUnknown(data['track']!, _trackMeta),
      );
    } else if (isInserting) {
      context.missing(_trackMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('raw_correct')) {
      context.handle(
        _rawCorrectMeta,
        rawCorrect.isAcceptableOrUnknown(data['raw_correct']!, _rawCorrectMeta),
      );
    } else if (isInserting) {
      context.missing(_rawCorrectMeta);
    }
    if (data.containsKey('total_questions')) {
      context.handle(
        _totalQuestionsMeta,
        totalQuestions.isAcceptableOrUnknown(
          data['total_questions']!,
          _totalQuestionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalQuestionsMeta);
    }
    if (data.containsKey('scaled_score')) {
      context.handle(
        _scaledScoreMeta,
        scaledScore.isAcceptableOrUnknown(
          data['scaled_score']!,
          _scaledScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scaledScoreMeta);
    }
    if (data.containsKey('scaled_max')) {
      context.handle(
        _scaledMaxMeta,
        scaledMax.isAcceptableOrUnknown(data['scaled_max']!, _scaledMaxMeta),
      );
    } else if (isInserting) {
      context.missing(_scaledMaxMeta);
    }
    if (data.containsKey('grade_code')) {
      context.handle(
        _gradeCodeMeta,
        gradeCode.isAcceptableOrUnknown(data['grade_code']!, _gradeCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_gradeCodeMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExamAttempt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExamAttempt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      track: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      rawCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}raw_correct'],
      )!,
      totalQuestions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_questions'],
      )!,
      scaledScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}scaled_score'],
      )!,
      scaledMax: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}scaled_max'],
      )!,
      gradeCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grade_code'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
    );
  }

  @override
  $ExamAttemptsTable createAlias(String alias) {
    return $ExamAttemptsTable(attachedDatabase, alias);
  }
}

class ExamAttempt extends DataClass implements Insertable<ExamAttempt> {
  final String id;
  final String track;
  final String title;
  final int rawCorrect;
  final int totalQuestions;
  final int scaledScore;
  final int scaledMax;
  final String gradeCode;
  final DateTime completedAt;
  const ExamAttempt({
    required this.id,
    required this.track,
    required this.title,
    required this.rawCorrect,
    required this.totalQuestions,
    required this.scaledScore,
    required this.scaledMax,
    required this.gradeCode,
    required this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['track'] = Variable<String>(track);
    map['title'] = Variable<String>(title);
    map['raw_correct'] = Variable<int>(rawCorrect);
    map['total_questions'] = Variable<int>(totalQuestions);
    map['scaled_score'] = Variable<int>(scaledScore);
    map['scaled_max'] = Variable<int>(scaledMax);
    map['grade_code'] = Variable<String>(gradeCode);
    map['completed_at'] = Variable<DateTime>(completedAt);
    return map;
  }

  ExamAttemptsCompanion toCompanion(bool nullToAbsent) {
    return ExamAttemptsCompanion(
      id: Value(id),
      track: Value(track),
      title: Value(title),
      rawCorrect: Value(rawCorrect),
      totalQuestions: Value(totalQuestions),
      scaledScore: Value(scaledScore),
      scaledMax: Value(scaledMax),
      gradeCode: Value(gradeCode),
      completedAt: Value(completedAt),
    );
  }

  factory ExamAttempt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExamAttempt(
      id: serializer.fromJson<String>(json['id']),
      track: serializer.fromJson<String>(json['track']),
      title: serializer.fromJson<String>(json['title']),
      rawCorrect: serializer.fromJson<int>(json['rawCorrect']),
      totalQuestions: serializer.fromJson<int>(json['totalQuestions']),
      scaledScore: serializer.fromJson<int>(json['scaledScore']),
      scaledMax: serializer.fromJson<int>(json['scaledMax']),
      gradeCode: serializer.fromJson<String>(json['gradeCode']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'track': serializer.toJson<String>(track),
      'title': serializer.toJson<String>(title),
      'rawCorrect': serializer.toJson<int>(rawCorrect),
      'totalQuestions': serializer.toJson<int>(totalQuestions),
      'scaledScore': serializer.toJson<int>(scaledScore),
      'scaledMax': serializer.toJson<int>(scaledMax),
      'gradeCode': serializer.toJson<String>(gradeCode),
      'completedAt': serializer.toJson<DateTime>(completedAt),
    };
  }

  ExamAttempt copyWith({
    String? id,
    String? track,
    String? title,
    int? rawCorrect,
    int? totalQuestions,
    int? scaledScore,
    int? scaledMax,
    String? gradeCode,
    DateTime? completedAt,
  }) => ExamAttempt(
    id: id ?? this.id,
    track: track ?? this.track,
    title: title ?? this.title,
    rawCorrect: rawCorrect ?? this.rawCorrect,
    totalQuestions: totalQuestions ?? this.totalQuestions,
    scaledScore: scaledScore ?? this.scaledScore,
    scaledMax: scaledMax ?? this.scaledMax,
    gradeCode: gradeCode ?? this.gradeCode,
    completedAt: completedAt ?? this.completedAt,
  );
  ExamAttempt copyWithCompanion(ExamAttemptsCompanion data) {
    return ExamAttempt(
      id: data.id.present ? data.id.value : this.id,
      track: data.track.present ? data.track.value : this.track,
      title: data.title.present ? data.title.value : this.title,
      rawCorrect: data.rawCorrect.present
          ? data.rawCorrect.value
          : this.rawCorrect,
      totalQuestions: data.totalQuestions.present
          ? data.totalQuestions.value
          : this.totalQuestions,
      scaledScore: data.scaledScore.present
          ? data.scaledScore.value
          : this.scaledScore,
      scaledMax: data.scaledMax.present ? data.scaledMax.value : this.scaledMax,
      gradeCode: data.gradeCode.present ? data.gradeCode.value : this.gradeCode,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExamAttempt(')
          ..write('id: $id, ')
          ..write('track: $track, ')
          ..write('title: $title, ')
          ..write('rawCorrect: $rawCorrect, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('scaledScore: $scaledScore, ')
          ..write('scaledMax: $scaledMax, ')
          ..write('gradeCode: $gradeCode, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    track,
    title,
    rawCorrect,
    totalQuestions,
    scaledScore,
    scaledMax,
    gradeCode,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExamAttempt &&
          other.id == this.id &&
          other.track == this.track &&
          other.title == this.title &&
          other.rawCorrect == this.rawCorrect &&
          other.totalQuestions == this.totalQuestions &&
          other.scaledScore == this.scaledScore &&
          other.scaledMax == this.scaledMax &&
          other.gradeCode == this.gradeCode &&
          other.completedAt == this.completedAt);
}

class ExamAttemptsCompanion extends UpdateCompanion<ExamAttempt> {
  final Value<String> id;
  final Value<String> track;
  final Value<String> title;
  final Value<int> rawCorrect;
  final Value<int> totalQuestions;
  final Value<int> scaledScore;
  final Value<int> scaledMax;
  final Value<String> gradeCode;
  final Value<DateTime> completedAt;
  final Value<int> rowid;
  const ExamAttemptsCompanion({
    this.id = const Value.absent(),
    this.track = const Value.absent(),
    this.title = const Value.absent(),
    this.rawCorrect = const Value.absent(),
    this.totalQuestions = const Value.absent(),
    this.scaledScore = const Value.absent(),
    this.scaledMax = const Value.absent(),
    this.gradeCode = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExamAttemptsCompanion.insert({
    required String id,
    required String track,
    required String title,
    required int rawCorrect,
    required int totalQuestions,
    required int scaledScore,
    required int scaledMax,
    required String gradeCode,
    required DateTime completedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       track = Value(track),
       title = Value(title),
       rawCorrect = Value(rawCorrect),
       totalQuestions = Value(totalQuestions),
       scaledScore = Value(scaledScore),
       scaledMax = Value(scaledMax),
       gradeCode = Value(gradeCode),
       completedAt = Value(completedAt);
  static Insertable<ExamAttempt> custom({
    Expression<String>? id,
    Expression<String>? track,
    Expression<String>? title,
    Expression<int>? rawCorrect,
    Expression<int>? totalQuestions,
    Expression<int>? scaledScore,
    Expression<int>? scaledMax,
    Expression<String>? gradeCode,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (track != null) 'track': track,
      if (title != null) 'title': title,
      if (rawCorrect != null) 'raw_correct': rawCorrect,
      if (totalQuestions != null) 'total_questions': totalQuestions,
      if (scaledScore != null) 'scaled_score': scaledScore,
      if (scaledMax != null) 'scaled_max': scaledMax,
      if (gradeCode != null) 'grade_code': gradeCode,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExamAttemptsCompanion copyWith({
    Value<String>? id,
    Value<String>? track,
    Value<String>? title,
    Value<int>? rawCorrect,
    Value<int>? totalQuestions,
    Value<int>? scaledScore,
    Value<int>? scaledMax,
    Value<String>? gradeCode,
    Value<DateTime>? completedAt,
    Value<int>? rowid,
  }) {
    return ExamAttemptsCompanion(
      id: id ?? this.id,
      track: track ?? this.track,
      title: title ?? this.title,
      rawCorrect: rawCorrect ?? this.rawCorrect,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      scaledScore: scaledScore ?? this.scaledScore,
      scaledMax: scaledMax ?? this.scaledMax,
      gradeCode: gradeCode ?? this.gradeCode,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (track.present) {
      map['track'] = Variable<String>(track.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (rawCorrect.present) {
      map['raw_correct'] = Variable<int>(rawCorrect.value);
    }
    if (totalQuestions.present) {
      map['total_questions'] = Variable<int>(totalQuestions.value);
    }
    if (scaledScore.present) {
      map['scaled_score'] = Variable<int>(scaledScore.value);
    }
    if (scaledMax.present) {
      map['scaled_max'] = Variable<int>(scaledMax.value);
    }
    if (gradeCode.present) {
      map['grade_code'] = Variable<String>(gradeCode.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamAttemptsCompanion(')
          ..write('id: $id, ')
          ..write('track: $track, ')
          ..write('title: $title, ')
          ..write('rawCorrect: $rawCorrect, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('scaledScore: $scaledScore, ')
          ..write('scaledMax: $scaledMax, ')
          ..write('gradeCode: $gradeCode, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FlashcardsTable extends Flashcards
    with TableInfo<$FlashcardsTable, Flashcard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlashcardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<String> lessonId = GeneratedColumn<String>(
    'lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectTitleMeta = const VerificationMeta(
    'subjectTitle',
  );
  @override
  late final GeneratedColumn<String> subjectTitle = GeneratedColumn<String>(
    'subject_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ruleTextMeta = const VerificationMeta(
    'ruleText',
  );
  @override
  late final GeneratedColumn<String> ruleText = GeneratedColumn<String>(
    'rule_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lessonId,
    subjectTitle,
    ruleText,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flashcards';
  @override
  VerificationContext validateIntegrity(
    Insertable<Flashcard> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lessonIdMeta);
    }
    if (data.containsKey('subject_title')) {
      context.handle(
        _subjectTitleMeta,
        subjectTitle.isAcceptableOrUnknown(
          data['subject_title']!,
          _subjectTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subjectTitleMeta);
    }
    if (data.containsKey('rule_text')) {
      context.handle(
        _ruleTextMeta,
        ruleText.isAcceptableOrUnknown(data['rule_text']!, _ruleTextMeta),
      );
    } else if (isInserting) {
      context.missing(_ruleTextMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Flashcard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Flashcard(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lesson_id'],
      )!,
      subjectTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_title'],
      )!,
      ruleText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rule_text'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FlashcardsTable createAlias(String alias) {
    return $FlashcardsTable(attachedDatabase, alias);
  }
}

class Flashcard extends DataClass implements Insertable<Flashcard> {
  final String id;
  final String lessonId;
  final String subjectTitle;
  final String ruleText;
  final DateTime createdAt;
  const Flashcard({
    required this.id,
    required this.lessonId,
    required this.subjectTitle,
    required this.ruleText,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['lesson_id'] = Variable<String>(lessonId);
    map['subject_title'] = Variable<String>(subjectTitle);
    map['rule_text'] = Variable<String>(ruleText);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FlashcardsCompanion toCompanion(bool nullToAbsent) {
    return FlashcardsCompanion(
      id: Value(id),
      lessonId: Value(lessonId),
      subjectTitle: Value(subjectTitle),
      ruleText: Value(ruleText),
      createdAt: Value(createdAt),
    );
  }

  factory Flashcard.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Flashcard(
      id: serializer.fromJson<String>(json['id']),
      lessonId: serializer.fromJson<String>(json['lessonId']),
      subjectTitle: serializer.fromJson<String>(json['subjectTitle']),
      ruleText: serializer.fromJson<String>(json['ruleText']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'lessonId': serializer.toJson<String>(lessonId),
      'subjectTitle': serializer.toJson<String>(subjectTitle),
      'ruleText': serializer.toJson<String>(ruleText),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Flashcard copyWith({
    String? id,
    String? lessonId,
    String? subjectTitle,
    String? ruleText,
    DateTime? createdAt,
  }) => Flashcard(
    id: id ?? this.id,
    lessonId: lessonId ?? this.lessonId,
    subjectTitle: subjectTitle ?? this.subjectTitle,
    ruleText: ruleText ?? this.ruleText,
    createdAt: createdAt ?? this.createdAt,
  );
  Flashcard copyWithCompanion(FlashcardsCompanion data) {
    return Flashcard(
      id: data.id.present ? data.id.value : this.id,
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      subjectTitle: data.subjectTitle.present
          ? data.subjectTitle.value
          : this.subjectTitle,
      ruleText: data.ruleText.present ? data.ruleText.value : this.ruleText,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Flashcard(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('subjectTitle: $subjectTitle, ')
          ..write('ruleText: $ruleText, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, lessonId, subjectTitle, ruleText, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Flashcard &&
          other.id == this.id &&
          other.lessonId == this.lessonId &&
          other.subjectTitle == this.subjectTitle &&
          other.ruleText == this.ruleText &&
          other.createdAt == this.createdAt);
}

class FlashcardsCompanion extends UpdateCompanion<Flashcard> {
  final Value<String> id;
  final Value<String> lessonId;
  final Value<String> subjectTitle;
  final Value<String> ruleText;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FlashcardsCompanion({
    this.id = const Value.absent(),
    this.lessonId = const Value.absent(),
    this.subjectTitle = const Value.absent(),
    this.ruleText = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FlashcardsCompanion.insert({
    required String id,
    required String lessonId,
    required String subjectTitle,
    required String ruleText,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       lessonId = Value(lessonId),
       subjectTitle = Value(subjectTitle),
       ruleText = Value(ruleText),
       createdAt = Value(createdAt);
  static Insertable<Flashcard> custom({
    Expression<String>? id,
    Expression<String>? lessonId,
    Expression<String>? subjectTitle,
    Expression<String>? ruleText,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lessonId != null) 'lesson_id': lessonId,
      if (subjectTitle != null) 'subject_title': subjectTitle,
      if (ruleText != null) 'rule_text': ruleText,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FlashcardsCompanion copyWith({
    Value<String>? id,
    Value<String>? lessonId,
    Value<String>? subjectTitle,
    Value<String>? ruleText,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FlashcardsCompanion(
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      subjectTitle: subjectTitle ?? this.subjectTitle,
      ruleText: ruleText ?? this.ruleText,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (lessonId.present) {
      map['lesson_id'] = Variable<String>(lessonId.value);
    }
    if (subjectTitle.present) {
      map['subject_title'] = Variable<String>(subjectTitle.value);
    }
    if (ruleText.present) {
      map['rule_text'] = Variable<String>(ruleText.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardsCompanion(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('subjectTitle: $subjectTitle, ')
          ..write('ruleText: $ruleText, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SubjectPacksTable subjectPacks = $SubjectPacksTable(this);
  late final $LessonsTable lessons = $LessonsTable(this);
  late final $LessonStepsTable lessonSteps = $LessonStepsTable(this);
  late final $QuestionsTable questions = $QuestionsTable(this);
  late final $MistakeVaultSm2Table mistakeVaultSm2 = $MistakeVaultSm2Table(
    this,
  );
  late final $StudyPreferencesTable studyPreferences = $StudyPreferencesTable(
    this,
  );
  late final $LessonProgressTable lessonProgress = $LessonProgressTable(this);
  late final $ActiveExamSessionsTable activeExamSessions =
      $ActiveExamSessionsTable(this);
  late final $ExamAttemptsTable examAttempts = $ExamAttemptsTable(this);
  late final $FlashcardsTable flashcards = $FlashcardsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    subjectPacks,
    lessons,
    lessonSteps,
    questions,
    mistakeVaultSm2,
    studyPreferences,
    lessonProgress,
    activeExamSessions,
    examAttempts,
    flashcards,
  ];
}

typedef $$SubjectPacksTableCreateCompanionBuilder =
    SubjectPacksCompanion Function({
      required String id,
      required String subjectCode,
      required String title,
      required String examTrack,
      required String nerdcLevel,
      Value<int> version,
      Value<int> sizeBytes,
      required String checksum,
      Value<String> status,
      Value<DateTime?> installedAt,
      Value<int> rowid,
    });
typedef $$SubjectPacksTableUpdateCompanionBuilder =
    SubjectPacksCompanion Function({
      Value<String> id,
      Value<String> subjectCode,
      Value<String> title,
      Value<String> examTrack,
      Value<String> nerdcLevel,
      Value<int> version,
      Value<int> sizeBytes,
      Value<String> checksum,
      Value<String> status,
      Value<DateTime?> installedAt,
      Value<int> rowid,
    });

final class $$SubjectPacksTableReferences
    extends BaseReferences<_$AppDatabase, $SubjectPacksTable, SubjectPack> {
  $$SubjectPacksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LessonsTable, List<Lesson>> _lessonsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.lessons,
    aliasName: 'subject_packs__id__lessons__pack_id',
  );

  $$LessonsTableProcessedTableManager get lessonsRefs {
    final manager = $$LessonsTableTableManager(
      $_db,
      $_db.lessons,
    ).filter((f) => f.packId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_lessonsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$QuestionsTable, List<Question>>
  _questionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.questions,
    aliasName: 'subject_packs__id__questions__pack_id',
  );

  $$QuestionsTableProcessedTableManager get questionsRefs {
    final manager = $$QuestionsTableTableManager(
      $_db,
      $_db.questions,
    ).filter((f) => f.packId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_questionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SubjectPacksTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectPacksTable> {
  $$SubjectPacksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectCode => $composableBuilder(
    column: $table.subjectCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get examTrack => $composableBuilder(
    column: $table.examTrack,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nerdcLevel => $composableBuilder(
    column: $table.nerdcLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> lessonsRefs(
    Expression<bool> Function($$LessonsTableFilterComposer f) f,
  ) {
    final $$LessonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.packId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableFilterComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> questionsRefs(
    Expression<bool> Function($$QuestionsTableFilterComposer f) f,
  ) {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.packId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableFilterComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubjectPacksTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectPacksTable> {
  $$SubjectPacksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectCode => $composableBuilder(
    column: $table.subjectCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get examTrack => $composableBuilder(
    column: $table.examTrack,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nerdcLevel => $composableBuilder(
    column: $table.nerdcLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubjectPacksTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectPacksTable> {
  $$SubjectPacksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subjectCode => $composableBuilder(
    column: $table.subjectCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get examTrack =>
      $composableBuilder(column: $table.examTrack, builder: (column) => column);

  GeneratedColumn<String> get nerdcLevel => $composableBuilder(
    column: $table.nerdcLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => column,
  );

  Expression<T> lessonsRefs<T extends Object>(
    Expression<T> Function($$LessonsTableAnnotationComposer a) f,
  ) {
    final $$LessonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.packId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableAnnotationComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> questionsRefs<T extends Object>(
    Expression<T> Function($$QuestionsTableAnnotationComposer a) f,
  ) {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.packId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableAnnotationComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubjectPacksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubjectPacksTable,
          SubjectPack,
          $$SubjectPacksTableFilterComposer,
          $$SubjectPacksTableOrderingComposer,
          $$SubjectPacksTableAnnotationComposer,
          $$SubjectPacksTableCreateCompanionBuilder,
          $$SubjectPacksTableUpdateCompanionBuilder,
          (SubjectPack, $$SubjectPacksTableReferences),
          SubjectPack,
          PrefetchHooks Function({bool lessonsRefs, bool questionsRefs})
        > {
  $$SubjectPacksTableTableManager(_$AppDatabase db, $SubjectPacksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectPacksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectPacksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectPacksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> subjectCode = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> examTrack = const Value.absent(),
                Value<String> nerdcLevel = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<int> sizeBytes = const Value.absent(),
                Value<String> checksum = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> installedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubjectPacksCompanion(
                id: id,
                subjectCode: subjectCode,
                title: title,
                examTrack: examTrack,
                nerdcLevel: nerdcLevel,
                version: version,
                sizeBytes: sizeBytes,
                checksum: checksum,
                status: status,
                installedAt: installedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String subjectCode,
                required String title,
                required String examTrack,
                required String nerdcLevel,
                Value<int> version = const Value.absent(),
                Value<int> sizeBytes = const Value.absent(),
                required String checksum,
                Value<String> status = const Value.absent(),
                Value<DateTime?> installedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubjectPacksCompanion.insert(
                id: id,
                subjectCode: subjectCode,
                title: title,
                examTrack: examTrack,
                nerdcLevel: nerdcLevel,
                version: version,
                sizeBytes: sizeBytes,
                checksum: checksum,
                status: status,
                installedAt: installedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SubjectPacksTable, SubjectPack>(table),
                  $$SubjectPacksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({lessonsRefs = false, questionsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (lessonsRefs) db.lessons,
                    if (questionsRefs) db.questions,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (lessonsRefs)
                        await $_getPrefetchedDataByColumns<
                          SubjectPack,
                          $SubjectPacksTable,
                          Lesson,
                          $LessonsTable
                        >(
                          currentTable: table,
                          referencedTable: $$SubjectPacksTableReferences
                              ._lessonsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubjectPacksTableReferences(
                                db,
                                table,
                                p0,
                              ).lessonsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'pack_id',
                          typedResults: items,
                        ),
                      if (questionsRefs)
                        await $_getPrefetchedDataByColumns<
                          SubjectPack,
                          $SubjectPacksTable,
                          Question,
                          $QuestionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$SubjectPacksTableReferences
                              ._questionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubjectPacksTableReferences(
                                db,
                                table,
                                p0,
                              ).questionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'pack_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SubjectPacksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubjectPacksTable,
      SubjectPack,
      $$SubjectPacksTableFilterComposer,
      $$SubjectPacksTableOrderingComposer,
      $$SubjectPacksTableAnnotationComposer,
      $$SubjectPacksTableCreateCompanionBuilder,
      $$SubjectPacksTableUpdateCompanionBuilder,
      (SubjectPack, $$SubjectPacksTableReferences),
      SubjectPack,
      PrefetchHooks Function({bool lessonsRefs, bool questionsRefs})
    >;
typedef $$LessonsTableCreateCompanionBuilder = LessonsCompanion Function({
  required String id,
  required String packId,
  required String moduleTitle,
  required int orderIndex,
  required String title,
  Value<int> estimatedMinutes,
  required String objectivesJson,
  required String simpleSummaryMarkdown,
  required String formalSummaryMarkdown,
  required String keyRulesJson,
  Value<bool> isBookmarked,
  Value<int> rowid,
});
typedef $$LessonsTableUpdateCompanionBuilder = LessonsCompanion Function({
  Value<String> id,
  Value<String> packId,
  Value<String> moduleTitle,
  Value<int> orderIndex,
  Value<String> title,
  Value<int> estimatedMinutes,
  Value<String> objectivesJson,
  Value<String> simpleSummaryMarkdown,
  Value<String> formalSummaryMarkdown,
  Value<String> keyRulesJson,
  Value<bool> isBookmarked,
  Value<int> rowid,
});

final class $$LessonsTableReferences
    extends BaseReferences<_$AppDatabase, $LessonsTable, Lesson> {
  $$LessonsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SubjectPacksTable _packIdTable(_$AppDatabase db) =>
      db.subjectPacks.createAlias('lessons__pack_id__subject_packs__id');

  $$SubjectPacksTableProcessedTableManager get packId {
    final $_column = $_itemColumn<String>('pack_id')!;

    final manager = $$SubjectPacksTableTableManager(
      $_db,
      $_db.subjectPacks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_packIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LessonStepsTable, List<LessonStep>>
  _lessonStepsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lessonSteps,
    aliasName: 'lessons__id__lesson_steps__lesson_id',
  );

  $$LessonStepsTableProcessedTableManager get lessonStepsRefs {
    final manager = $$LessonStepsTableTableManager(
      $_db,
      $_db.lessonSteps,
    ).filter((f) => f.lessonId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_lessonStepsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LessonProgressTable, List<LessonProgressData>>
  _lessonProgressRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lessonProgress,
    aliasName: 'lessons__id__lesson_progress__lesson_id',
  );

  $$LessonProgressTableProcessedTableManager get lessonProgressRefs {
    final manager = $$LessonProgressTableTableManager(
      $_db,
      $_db.lessonProgress,
    ).filter((f) => f.lessonId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_lessonProgressRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LessonsTableFilterComposer
    extends Composer<_$AppDatabase, $LessonsTable> {
  $$LessonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moduleTitle => $composableBuilder(
    column: $table.moduleTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get objectivesJson => $composableBuilder(
    column: $table.objectivesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get simpleSummaryMarkdown => $composableBuilder(
    column: $table.simpleSummaryMarkdown,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get formalSummaryMarkdown => $composableBuilder(
    column: $table.formalSummaryMarkdown,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keyRulesJson => $composableBuilder(
    column: $table.keyRulesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnFilters(column),
  );

  $$SubjectPacksTableFilterComposer get packId {
    final $$SubjectPacksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packId,
      referencedTable: $db.subjectPacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectPacksTableFilterComposer(
            $db: $db,
            $table: $db.subjectPacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> lessonStepsRefs(
    Expression<bool> Function($$LessonStepsTableFilterComposer f) f,
  ) {
    final $$LessonStepsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lessonSteps,
      getReferencedColumn: (t) => t.lessonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonStepsTableFilterComposer(
            $db: $db,
            $table: $db.lessonSteps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> lessonProgressRefs(
    Expression<bool> Function($$LessonProgressTableFilterComposer f) f,
  ) {
    final $$LessonProgressTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lessonProgress,
      getReferencedColumn: (t) => t.lessonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonProgressTableFilterComposer(
            $db: $db,
            $table: $db.lessonProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LessonsTableOrderingComposer
    extends Composer<_$AppDatabase, $LessonsTable> {
  $$LessonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moduleTitle => $composableBuilder(
    column: $table.moduleTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get objectivesJson => $composableBuilder(
    column: $table.objectivesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get simpleSummaryMarkdown => $composableBuilder(
    column: $table.simpleSummaryMarkdown,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get formalSummaryMarkdown => $composableBuilder(
    column: $table.formalSummaryMarkdown,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keyRulesJson => $composableBuilder(
    column: $table.keyRulesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubjectPacksTableOrderingComposer get packId {
    final $$SubjectPacksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packId,
      referencedTable: $db.subjectPacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectPacksTableOrderingComposer(
            $db: $db,
            $table: $db.subjectPacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LessonsTable> {
  $$LessonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get moduleTitle => $composableBuilder(
    column: $table.moduleTitle,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get objectivesJson => $composableBuilder(
    column: $table.objectivesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get simpleSummaryMarkdown => $composableBuilder(
    column: $table.simpleSummaryMarkdown,
    builder: (column) => column,
  );

  GeneratedColumn<String> get formalSummaryMarkdown => $composableBuilder(
    column: $table.formalSummaryMarkdown,
    builder: (column) => column,
  );

  GeneratedColumn<String> get keyRulesJson => $composableBuilder(
    column: $table.keyRulesJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => column,
  );

  $$SubjectPacksTableAnnotationComposer get packId {
    final $$SubjectPacksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packId,
      referencedTable: $db.subjectPacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectPacksTableAnnotationComposer(
            $db: $db,
            $table: $db.subjectPacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> lessonStepsRefs<T extends Object>(
    Expression<T> Function($$LessonStepsTableAnnotationComposer a) f,
  ) {
    final $$LessonStepsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lessonSteps,
      getReferencedColumn: (t) => t.lessonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonStepsTableAnnotationComposer(
            $db: $db,
            $table: $db.lessonSteps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> lessonProgressRefs<T extends Object>(
    Expression<T> Function($$LessonProgressTableAnnotationComposer a) f,
  ) {
    final $$LessonProgressTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lessonProgress,
      getReferencedColumn: (t) => t.lessonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonProgressTableAnnotationComposer(
            $db: $db,
            $table: $db.lessonProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LessonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LessonsTable,
          Lesson,
          $$LessonsTableFilterComposer,
          $$LessonsTableOrderingComposer,
          $$LessonsTableAnnotationComposer,
          $$LessonsTableCreateCompanionBuilder,
          $$LessonsTableUpdateCompanionBuilder,
          (Lesson, $$LessonsTableReferences),
          Lesson,
          PrefetchHooks Function({
            bool packId,
            bool lessonStepsRefs,
            bool lessonProgressRefs,
          })
        > {
  $$LessonsTableTableManager(_$AppDatabase db, $LessonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LessonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LessonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LessonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> packId = const Value.absent(),
                Value<String> moduleTitle = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> estimatedMinutes = const Value.absent(),
                Value<String> objectivesJson = const Value.absent(),
                Value<String> simpleSummaryMarkdown = const Value.absent(),
                Value<String> formalSummaryMarkdown = const Value.absent(),
                Value<String> keyRulesJson = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonsCompanion(
                id: id,
                packId: packId,
                moduleTitle: moduleTitle,
                orderIndex: orderIndex,
                title: title,
                estimatedMinutes: estimatedMinutes,
                objectivesJson: objectivesJson,
                simpleSummaryMarkdown: simpleSummaryMarkdown,
                formalSummaryMarkdown: formalSummaryMarkdown,
                keyRulesJson: keyRulesJson,
                isBookmarked: isBookmarked,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String packId,
                required String moduleTitle,
                required int orderIndex,
                required String title,
                Value<int> estimatedMinutes = const Value.absent(),
                required String objectivesJson,
                required String simpleSummaryMarkdown,
                required String formalSummaryMarkdown,
                required String keyRulesJson,
                Value<bool> isBookmarked = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonsCompanion.insert(
                id: id,
                packId: packId,
                moduleTitle: moduleTitle,
                orderIndex: orderIndex,
                title: title,
                estimatedMinutes: estimatedMinutes,
                objectivesJson: objectivesJson,
                simpleSummaryMarkdown: simpleSummaryMarkdown,
                formalSummaryMarkdown: formalSummaryMarkdown,
                keyRulesJson: keyRulesJson,
                isBookmarked: isBookmarked,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LessonsTable, Lesson>(table),
                  $$LessonsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                packId = false,
                lessonStepsRefs = false,
                lessonProgressRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (lessonStepsRefs) db.lessonSteps,
                    if (lessonProgressRefs) db.lessonProgress,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (packId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.packId,
                            referencedTable: $$LessonsTableReferences
                                ._packIdTable(db),
                            referencedColumn: $$LessonsTableReferences
                                ._packIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (lessonStepsRefs)
                        await $_getPrefetchedDataByColumns<
                          Lesson,
                          $LessonsTable,
                          LessonStep,
                          $LessonStepsTable
                        >(
                          currentTable: table,
                          referencedTable: $$LessonsTableReferences
                              ._lessonStepsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LessonsTableReferences(
                                db,
                                table,
                                p0,
                              ).lessonStepsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'lesson_id',
                          typedResults: items,
                        ),
                      if (lessonProgressRefs)
                        await $_getPrefetchedDataByColumns<
                          Lesson,
                          $LessonsTable,
                          LessonProgressData,
                          $LessonProgressTable
                        >(
                          currentTable: table,
                          referencedTable: $$LessonsTableReferences
                              ._lessonProgressRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LessonsTableReferences(
                                db,
                                table,
                                p0,
                              ).lessonProgressRefs,
                          currentColumn: 'id',
                          referencedColumn: 'lesson_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LessonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LessonsTable,
      Lesson,
      $$LessonsTableFilterComposer,
      $$LessonsTableOrderingComposer,
      $$LessonsTableAnnotationComposer,
      $$LessonsTableCreateCompanionBuilder,
      $$LessonsTableUpdateCompanionBuilder,
      (Lesson, $$LessonsTableReferences),
      Lesson,
      PrefetchHooks Function({
        bool packId,
        bool lessonStepsRefs,
        bool lessonProgressRefs,
      })
    >;
typedef $$LessonStepsTableCreateCompanionBuilder =
    LessonStepsCompanion Function({
      required String id,
      required String lessonId,
      required int stepOrder,
      required String stepType,
      required String contentMarkdown,
      Value<String> revealStepsJson,
      Value<String> simConfigJson,
      Value<String> checkpointQuestionJson,
      Value<int> rowid,
    });
typedef $$LessonStepsTableUpdateCompanionBuilder =
    LessonStepsCompanion Function({
      Value<String> id,
      Value<String> lessonId,
      Value<int> stepOrder,
      Value<String> stepType,
      Value<String> contentMarkdown,
      Value<String> revealStepsJson,
      Value<String> simConfigJson,
      Value<String> checkpointQuestionJson,
      Value<int> rowid,
    });

final class $$LessonStepsTableReferences
    extends BaseReferences<_$AppDatabase, $LessonStepsTable, LessonStep> {
  $$LessonStepsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LessonsTable _lessonIdTable(_$AppDatabase db) =>
      db.lessons.createAlias('lesson_steps__lesson_id__lessons__id');

  $$LessonsTableProcessedTableManager get lessonId {
    final $_column = $_itemColumn<String>('lesson_id')!;

    final manager = $$LessonsTableTableManager(
      $_db,
      $_db.lessons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lessonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LessonStepsTableFilterComposer
    extends Composer<_$AppDatabase, $LessonStepsTable> {
  $$LessonStepsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stepOrder => $composableBuilder(
    column: $table.stepOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stepType => $composableBuilder(
    column: $table.stepType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentMarkdown => $composableBuilder(
    column: $table.contentMarkdown,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get revealStepsJson => $composableBuilder(
    column: $table.revealStepsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get simConfigJson => $composableBuilder(
    column: $table.simConfigJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checkpointQuestionJson => $composableBuilder(
    column: $table.checkpointQuestionJson,
    builder: (column) => ColumnFilters(column),
  );

  $$LessonsTableFilterComposer get lessonId {
    final $$LessonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableFilterComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonStepsTableOrderingComposer
    extends Composer<_$AppDatabase, $LessonStepsTable> {
  $$LessonStepsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stepOrder => $composableBuilder(
    column: $table.stepOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stepType => $composableBuilder(
    column: $table.stepType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentMarkdown => $composableBuilder(
    column: $table.contentMarkdown,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get revealStepsJson => $composableBuilder(
    column: $table.revealStepsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get simConfigJson => $composableBuilder(
    column: $table.simConfigJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checkpointQuestionJson => $composableBuilder(
    column: $table.checkpointQuestionJson,
    builder: (column) => ColumnOrderings(column),
  );

  $$LessonsTableOrderingComposer get lessonId {
    final $$LessonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableOrderingComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonStepsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LessonStepsTable> {
  $$LessonStepsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get stepOrder =>
      $composableBuilder(column: $table.stepOrder, builder: (column) => column);

  GeneratedColumn<String> get stepType =>
      $composableBuilder(column: $table.stepType, builder: (column) => column);

  GeneratedColumn<String> get contentMarkdown => $composableBuilder(
    column: $table.contentMarkdown,
    builder: (column) => column,
  );

  GeneratedColumn<String> get revealStepsJson => $composableBuilder(
    column: $table.revealStepsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get simConfigJson => $composableBuilder(
    column: $table.simConfigJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get checkpointQuestionJson => $composableBuilder(
    column: $table.checkpointQuestionJson,
    builder: (column) => column,
  );

  $$LessonsTableAnnotationComposer get lessonId {
    final $$LessonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableAnnotationComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonStepsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LessonStepsTable,
          LessonStep,
          $$LessonStepsTableFilterComposer,
          $$LessonStepsTableOrderingComposer,
          $$LessonStepsTableAnnotationComposer,
          $$LessonStepsTableCreateCompanionBuilder,
          $$LessonStepsTableUpdateCompanionBuilder,
          (LessonStep, $$LessonStepsTableReferences),
          LessonStep,
          PrefetchHooks Function({bool lessonId})
        > {
  $$LessonStepsTableTableManager(_$AppDatabase db, $LessonStepsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LessonStepsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LessonStepsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LessonStepsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> lessonId = const Value.absent(),
                Value<int> stepOrder = const Value.absent(),
                Value<String> stepType = const Value.absent(),
                Value<String> contentMarkdown = const Value.absent(),
                Value<String> revealStepsJson = const Value.absent(),
                Value<String> simConfigJson = const Value.absent(),
                Value<String> checkpointQuestionJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonStepsCompanion(
                id: id,
                lessonId: lessonId,
                stepOrder: stepOrder,
                stepType: stepType,
                contentMarkdown: contentMarkdown,
                revealStepsJson: revealStepsJson,
                simConfigJson: simConfigJson,
                checkpointQuestionJson: checkpointQuestionJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String lessonId,
                required int stepOrder,
                required String stepType,
                required String contentMarkdown,
                Value<String> revealStepsJson = const Value.absent(),
                Value<String> simConfigJson = const Value.absent(),
                Value<String> checkpointQuestionJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonStepsCompanion.insert(
                id: id,
                lessonId: lessonId,
                stepOrder: stepOrder,
                stepType: stepType,
                contentMarkdown: contentMarkdown,
                revealStepsJson: revealStepsJson,
                simConfigJson: simConfigJson,
                checkpointQuestionJson: checkpointQuestionJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LessonStepsTable, LessonStep>(table),
                  $$LessonStepsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({lessonId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (lessonId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.lessonId,
                        referencedTable: $$LessonStepsTableReferences
                            ._lessonIdTable(db),
                        referencedColumn: $$LessonStepsTableReferences
                            ._lessonIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LessonStepsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LessonStepsTable,
      LessonStep,
      $$LessonStepsTableFilterComposer,
      $$LessonStepsTableOrderingComposer,
      $$LessonStepsTableAnnotationComposer,
      $$LessonStepsTableCreateCompanionBuilder,
      $$LessonStepsTableUpdateCompanionBuilder,
      (LessonStep, $$LessonStepsTableReferences),
      LessonStep,
      PrefetchHooks Function({bool lessonId})
    >;
typedef $$QuestionsTableCreateCompanionBuilder = QuestionsCompanion Function({
  required String id,
  required String packId,
  required String relatedLessonId,
  required String examBody,
  required int examYear,
  required String paperType,
  required String stemMarkdown,
  Value<String?> diagramAssetPath,
  required String optionsJson,
  required int correctIndex,
  required String answerSummary,
  required String workedStepsJson,
  required String distractorNotesJson,
  Value<String> markingPointsJson,
  required String examinerTip,
  Value<String> difficulty,
  Value<int> rowid,
});
typedef $$QuestionsTableUpdateCompanionBuilder = QuestionsCompanion Function({
  Value<String> id,
  Value<String> packId,
  Value<String> relatedLessonId,
  Value<String> examBody,
  Value<int> examYear,
  Value<String> paperType,
  Value<String> stemMarkdown,
  Value<String?> diagramAssetPath,
  Value<String> optionsJson,
  Value<int> correctIndex,
  Value<String> answerSummary,
  Value<String> workedStepsJson,
  Value<String> distractorNotesJson,
  Value<String> markingPointsJson,
  Value<String> examinerTip,
  Value<String> difficulty,
  Value<int> rowid,
});

final class $$QuestionsTableReferences
    extends BaseReferences<_$AppDatabase, $QuestionsTable, Question> {
  $$QuestionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SubjectPacksTable _packIdTable(_$AppDatabase db) =>
      db.subjectPacks.createAlias('questions__pack_id__subject_packs__id');

  $$SubjectPacksTableProcessedTableManager get packId {
    final $_column = $_itemColumn<String>('pack_id')!;

    final manager = $$SubjectPacksTableTableManager(
      $_db,
      $_db.subjectPacks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_packIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MistakeVaultSm2Table, List<MistakeVaultSm2Data>>
  _mistakeVaultSm2RefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mistakeVaultSm2,
    aliasName: 'questions__id__mistake_vault_sm2__question_id',
  );

  $$MistakeVaultSm2TableProcessedTableManager get mistakeVaultSm2Refs {
    final manager = $$MistakeVaultSm2TableTableManager(
      $_db,
      $_db.mistakeVaultSm2,
    ).filter((f) => f.questionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _mistakeVaultSm2RefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$QuestionsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedLessonId => $composableBuilder(
    column: $table.relatedLessonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get examBody => $composableBuilder(
    column: $table.examBody,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get examYear => $composableBuilder(
    column: $table.examYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paperType => $composableBuilder(
    column: $table.paperType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stemMarkdown => $composableBuilder(
    column: $table.stemMarkdown,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diagramAssetPath => $composableBuilder(
    column: $table.diagramAssetPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get correctIndex => $composableBuilder(
    column: $table.correctIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answerSummary => $composableBuilder(
    column: $table.answerSummary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workedStepsJson => $composableBuilder(
    column: $table.workedStepsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get distractorNotesJson => $composableBuilder(
    column: $table.distractorNotesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get markingPointsJson => $composableBuilder(
    column: $table.markingPointsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get examinerTip => $composableBuilder(
    column: $table.examinerTip,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  $$SubjectPacksTableFilterComposer get packId {
    final $$SubjectPacksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packId,
      referencedTable: $db.subjectPacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectPacksTableFilterComposer(
            $db: $db,
            $table: $db.subjectPacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> mistakeVaultSm2Refs(
    Expression<bool> Function($$MistakeVaultSm2TableFilterComposer f) f,
  ) {
    final $$MistakeVaultSm2TableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mistakeVaultSm2,
      getReferencedColumn: (t) => t.questionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MistakeVaultSm2TableFilterComposer(
            $db: $db,
            $table: $db.mistakeVaultSm2,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedLessonId => $composableBuilder(
    column: $table.relatedLessonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get examBody => $composableBuilder(
    column: $table.examBody,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get examYear => $composableBuilder(
    column: $table.examYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paperType => $composableBuilder(
    column: $table.paperType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stemMarkdown => $composableBuilder(
    column: $table.stemMarkdown,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diagramAssetPath => $composableBuilder(
    column: $table.diagramAssetPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get correctIndex => $composableBuilder(
    column: $table.correctIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answerSummary => $composableBuilder(
    column: $table.answerSummary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workedStepsJson => $composableBuilder(
    column: $table.workedStepsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get distractorNotesJson => $composableBuilder(
    column: $table.distractorNotesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get markingPointsJson => $composableBuilder(
    column: $table.markingPointsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get examinerTip => $composableBuilder(
    column: $table.examinerTip,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubjectPacksTableOrderingComposer get packId {
    final $$SubjectPacksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packId,
      referencedTable: $db.subjectPacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectPacksTableOrderingComposer(
            $db: $db,
            $table: $db.subjectPacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get relatedLessonId => $composableBuilder(
    column: $table.relatedLessonId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get examBody =>
      $composableBuilder(column: $table.examBody, builder: (column) => column);

  GeneratedColumn<int> get examYear =>
      $composableBuilder(column: $table.examYear, builder: (column) => column);

  GeneratedColumn<String> get paperType =>
      $composableBuilder(column: $table.paperType, builder: (column) => column);

  GeneratedColumn<String> get stemMarkdown => $composableBuilder(
    column: $table.stemMarkdown,
    builder: (column) => column,
  );

  GeneratedColumn<String> get diagramAssetPath => $composableBuilder(
    column: $table.diagramAssetPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get correctIndex => $composableBuilder(
    column: $table.correctIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get answerSummary => $composableBuilder(
    column: $table.answerSummary,
    builder: (column) => column,
  );

  GeneratedColumn<String> get workedStepsJson => $composableBuilder(
    column: $table.workedStepsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get distractorNotesJson => $composableBuilder(
    column: $table.distractorNotesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get markingPointsJson => $composableBuilder(
    column: $table.markingPointsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get examinerTip => $composableBuilder(
    column: $table.examinerTip,
    builder: (column) => column,
  );

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  $$SubjectPacksTableAnnotationComposer get packId {
    final $$SubjectPacksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packId,
      referencedTable: $db.subjectPacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectPacksTableAnnotationComposer(
            $db: $db,
            $table: $db.subjectPacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> mistakeVaultSm2Refs<T extends Object>(
    Expression<T> Function($$MistakeVaultSm2TableAnnotationComposer a) f,
  ) {
    final $$MistakeVaultSm2TableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mistakeVaultSm2,
      getReferencedColumn: (t) => t.questionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MistakeVaultSm2TableAnnotationComposer(
            $db: $db,
            $table: $db.mistakeVaultSm2,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuestionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionsTable,
          Question,
          $$QuestionsTableFilterComposer,
          $$QuestionsTableOrderingComposer,
          $$QuestionsTableAnnotationComposer,
          $$QuestionsTableCreateCompanionBuilder,
          $$QuestionsTableUpdateCompanionBuilder,
          (Question, $$QuestionsTableReferences),
          Question,
          PrefetchHooks Function({bool packId, bool mistakeVaultSm2Refs})
        > {
  $$QuestionsTableTableManager(_$AppDatabase db, $QuestionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> packId = const Value.absent(),
                Value<String> relatedLessonId = const Value.absent(),
                Value<String> examBody = const Value.absent(),
                Value<int> examYear = const Value.absent(),
                Value<String> paperType = const Value.absent(),
                Value<String> stemMarkdown = const Value.absent(),
                Value<String?> diagramAssetPath = const Value.absent(),
                Value<String> optionsJson = const Value.absent(),
                Value<int> correctIndex = const Value.absent(),
                Value<String> answerSummary = const Value.absent(),
                Value<String> workedStepsJson = const Value.absent(),
                Value<String> distractorNotesJson = const Value.absent(),
                Value<String> markingPointsJson = const Value.absent(),
                Value<String> examinerTip = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionsCompanion(
                id: id,
                packId: packId,
                relatedLessonId: relatedLessonId,
                examBody: examBody,
                examYear: examYear,
                paperType: paperType,
                stemMarkdown: stemMarkdown,
                diagramAssetPath: diagramAssetPath,
                optionsJson: optionsJson,
                correctIndex: correctIndex,
                answerSummary: answerSummary,
                workedStepsJson: workedStepsJson,
                distractorNotesJson: distractorNotesJson,
                markingPointsJson: markingPointsJson,
                examinerTip: examinerTip,
                difficulty: difficulty,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String packId,
                required String relatedLessonId,
                required String examBody,
                required int examYear,
                required String paperType,
                required String stemMarkdown,
                Value<String?> diagramAssetPath = const Value.absent(),
                required String optionsJson,
                required int correctIndex,
                required String answerSummary,
                required String workedStepsJson,
                required String distractorNotesJson,
                Value<String> markingPointsJson = const Value.absent(),
                required String examinerTip,
                Value<String> difficulty = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionsCompanion.insert(
                id: id,
                packId: packId,
                relatedLessonId: relatedLessonId,
                examBody: examBody,
                examYear: examYear,
                paperType: paperType,
                stemMarkdown: stemMarkdown,
                diagramAssetPath: diagramAssetPath,
                optionsJson: optionsJson,
                correctIndex: correctIndex,
                answerSummary: answerSummary,
                workedStepsJson: workedStepsJson,
                distractorNotesJson: distractorNotesJson,
                markingPointsJson: markingPointsJson,
                examinerTip: examinerTip,
                difficulty: difficulty,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$QuestionsTable, Question>(table),
                  $$QuestionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({packId = false, mistakeVaultSm2Refs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (mistakeVaultSm2Refs) db.mistakeVaultSm2,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (packId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.packId,
                            referencedTable: $$QuestionsTableReferences
                                ._packIdTable(db),
                            referencedColumn: $$QuestionsTableReferences
                                ._packIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (mistakeVaultSm2Refs)
                        await $_getPrefetchedDataByColumns<
                          Question,
                          $QuestionsTable,
                          MistakeVaultSm2Data,
                          $MistakeVaultSm2Table
                        >(
                          currentTable: table,
                          referencedTable: $$QuestionsTableReferences
                              ._mistakeVaultSm2RefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$QuestionsTableReferences(
                                db,
                                table,
                                p0,
                              ).mistakeVaultSm2Refs,
                          currentColumn: 'id',
                          referencedColumn: 'question_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$QuestionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionsTable,
      Question,
      $$QuestionsTableFilterComposer,
      $$QuestionsTableOrderingComposer,
      $$QuestionsTableAnnotationComposer,
      $$QuestionsTableCreateCompanionBuilder,
      $$QuestionsTableUpdateCompanionBuilder,
      (Question, $$QuestionsTableReferences),
      Question,
      PrefetchHooks Function({bool packId, bool mistakeVaultSm2Refs})
    >;
typedef $$MistakeVaultSm2TableCreateCompanionBuilder =
    MistakeVaultSm2Companion Function({
      required String questionId,
      Value<double> easeFactor,
      Value<int> intervalDays,
      Value<int> repetitions,
      required DateTime nextReviewAt,
      Value<String> lastOutcome,
      Value<String> userNote,
      Value<int> rowid,
    });
typedef $$MistakeVaultSm2TableUpdateCompanionBuilder =
    MistakeVaultSm2Companion Function({
      Value<String> questionId,
      Value<double> easeFactor,
      Value<int> intervalDays,
      Value<int> repetitions,
      Value<DateTime> nextReviewAt,
      Value<String> lastOutcome,
      Value<String> userNote,
      Value<int> rowid,
    });

final class $$MistakeVaultSm2TableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MistakeVaultSm2Table,
          MistakeVaultSm2Data
        > {
  $$MistakeVaultSm2TableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $QuestionsTable _questionIdTable(_$AppDatabase db) =>
      db.questions.createAlias('mistake_vault_sm2__question_id__questions__id');

  $$QuestionsTableProcessedTableManager get questionId {
    final $_column = $_itemColumn<String>('question_id')!;

    final manager = $$QuestionsTableTableManager(
      $_db,
      $_db.questions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_questionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MistakeVaultSm2TableFilterComposer
    extends Composer<_$AppDatabase, $MistakeVaultSm2Table> {
  $$MistakeVaultSm2TableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastOutcome => $composableBuilder(
    column: $table.lastOutcome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userNote => $composableBuilder(
    column: $table.userNote,
    builder: (column) => ColumnFilters(column),
  );

  $$QuestionsTableFilterComposer get questionId {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionId,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableFilterComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MistakeVaultSm2TableOrderingComposer
    extends Composer<_$AppDatabase, $MistakeVaultSm2Table> {
  $$MistakeVaultSm2TableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastOutcome => $composableBuilder(
    column: $table.lastOutcome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userNote => $composableBuilder(
    column: $table.userNote,
    builder: (column) => ColumnOrderings(column),
  );

  $$QuestionsTableOrderingComposer get questionId {
    final $$QuestionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionId,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableOrderingComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MistakeVaultSm2TableAnnotationComposer
    extends Composer<_$AppDatabase, $MistakeVaultSm2Table> {
  $$MistakeVaultSm2TableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastOutcome => $composableBuilder(
    column: $table.lastOutcome,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userNote =>
      $composableBuilder(column: $table.userNote, builder: (column) => column);

  $$QuestionsTableAnnotationComposer get questionId {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionId,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableAnnotationComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MistakeVaultSm2TableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MistakeVaultSm2Table,
          MistakeVaultSm2Data,
          $$MistakeVaultSm2TableFilterComposer,
          $$MistakeVaultSm2TableOrderingComposer,
          $$MistakeVaultSm2TableAnnotationComposer,
          $$MistakeVaultSm2TableCreateCompanionBuilder,
          $$MistakeVaultSm2TableUpdateCompanionBuilder,
          (MistakeVaultSm2Data, $$MistakeVaultSm2TableReferences),
          MistakeVaultSm2Data,
          PrefetchHooks Function({bool questionId})
        > {
  $$MistakeVaultSm2TableTableManager(
    _$AppDatabase db,
    $MistakeVaultSm2Table table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MistakeVaultSm2TableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MistakeVaultSm2TableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MistakeVaultSm2TableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> questionId = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> intervalDays = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                Value<DateTime> nextReviewAt = const Value.absent(),
                Value<String> lastOutcome = const Value.absent(),
                Value<String> userNote = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MistakeVaultSm2Companion(
                questionId: questionId,
                easeFactor: easeFactor,
                intervalDays: intervalDays,
                repetitions: repetitions,
                nextReviewAt: nextReviewAt,
                lastOutcome: lastOutcome,
                userNote: userNote,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String questionId,
                Value<double> easeFactor = const Value.absent(),
                Value<int> intervalDays = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                required DateTime nextReviewAt,
                Value<String> lastOutcome = const Value.absent(),
                Value<String> userNote = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MistakeVaultSm2Companion.insert(
                questionId: questionId,
                easeFactor: easeFactor,
                intervalDays: intervalDays,
                repetitions: repetitions,
                nextReviewAt: nextReviewAt,
                lastOutcome: lastOutcome,
                userNote: userNote,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MistakeVaultSm2Table, MistakeVaultSm2Data>(
                    table,
                  ),
                  $$MistakeVaultSm2TableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({questionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (questionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.questionId,
                        referencedTable: $$MistakeVaultSm2TableReferences
                            ._questionIdTable(db),
                        referencedColumn: $$MistakeVaultSm2TableReferences
                            ._questionIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MistakeVaultSm2TableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MistakeVaultSm2Table,
      MistakeVaultSm2Data,
      $$MistakeVaultSm2TableFilterComposer,
      $$MistakeVaultSm2TableOrderingComposer,
      $$MistakeVaultSm2TableAnnotationComposer,
      $$MistakeVaultSm2TableCreateCompanionBuilder,
      $$MistakeVaultSm2TableUpdateCompanionBuilder,
      (MistakeVaultSm2Data, $$MistakeVaultSm2TableReferences),
      MistakeVaultSm2Data,
      PrefetchHooks Function({bool questionId})
    >;
typedef $$StudyPreferencesTableCreateCompanionBuilder =
    StudyPreferencesCompanion Function({
      Value<int> id,
      Value<String> activeTrack,
      Value<DateTime?> targetExamDate,
      Value<int> dailyGoalMinutes,
      Value<String> themeMode,
      Value<String> fontScale,
      Value<int> streakDays,
      Value<DateTime?> lastStudyDate,
      Value<bool> diagnosticCompleted,
      Value<String> diagnosticSummary,
    });
typedef $$StudyPreferencesTableUpdateCompanionBuilder =
    StudyPreferencesCompanion Function({
      Value<int> id,
      Value<String> activeTrack,
      Value<DateTime?> targetExamDate,
      Value<int> dailyGoalMinutes,
      Value<String> themeMode,
      Value<String> fontScale,
      Value<int> streakDays,
      Value<DateTime?> lastStudyDate,
      Value<bool> diagnosticCompleted,
      Value<String> diagnosticSummary,
    });

class $$StudyPreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $StudyPreferencesTable> {
  $$StudyPreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activeTrack => $composableBuilder(
    column: $table.activeTrack,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get targetExamDate => $composableBuilder(
    column: $table.targetExamDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyGoalMinutes => $composableBuilder(
    column: $table.dailyGoalMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fontScale => $composableBuilder(
    column: $table.fontScale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get streakDays => $composableBuilder(
    column: $table.streakDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastStudyDate => $composableBuilder(
    column: $table.lastStudyDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get diagnosticCompleted => $composableBuilder(
    column: $table.diagnosticCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diagnosticSummary => $composableBuilder(
    column: $table.diagnosticSummary,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudyPreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $StudyPreferencesTable> {
  $$StudyPreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activeTrack => $composableBuilder(
    column: $table.activeTrack,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get targetExamDate => $composableBuilder(
    column: $table.targetExamDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyGoalMinutes => $composableBuilder(
    column: $table.dailyGoalMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fontScale => $composableBuilder(
    column: $table.fontScale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get streakDays => $composableBuilder(
    column: $table.streakDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastStudyDate => $composableBuilder(
    column: $table.lastStudyDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get diagnosticCompleted => $composableBuilder(
    column: $table.diagnosticCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diagnosticSummary => $composableBuilder(
    column: $table.diagnosticSummary,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudyPreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudyPreferencesTable> {
  $$StudyPreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get activeTrack => $composableBuilder(
    column: $table.activeTrack,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get targetExamDate => $composableBuilder(
    column: $table.targetExamDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dailyGoalMinutes => $composableBuilder(
    column: $table.dailyGoalMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<String> get fontScale =>
      $composableBuilder(column: $table.fontScale, builder: (column) => column);

  GeneratedColumn<int> get streakDays => $composableBuilder(
    column: $table.streakDays,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastStudyDate => $composableBuilder(
    column: $table.lastStudyDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get diagnosticCompleted => $composableBuilder(
    column: $table.diagnosticCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get diagnosticSummary => $composableBuilder(
    column: $table.diagnosticSummary,
    builder: (column) => column,
  );
}

class $$StudyPreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudyPreferencesTable,
          StudyPreference,
          $$StudyPreferencesTableFilterComposer,
          $$StudyPreferencesTableOrderingComposer,
          $$StudyPreferencesTableAnnotationComposer,
          $$StudyPreferencesTableCreateCompanionBuilder,
          $$StudyPreferencesTableUpdateCompanionBuilder,
          (
            StudyPreference,
            BaseReferences<
              _$AppDatabase,
              $StudyPreferencesTable,
              StudyPreference
            >,
          ),
          StudyPreference,
          PrefetchHooks Function()
        > {
  $$StudyPreferencesTableTableManager(
    _$AppDatabase db,
    $StudyPreferencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudyPreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudyPreferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudyPreferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> activeTrack = const Value.absent(),
                Value<DateTime?> targetExamDate = const Value.absent(),
                Value<int> dailyGoalMinutes = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<String> fontScale = const Value.absent(),
                Value<int> streakDays = const Value.absent(),
                Value<DateTime?> lastStudyDate = const Value.absent(),
                Value<bool> diagnosticCompleted = const Value.absent(),
                Value<String> diagnosticSummary = const Value.absent(),
              }) => StudyPreferencesCompanion(
                id: id,
                activeTrack: activeTrack,
                targetExamDate: targetExamDate,
                dailyGoalMinutes: dailyGoalMinutes,
                themeMode: themeMode,
                fontScale: fontScale,
                streakDays: streakDays,
                lastStudyDate: lastStudyDate,
                diagnosticCompleted: diagnosticCompleted,
                diagnosticSummary: diagnosticSummary,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> activeTrack = const Value.absent(),
                Value<DateTime?> targetExamDate = const Value.absent(),
                Value<int> dailyGoalMinutes = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<String> fontScale = const Value.absent(),
                Value<int> streakDays = const Value.absent(),
                Value<DateTime?> lastStudyDate = const Value.absent(),
                Value<bool> diagnosticCompleted = const Value.absent(),
                Value<String> diagnosticSummary = const Value.absent(),
              }) => StudyPreferencesCompanion.insert(
                id: id,
                activeTrack: activeTrack,
                targetExamDate: targetExamDate,
                dailyGoalMinutes: dailyGoalMinutes,
                themeMode: themeMode,
                fontScale: fontScale,
                streakDays: streakDays,
                lastStudyDate: lastStudyDate,
                diagnosticCompleted: diagnosticCompleted,
                diagnosticSummary: diagnosticSummary,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StudyPreferencesTable, StudyPreference>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $StudyPreferencesTable,
                    StudyPreference
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudyPreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudyPreferencesTable,
      StudyPreference,
      $$StudyPreferencesTableFilterComposer,
      $$StudyPreferencesTableOrderingComposer,
      $$StudyPreferencesTableAnnotationComposer,
      $$StudyPreferencesTableCreateCompanionBuilder,
      $$StudyPreferencesTableUpdateCompanionBuilder,
      (
        StudyPreference,
        BaseReferences<_$AppDatabase, $StudyPreferencesTable, StudyPreference>,
      ),
      StudyPreference,
      PrefetchHooks Function()
    >;
typedef $$LessonProgressTableCreateCompanionBuilder =
    LessonProgressCompanion Function({
      required String lessonId,
      Value<int> completedSteps,
      Value<int> totalSteps,
      Value<bool> isCompleted,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$LessonProgressTableUpdateCompanionBuilder =
    LessonProgressCompanion Function({
      Value<String> lessonId,
      Value<int> completedSteps,
      Value<int> totalSteps,
      Value<bool> isCompleted,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$LessonProgressTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $LessonProgressTable,
          LessonProgressData
        > {
  $$LessonProgressTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LessonsTable _lessonIdTable(_$AppDatabase db) =>
      db.lessons.createAlias('lesson_progress__lesson_id__lessons__id');

  $$LessonsTableProcessedTableManager get lessonId {
    final $_column = $_itemColumn<String>('lesson_id')!;

    final manager = $$LessonsTableTableManager(
      $_db,
      $_db.lessons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lessonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LessonProgressTableFilterComposer
    extends Composer<_$AppDatabase, $LessonProgressTable> {
  $$LessonProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get completedSteps => $composableBuilder(
    column: $table.completedSteps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSteps => $composableBuilder(
    column: $table.totalSteps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$LessonsTableFilterComposer get lessonId {
    final $$LessonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableFilterComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $LessonProgressTable> {
  $$LessonProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get completedSteps => $composableBuilder(
    column: $table.completedSteps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSteps => $composableBuilder(
    column: $table.totalSteps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$LessonsTableOrderingComposer get lessonId {
    final $$LessonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableOrderingComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $LessonProgressTable> {
  $$LessonProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get completedSteps => $composableBuilder(
    column: $table.completedSteps,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalSteps => $composableBuilder(
    column: $table.totalSteps,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$LessonsTableAnnotationComposer get lessonId {
    final $$LessonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableAnnotationComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LessonProgressTable,
          LessonProgressData,
          $$LessonProgressTableFilterComposer,
          $$LessonProgressTableOrderingComposer,
          $$LessonProgressTableAnnotationComposer,
          $$LessonProgressTableCreateCompanionBuilder,
          $$LessonProgressTableUpdateCompanionBuilder,
          (LessonProgressData, $$LessonProgressTableReferences),
          LessonProgressData,
          PrefetchHooks Function({bool lessonId})
        > {
  $$LessonProgressTableTableManager(
    _$AppDatabase db,
    $LessonProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LessonProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LessonProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LessonProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> lessonId = const Value.absent(),
                Value<int> completedSteps = const Value.absent(),
                Value<int> totalSteps = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonProgressCompanion(
                lessonId: lessonId,
                completedSteps: completedSteps,
                totalSteps: totalSteps,
                isCompleted: isCompleted,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String lessonId,
                Value<int> completedSteps = const Value.absent(),
                Value<int> totalSteps = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => LessonProgressCompanion.insert(
                lessonId: lessonId,
                completedSteps: completedSteps,
                totalSteps: totalSteps,
                isCompleted: isCompleted,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LessonProgressTable, LessonProgressData>(table),
                  $$LessonProgressTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({lessonId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (lessonId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.lessonId,
                        referencedTable: $$LessonProgressTableReferences
                            ._lessonIdTable(db),
                        referencedColumn: $$LessonProgressTableReferences
                            ._lessonIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LessonProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LessonProgressTable,
      LessonProgressData,
      $$LessonProgressTableFilterComposer,
      $$LessonProgressTableOrderingComposer,
      $$LessonProgressTableAnnotationComposer,
      $$LessonProgressTableCreateCompanionBuilder,
      $$LessonProgressTableUpdateCompanionBuilder,
      (LessonProgressData, $$LessonProgressTableReferences),
      LessonProgressData,
      PrefetchHooks Function({bool lessonId})
    >;
typedef $$ActiveExamSessionsTableCreateCompanionBuilder =
    ActiveExamSessionsCompanion Function({
      required String id,
      required String track,
      required String mode,
      required String title,
      required String questionIdsJson,
      required String answersJson,
      required int remainingSeconds,
      Value<int> currentIndex,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ActiveExamSessionsTableUpdateCompanionBuilder =
    ActiveExamSessionsCompanion Function({
      Value<String> id,
      Value<String> track,
      Value<String> mode,
      Value<String> title,
      Value<String> questionIdsJson,
      Value<String> answersJson,
      Value<int> remainingSeconds,
      Value<int> currentIndex,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ActiveExamSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $ActiveExamSessionsTable> {
  $$ActiveExamSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get track => $composableBuilder(
    column: $table.track,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionIdsJson => $composableBuilder(
    column: $table.questionIdsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answersJson => $composableBuilder(
    column: $table.answersJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remainingSeconds => $composableBuilder(
    column: $table.remainingSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActiveExamSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ActiveExamSessionsTable> {
  $$ActiveExamSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get track => $composableBuilder(
    column: $table.track,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionIdsJson => $composableBuilder(
    column: $table.questionIdsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answersJson => $composableBuilder(
    column: $table.answersJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remainingSeconds => $composableBuilder(
    column: $table.remainingSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActiveExamSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActiveExamSessionsTable> {
  $$ActiveExamSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get track =>
      $composableBuilder(column: $table.track, builder: (column) => column);

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get questionIdsJson => $composableBuilder(
    column: $table.questionIdsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get answersJson => $composableBuilder(
    column: $table.answersJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get remainingSeconds => $composableBuilder(
    column: $table.remainingSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ActiveExamSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActiveExamSessionsTable,
          ActiveExamSession,
          $$ActiveExamSessionsTableFilterComposer,
          $$ActiveExamSessionsTableOrderingComposer,
          $$ActiveExamSessionsTableAnnotationComposer,
          $$ActiveExamSessionsTableCreateCompanionBuilder,
          $$ActiveExamSessionsTableUpdateCompanionBuilder,
          (
            ActiveExamSession,
            BaseReferences<
              _$AppDatabase,
              $ActiveExamSessionsTable,
              ActiveExamSession
            >,
          ),
          ActiveExamSession,
          PrefetchHooks Function()
        > {
  $$ActiveExamSessionsTableTableManager(
    _$AppDatabase db,
    $ActiveExamSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActiveExamSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActiveExamSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActiveExamSessionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> track = const Value.absent(),
                Value<String> mode = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> questionIdsJson = const Value.absent(),
                Value<String> answersJson = const Value.absent(),
                Value<int> remainingSeconds = const Value.absent(),
                Value<int> currentIndex = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActiveExamSessionsCompanion(
                id: id,
                track: track,
                mode: mode,
                title: title,
                questionIdsJson: questionIdsJson,
                answersJson: answersJson,
                remainingSeconds: remainingSeconds,
                currentIndex: currentIndex,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String track,
                required String mode,
                required String title,
                required String questionIdsJson,
                required String answersJson,
                required int remainingSeconds,
                Value<int> currentIndex = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ActiveExamSessionsCompanion.insert(
                id: id,
                track: track,
                mode: mode,
                title: title,
                questionIdsJson: questionIdsJson,
                answersJson: answersJson,
                remainingSeconds: remainingSeconds,
                currentIndex: currentIndex,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ActiveExamSessionsTable, ActiveExamSession>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $ActiveExamSessionsTable,
                    ActiveExamSession
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActiveExamSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActiveExamSessionsTable,
      ActiveExamSession,
      $$ActiveExamSessionsTableFilterComposer,
      $$ActiveExamSessionsTableOrderingComposer,
      $$ActiveExamSessionsTableAnnotationComposer,
      $$ActiveExamSessionsTableCreateCompanionBuilder,
      $$ActiveExamSessionsTableUpdateCompanionBuilder,
      (
        ActiveExamSession,
        BaseReferences<
          _$AppDatabase,
          $ActiveExamSessionsTable,
          ActiveExamSession
        >,
      ),
      ActiveExamSession,
      PrefetchHooks Function()
    >;
typedef $$ExamAttemptsTableCreateCompanionBuilder =
    ExamAttemptsCompanion Function({
      required String id,
      required String track,
      required String title,
      required int rawCorrect,
      required int totalQuestions,
      required int scaledScore,
      required int scaledMax,
      required String gradeCode,
      required DateTime completedAt,
      Value<int> rowid,
    });
typedef $$ExamAttemptsTableUpdateCompanionBuilder =
    ExamAttemptsCompanion Function({
      Value<String> id,
      Value<String> track,
      Value<String> title,
      Value<int> rawCorrect,
      Value<int> totalQuestions,
      Value<int> scaledScore,
      Value<int> scaledMax,
      Value<String> gradeCode,
      Value<DateTime> completedAt,
      Value<int> rowid,
    });

class $$ExamAttemptsTableFilterComposer
    extends Composer<_$AppDatabase, $ExamAttemptsTable> {
  $$ExamAttemptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get track => $composableBuilder(
    column: $table.track,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rawCorrect => $composableBuilder(
    column: $table.rawCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scaledScore => $composableBuilder(
    column: $table.scaledScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scaledMax => $composableBuilder(
    column: $table.scaledMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gradeCode => $composableBuilder(
    column: $table.gradeCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExamAttemptsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExamAttemptsTable> {
  $$ExamAttemptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get track => $composableBuilder(
    column: $table.track,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rawCorrect => $composableBuilder(
    column: $table.rawCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scaledScore => $composableBuilder(
    column: $table.scaledScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scaledMax => $composableBuilder(
    column: $table.scaledMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gradeCode => $composableBuilder(
    column: $table.gradeCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExamAttemptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExamAttemptsTable> {
  $$ExamAttemptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get track =>
      $composableBuilder(column: $table.track, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get rawCorrect => $composableBuilder(
    column: $table.rawCorrect,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => column,
  );

  GeneratedColumn<int> get scaledScore => $composableBuilder(
    column: $table.scaledScore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get scaledMax =>
      $composableBuilder(column: $table.scaledMax, builder: (column) => column);

  GeneratedColumn<String> get gradeCode =>
      $composableBuilder(column: $table.gradeCode, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$ExamAttemptsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExamAttemptsTable,
          ExamAttempt,
          $$ExamAttemptsTableFilterComposer,
          $$ExamAttemptsTableOrderingComposer,
          $$ExamAttemptsTableAnnotationComposer,
          $$ExamAttemptsTableCreateCompanionBuilder,
          $$ExamAttemptsTableUpdateCompanionBuilder,
          (
            ExamAttempt,
            BaseReferences<_$AppDatabase, $ExamAttemptsTable, ExamAttempt>,
          ),
          ExamAttempt,
          PrefetchHooks Function()
        > {
  $$ExamAttemptsTableTableManager(_$AppDatabase db, $ExamAttemptsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExamAttemptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExamAttemptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExamAttemptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> track = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> rawCorrect = const Value.absent(),
                Value<int> totalQuestions = const Value.absent(),
                Value<int> scaledScore = const Value.absent(),
                Value<int> scaledMax = const Value.absent(),
                Value<String> gradeCode = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExamAttemptsCompanion(
                id: id,
                track: track,
                title: title,
                rawCorrect: rawCorrect,
                totalQuestions: totalQuestions,
                scaledScore: scaledScore,
                scaledMax: scaledMax,
                gradeCode: gradeCode,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String track,
                required String title,
                required int rawCorrect,
                required int totalQuestions,
                required int scaledScore,
                required int scaledMax,
                required String gradeCode,
                required DateTime completedAt,
                Value<int> rowid = const Value.absent(),
              }) => ExamAttemptsCompanion.insert(
                id: id,
                track: track,
                title: title,
                rawCorrect: rawCorrect,
                totalQuestions: totalQuestions,
                scaledScore: scaledScore,
                scaledMax: scaledMax,
                gradeCode: gradeCode,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExamAttemptsTable, ExamAttempt>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ExamAttemptsTable,
                    ExamAttempt
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExamAttemptsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExamAttemptsTable,
      ExamAttempt,
      $$ExamAttemptsTableFilterComposer,
      $$ExamAttemptsTableOrderingComposer,
      $$ExamAttemptsTableAnnotationComposer,
      $$ExamAttemptsTableCreateCompanionBuilder,
      $$ExamAttemptsTableUpdateCompanionBuilder,
      (
        ExamAttempt,
        BaseReferences<_$AppDatabase, $ExamAttemptsTable, ExamAttempt>,
      ),
      ExamAttempt,
      PrefetchHooks Function()
    >;
typedef $$FlashcardsTableCreateCompanionBuilder = FlashcardsCompanion Function({
  required String id,
  required String lessonId,
  required String subjectTitle,
  required String ruleText,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$FlashcardsTableUpdateCompanionBuilder = FlashcardsCompanion Function({
  Value<String> id,
  Value<String> lessonId,
  Value<String> subjectTitle,
  Value<String> ruleText,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$FlashcardsTableFilterComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectTitle => $composableBuilder(
    column: $table.subjectTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ruleText => $composableBuilder(
    column: $table.ruleText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FlashcardsTableOrderingComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectTitle => $composableBuilder(
    column: $table.subjectTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ruleText => $composableBuilder(
    column: $table.ruleText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FlashcardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lessonId =>
      $composableBuilder(column: $table.lessonId, builder: (column) => column);

  GeneratedColumn<String> get subjectTitle => $composableBuilder(
    column: $table.subjectTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ruleText =>
      $composableBuilder(column: $table.ruleText, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FlashcardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FlashcardsTable,
          Flashcard,
          $$FlashcardsTableFilterComposer,
          $$FlashcardsTableOrderingComposer,
          $$FlashcardsTableAnnotationComposer,
          $$FlashcardsTableCreateCompanionBuilder,
          $$FlashcardsTableUpdateCompanionBuilder,
          (
            Flashcard,
            BaseReferences<_$AppDatabase, $FlashcardsTable, Flashcard>,
          ),
          Flashcard,
          PrefetchHooks Function()
        > {
  $$FlashcardsTableTableManager(_$AppDatabase db, $FlashcardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FlashcardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FlashcardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FlashcardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> lessonId = const Value.absent(),
                Value<String> subjectTitle = const Value.absent(),
                Value<String> ruleText = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FlashcardsCompanion(
                id: id,
                lessonId: lessonId,
                subjectTitle: subjectTitle,
                ruleText: ruleText,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String lessonId,
                required String subjectTitle,
                required String ruleText,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => FlashcardsCompanion.insert(
                id: id,
                lessonId: lessonId,
                subjectTitle: subjectTitle,
                ruleText: ruleText,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FlashcardsTable, Flashcard>(table),
                  BaseReferences<_$AppDatabase, $FlashcardsTable, Flashcard>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FlashcardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FlashcardsTable,
      Flashcard,
      $$FlashcardsTableFilterComposer,
      $$FlashcardsTableOrderingComposer,
      $$FlashcardsTableAnnotationComposer,
      $$FlashcardsTableCreateCompanionBuilder,
      $$FlashcardsTableUpdateCompanionBuilder,
      (Flashcard, BaseReferences<_$AppDatabase, $FlashcardsTable, Flashcard>),
      Flashcard,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SubjectPacksTableTableManager get subjectPacks =>
      $$SubjectPacksTableTableManager(_db, _db.subjectPacks);
  $$LessonsTableTableManager get lessons =>
      $$LessonsTableTableManager(_db, _db.lessons);
  $$LessonStepsTableTableManager get lessonSteps =>
      $$LessonStepsTableTableManager(_db, _db.lessonSteps);
  $$QuestionsTableTableManager get questions =>
      $$QuestionsTableTableManager(_db, _db.questions);
  $$MistakeVaultSm2TableTableManager get mistakeVaultSm2 =>
      $$MistakeVaultSm2TableTableManager(_db, _db.mistakeVaultSm2);
  $$StudyPreferencesTableTableManager get studyPreferences =>
      $$StudyPreferencesTableTableManager(_db, _db.studyPreferences);
  $$LessonProgressTableTableManager get lessonProgress =>
      $$LessonProgressTableTableManager(_db, _db.lessonProgress);
  $$ActiveExamSessionsTableTableManager get activeExamSessions =>
      $$ActiveExamSessionsTableTableManager(_db, _db.activeExamSessions);
  $$ExamAttemptsTableTableManager get examAttempts =>
      $$ExamAttemptsTableTableManager(_db, _db.examAttempts);
  $$FlashcardsTableTableManager get flashcards =>
      $$FlashcardsTableTableManager(_db, _db.flashcards);
}
