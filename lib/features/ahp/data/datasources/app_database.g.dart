// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DecisionsTable extends Decisions
    with TableInfo<$DecisionsTable, Decision> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecisionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decisions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Decision> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Decision map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Decision(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $DecisionsTable createAlias(String alias) {
    return $DecisionsTable(attachedDatabase, alias);
  }
}

class Decision extends DataClass implements Insertable<Decision> {
  final int id;
  final String title;
  final DateTime createdAt;
  const Decision({
    required this.id,
    required this.title,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DecisionsCompanion toCompanion(bool nullToAbsent) {
    return DecisionsCompanion(
      id: Value(id),
      title: Value(title),
      createdAt: Value(createdAt),
    );
  }

  factory Decision.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Decision(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Decision copyWith({int? id, String? title, DateTime? createdAt}) => Decision(
    id: id ?? this.id,
    title: title ?? this.title,
    createdAt: createdAt ?? this.createdAt,
  );
  Decision copyWithCompanion(DecisionsCompanion data) {
    return Decision(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Decision(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Decision &&
          other.id == this.id &&
          other.title == this.title &&
          other.createdAt == this.createdAt);
}

class DecisionsCompanion extends UpdateCompanion<Decision> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> createdAt;
  const DecisionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DecisionsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.createdAt = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Decision> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DecisionsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<DateTime>? createdAt,
  }) {
    return DecisionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CriteriaTable extends Criteria
    with TableInfo<$CriteriaTable, CriteriaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CriteriaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _decisionIdMeta = const VerificationMeta(
    'decisionId',
  );
  @override
  late final GeneratedColumn<int> decisionId = GeneratedColumn<int>(
    'decision_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decisions (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seedOrderMeta = const VerificationMeta(
    'seedOrder',
  );
  @override
  late final GeneratedColumn<int> seedOrder = GeneratedColumn<int>(
    'seed_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    decisionId,
    name,
    seedOrder,
    value,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'criteria';
  @override
  VerificationContext validateIntegrity(
    Insertable<CriteriaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('decision_id')) {
      context.handle(
        _decisionIdMeta,
        decisionId.isAcceptableOrUnknown(data['decision_id']!, _decisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_decisionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('seed_order')) {
      context.handle(
        _seedOrderMeta,
        seedOrder.isAcceptableOrUnknown(data['seed_order']!, _seedOrderMeta),
      );
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CriteriaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CriteriaData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      decisionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}decision_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      seedOrder:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}seed_order'],
          )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      ),
    );
  }

  @override
  $CriteriaTable createAlias(String alias) {
    return $CriteriaTable(attachedDatabase, alias);
  }
}

class CriteriaData extends DataClass implements Insertable<CriteriaData> {
  final int id;
  final int decisionId;
  final String name;
  final int seedOrder;
  final double? value;
  const CriteriaData({
    required this.id,
    required this.decisionId,
    required this.name,
    required this.seedOrder,
    this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['decision_id'] = Variable<int>(decisionId);
    map['name'] = Variable<String>(name);
    map['seed_order'] = Variable<int>(seedOrder);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<double>(value);
    }
    return map;
  }

  CriteriaCompanion toCompanion(bool nullToAbsent) {
    return CriteriaCompanion(
      id: Value(id),
      decisionId: Value(decisionId),
      name: Value(name),
      seedOrder: Value(seedOrder),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory CriteriaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CriteriaData(
      id: serializer.fromJson<int>(json['id']),
      decisionId: serializer.fromJson<int>(json['decisionId']),
      name: serializer.fromJson<String>(json['name']),
      seedOrder: serializer.fromJson<int>(json['seedOrder']),
      value: serializer.fromJson<double?>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'decisionId': serializer.toJson<int>(decisionId),
      'name': serializer.toJson<String>(name),
      'seedOrder': serializer.toJson<int>(seedOrder),
      'value': serializer.toJson<double?>(value),
    };
  }

  CriteriaData copyWith({
    int? id,
    int? decisionId,
    String? name,
    int? seedOrder,
    Value<double?> value = const Value.absent(),
  }) => CriteriaData(
    id: id ?? this.id,
    decisionId: decisionId ?? this.decisionId,
    name: name ?? this.name,
    seedOrder: seedOrder ?? this.seedOrder,
    value: value.present ? value.value : this.value,
  );
  CriteriaData copyWithCompanion(CriteriaCompanion data) {
    return CriteriaData(
      id: data.id.present ? data.id.value : this.id,
      decisionId:
          data.decisionId.present ? data.decisionId.value : this.decisionId,
      name: data.name.present ? data.name.value : this.name,
      seedOrder: data.seedOrder.present ? data.seedOrder.value : this.seedOrder,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CriteriaData(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('name: $name, ')
          ..write('seedOrder: $seedOrder, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, decisionId, name, seedOrder, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CriteriaData &&
          other.id == this.id &&
          other.decisionId == this.decisionId &&
          other.name == this.name &&
          other.seedOrder == this.seedOrder &&
          other.value == this.value);
}

class CriteriaCompanion extends UpdateCompanion<CriteriaData> {
  final Value<int> id;
  final Value<int> decisionId;
  final Value<String> name;
  final Value<int> seedOrder;
  final Value<double?> value;
  const CriteriaCompanion({
    this.id = const Value.absent(),
    this.decisionId = const Value.absent(),
    this.name = const Value.absent(),
    this.seedOrder = const Value.absent(),
    this.value = const Value.absent(),
  });
  CriteriaCompanion.insert({
    this.id = const Value.absent(),
    required int decisionId,
    required String name,
    this.seedOrder = const Value.absent(),
    this.value = const Value.absent(),
  }) : decisionId = Value(decisionId),
       name = Value(name);
  static Insertable<CriteriaData> custom({
    Expression<int>? id,
    Expression<int>? decisionId,
    Expression<String>? name,
    Expression<int>? seedOrder,
    Expression<double>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (decisionId != null) 'decision_id': decisionId,
      if (name != null) 'name': name,
      if (seedOrder != null) 'seed_order': seedOrder,
      if (value != null) 'value': value,
    });
  }

  CriteriaCompanion copyWith({
    Value<int>? id,
    Value<int>? decisionId,
    Value<String>? name,
    Value<int>? seedOrder,
    Value<double?>? value,
  }) {
    return CriteriaCompanion(
      id: id ?? this.id,
      decisionId: decisionId ?? this.decisionId,
      name: name ?? this.name,
      seedOrder: seedOrder ?? this.seedOrder,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (decisionId.present) {
      map['decision_id'] = Variable<int>(decisionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (seedOrder.present) {
      map['seed_order'] = Variable<int>(seedOrder.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CriteriaCompanion(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('name: $name, ')
          ..write('seedOrder: $seedOrder, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $AlternativesTable extends Alternatives
    with TableInfo<$AlternativesTable, Alternative> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlternativesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _decisionIdMeta = const VerificationMeta(
    'decisionId',
  );
  @override
  late final GeneratedColumn<int> decisionId = GeneratedColumn<int>(
    'decision_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decisions (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
    'score',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, decisionId, name, score];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alternatives';
  @override
  VerificationContext validateIntegrity(
    Insertable<Alternative> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('decision_id')) {
      context.handle(
        _decisionIdMeta,
        decisionId.isAcceptableOrUnknown(data['decision_id']!, _decisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_decisionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Alternative map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Alternative(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      decisionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}decision_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}score'],
      ),
    );
  }

  @override
  $AlternativesTable createAlias(String alias) {
    return $AlternativesTable(attachedDatabase, alias);
  }
}

class Alternative extends DataClass implements Insertable<Alternative> {
  final int id;
  final int decisionId;
  final String name;
  final double? score;
  const Alternative({
    required this.id,
    required this.decisionId,
    required this.name,
    this.score,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['decision_id'] = Variable<int>(decisionId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<double>(score);
    }
    return map;
  }

  AlternativesCompanion toCompanion(bool nullToAbsent) {
    return AlternativesCompanion(
      id: Value(id),
      decisionId: Value(decisionId),
      name: Value(name),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
    );
  }

  factory Alternative.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Alternative(
      id: serializer.fromJson<int>(json['id']),
      decisionId: serializer.fromJson<int>(json['decisionId']),
      name: serializer.fromJson<String>(json['name']),
      score: serializer.fromJson<double?>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'decisionId': serializer.toJson<int>(decisionId),
      'name': serializer.toJson<String>(name),
      'score': serializer.toJson<double?>(score),
    };
  }

  Alternative copyWith({
    int? id,
    int? decisionId,
    String? name,
    Value<double?> score = const Value.absent(),
  }) => Alternative(
    id: id ?? this.id,
    decisionId: decisionId ?? this.decisionId,
    name: name ?? this.name,
    score: score.present ? score.value : this.score,
  );
  Alternative copyWithCompanion(AlternativesCompanion data) {
    return Alternative(
      id: data.id.present ? data.id.value : this.id,
      decisionId:
          data.decisionId.present ? data.decisionId.value : this.decisionId,
      name: data.name.present ? data.name.value : this.name,
      score: data.score.present ? data.score.value : this.score,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Alternative(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('name: $name, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, decisionId, name, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alternative &&
          other.id == this.id &&
          other.decisionId == this.decisionId &&
          other.name == this.name &&
          other.score == this.score);
}

class AlternativesCompanion extends UpdateCompanion<Alternative> {
  final Value<int> id;
  final Value<int> decisionId;
  final Value<String> name;
  final Value<double?> score;
  const AlternativesCompanion({
    this.id = const Value.absent(),
    this.decisionId = const Value.absent(),
    this.name = const Value.absent(),
    this.score = const Value.absent(),
  });
  AlternativesCompanion.insert({
    this.id = const Value.absent(),
    required int decisionId,
    required String name,
    this.score = const Value.absent(),
  }) : decisionId = Value(decisionId),
       name = Value(name);
  static Insertable<Alternative> custom({
    Expression<int>? id,
    Expression<int>? decisionId,
    Expression<String>? name,
    Expression<double>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (decisionId != null) 'decision_id': decisionId,
      if (name != null) 'name': name,
      if (score != null) 'score': score,
    });
  }

  AlternativesCompanion copyWith({
    Value<int>? id,
    Value<int>? decisionId,
    Value<String>? name,
    Value<double?>? score,
  }) {
    return AlternativesCompanion(
      id: id ?? this.id,
      decisionId: decisionId ?? this.decisionId,
      name: name ?? this.name,
      score: score ?? this.score,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (decisionId.present) {
      map['decision_id'] = Variable<int>(decisionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlternativesCompanion(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('name: $name, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }
}

class $ComparisonsTable extends Comparisons
    with TableInfo<$ComparisonsTable, Comparison> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComparisonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _decisionIdMeta = const VerificationMeta(
    'decisionId',
  );
  @override
  late final GeneratedColumn<int> decisionId = GeneratedColumn<int>(
    'decision_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decisions (id)',
    ),
  );
  static const VerificationMeta _critAMeta = const VerificationMeta('critA');
  @override
  late final GeneratedColumn<int> critA = GeneratedColumn<int>(
    'crit_a',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES criteria (id)',
    ),
  );
  static const VerificationMeta _critBMeta = const VerificationMeta('critB');
  @override
  late final GeneratedColumn<int> critB = GeneratedColumn<int>(
    'crit_b',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES criteria (id)',
    ),
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, decisionId, critA, critB, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comparisons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Comparison> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('decision_id')) {
      context.handle(
        _decisionIdMeta,
        decisionId.isAcceptableOrUnknown(data['decision_id']!, _decisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_decisionIdMeta);
    }
    if (data.containsKey('crit_a')) {
      context.handle(
        _critAMeta,
        critA.isAcceptableOrUnknown(data['crit_a']!, _critAMeta),
      );
    } else if (isInserting) {
      context.missing(_critAMeta);
    }
    if (data.containsKey('crit_b')) {
      context.handle(
        _critBMeta,
        critB.isAcceptableOrUnknown(data['crit_b']!, _critBMeta),
      );
    } else if (isInserting) {
      context.missing(_critBMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Comparison map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Comparison(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      decisionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}decision_id'],
          )!,
      critA:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}crit_a'],
          )!,
      critB:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}crit_b'],
          )!,
      value:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}value'],
          )!,
    );
  }

  @override
  $ComparisonsTable createAlias(String alias) {
    return $ComparisonsTable(attachedDatabase, alias);
  }
}

class Comparison extends DataClass implements Insertable<Comparison> {
  final int id;
  final int decisionId;
  final int critA;
  final int critB;
  final double value;
  const Comparison({
    required this.id,
    required this.decisionId,
    required this.critA,
    required this.critB,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['decision_id'] = Variable<int>(decisionId);
    map['crit_a'] = Variable<int>(critA);
    map['crit_b'] = Variable<int>(critB);
    map['value'] = Variable<double>(value);
    return map;
  }

  ComparisonsCompanion toCompanion(bool nullToAbsent) {
    return ComparisonsCompanion(
      id: Value(id),
      decisionId: Value(decisionId),
      critA: Value(critA),
      critB: Value(critB),
      value: Value(value),
    );
  }

  factory Comparison.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Comparison(
      id: serializer.fromJson<int>(json['id']),
      decisionId: serializer.fromJson<int>(json['decisionId']),
      critA: serializer.fromJson<int>(json['critA']),
      critB: serializer.fromJson<int>(json['critB']),
      value: serializer.fromJson<double>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'decisionId': serializer.toJson<int>(decisionId),
      'critA': serializer.toJson<int>(critA),
      'critB': serializer.toJson<int>(critB),
      'value': serializer.toJson<double>(value),
    };
  }

  Comparison copyWith({
    int? id,
    int? decisionId,
    int? critA,
    int? critB,
    double? value,
  }) => Comparison(
    id: id ?? this.id,
    decisionId: decisionId ?? this.decisionId,
    critA: critA ?? this.critA,
    critB: critB ?? this.critB,
    value: value ?? this.value,
  );
  Comparison copyWithCompanion(ComparisonsCompanion data) {
    return Comparison(
      id: data.id.present ? data.id.value : this.id,
      decisionId:
          data.decisionId.present ? data.decisionId.value : this.decisionId,
      critA: data.critA.present ? data.critA.value : this.critA,
      critB: data.critB.present ? data.critB.value : this.critB,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Comparison(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('critA: $critA, ')
          ..write('critB: $critB, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, decisionId, critA, critB, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comparison &&
          other.id == this.id &&
          other.decisionId == this.decisionId &&
          other.critA == this.critA &&
          other.critB == this.critB &&
          other.value == this.value);
}

class ComparisonsCompanion extends UpdateCompanion<Comparison> {
  final Value<int> id;
  final Value<int> decisionId;
  final Value<int> critA;
  final Value<int> critB;
  final Value<double> value;
  const ComparisonsCompanion({
    this.id = const Value.absent(),
    this.decisionId = const Value.absent(),
    this.critA = const Value.absent(),
    this.critB = const Value.absent(),
    this.value = const Value.absent(),
  });
  ComparisonsCompanion.insert({
    this.id = const Value.absent(),
    required int decisionId,
    required int critA,
    required int critB,
    required double value,
  }) : decisionId = Value(decisionId),
       critA = Value(critA),
       critB = Value(critB),
       value = Value(value);
  static Insertable<Comparison> custom({
    Expression<int>? id,
    Expression<int>? decisionId,
    Expression<int>? critA,
    Expression<int>? critB,
    Expression<double>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (decisionId != null) 'decision_id': decisionId,
      if (critA != null) 'crit_a': critA,
      if (critB != null) 'crit_b': critB,
      if (value != null) 'value': value,
    });
  }

  ComparisonsCompanion copyWith({
    Value<int>? id,
    Value<int>? decisionId,
    Value<int>? critA,
    Value<int>? critB,
    Value<double>? value,
  }) {
    return ComparisonsCompanion(
      id: id ?? this.id,
      decisionId: decisionId ?? this.decisionId,
      critA: critA ?? this.critA,
      critB: critB ?? this.critB,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (decisionId.present) {
      map['decision_id'] = Variable<int>(decisionId.value);
    }
    if (critA.present) {
      map['crit_a'] = Variable<int>(critA.value);
    }
    if (critB.present) {
      map['crit_b'] = Variable<int>(critB.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComparisonsCompanion(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('critA: $critA, ')
          ..write('critB: $critB, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $AltComparisonsTable extends AltComparisons
    with TableInfo<$AltComparisonsTable, AltComparison> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AltComparisonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _decisionIdMeta = const VerificationMeta(
    'decisionId',
  );
  @override
  late final GeneratedColumn<int> decisionId = GeneratedColumn<int>(
    'decision_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decisions (id)',
    ),
  );
  static const VerificationMeta _criterionIdMeta = const VerificationMeta(
    'criterionId',
  );
  @override
  late final GeneratedColumn<int> criterionId = GeneratedColumn<int>(
    'criterion_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES criteria (id)',
    ),
  );
  static const VerificationMeta _altAMeta = const VerificationMeta('altA');
  @override
  late final GeneratedColumn<int> altA = GeneratedColumn<int>(
    'alt_a',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _altBMeta = const VerificationMeta('altB');
  @override
  late final GeneratedColumn<int> altB = GeneratedColumn<int>(
    'alt_b',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    decisionId,
    criterionId,
    altA,
    altB,
    value,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alt_comparisons';
  @override
  VerificationContext validateIntegrity(
    Insertable<AltComparison> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('decision_id')) {
      context.handle(
        _decisionIdMeta,
        decisionId.isAcceptableOrUnknown(data['decision_id']!, _decisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_decisionIdMeta);
    }
    if (data.containsKey('criterion_id')) {
      context.handle(
        _criterionIdMeta,
        criterionId.isAcceptableOrUnknown(
          data['criterion_id']!,
          _criterionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_criterionIdMeta);
    }
    if (data.containsKey('alt_a')) {
      context.handle(
        _altAMeta,
        altA.isAcceptableOrUnknown(data['alt_a']!, _altAMeta),
      );
    } else if (isInserting) {
      context.missing(_altAMeta);
    }
    if (data.containsKey('alt_b')) {
      context.handle(
        _altBMeta,
        altB.isAcceptableOrUnknown(data['alt_b']!, _altBMeta),
      );
    } else if (isInserting) {
      context.missing(_altBMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AltComparison map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AltComparison(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      decisionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}decision_id'],
          )!,
      criterionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}criterion_id'],
          )!,
      altA:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}alt_a'],
          )!,
      altB:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}alt_b'],
          )!,
      value:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}value'],
          )!,
    );
  }

  @override
  $AltComparisonsTable createAlias(String alias) {
    return $AltComparisonsTable(attachedDatabase, alias);
  }
}

class AltComparison extends DataClass implements Insertable<AltComparison> {
  final int id;
  final int decisionId;
  final int criterionId;
  final int altA;
  final int altB;
  final double value;
  const AltComparison({
    required this.id,
    required this.decisionId,
    required this.criterionId,
    required this.altA,
    required this.altB,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['decision_id'] = Variable<int>(decisionId);
    map['criterion_id'] = Variable<int>(criterionId);
    map['alt_a'] = Variable<int>(altA);
    map['alt_b'] = Variable<int>(altB);
    map['value'] = Variable<double>(value);
    return map;
  }

  AltComparisonsCompanion toCompanion(bool nullToAbsent) {
    return AltComparisonsCompanion(
      id: Value(id),
      decisionId: Value(decisionId),
      criterionId: Value(criterionId),
      altA: Value(altA),
      altB: Value(altB),
      value: Value(value),
    );
  }

  factory AltComparison.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AltComparison(
      id: serializer.fromJson<int>(json['id']),
      decisionId: serializer.fromJson<int>(json['decisionId']),
      criterionId: serializer.fromJson<int>(json['criterionId']),
      altA: serializer.fromJson<int>(json['altA']),
      altB: serializer.fromJson<int>(json['altB']),
      value: serializer.fromJson<double>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'decisionId': serializer.toJson<int>(decisionId),
      'criterionId': serializer.toJson<int>(criterionId),
      'altA': serializer.toJson<int>(altA),
      'altB': serializer.toJson<int>(altB),
      'value': serializer.toJson<double>(value),
    };
  }

  AltComparison copyWith({
    int? id,
    int? decisionId,
    int? criterionId,
    int? altA,
    int? altB,
    double? value,
  }) => AltComparison(
    id: id ?? this.id,
    decisionId: decisionId ?? this.decisionId,
    criterionId: criterionId ?? this.criterionId,
    altA: altA ?? this.altA,
    altB: altB ?? this.altB,
    value: value ?? this.value,
  );
  AltComparison copyWithCompanion(AltComparisonsCompanion data) {
    return AltComparison(
      id: data.id.present ? data.id.value : this.id,
      decisionId:
          data.decisionId.present ? data.decisionId.value : this.decisionId,
      criterionId:
          data.criterionId.present ? data.criterionId.value : this.criterionId,
      altA: data.altA.present ? data.altA.value : this.altA,
      altB: data.altB.present ? data.altB.value : this.altB,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AltComparison(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('criterionId: $criterionId, ')
          ..write('altA: $altA, ')
          ..write('altB: $altB, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, decisionId, criterionId, altA, altB, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AltComparison &&
          other.id == this.id &&
          other.decisionId == this.decisionId &&
          other.criterionId == this.criterionId &&
          other.altA == this.altA &&
          other.altB == this.altB &&
          other.value == this.value);
}

class AltComparisonsCompanion extends UpdateCompanion<AltComparison> {
  final Value<int> id;
  final Value<int> decisionId;
  final Value<int> criterionId;
  final Value<int> altA;
  final Value<int> altB;
  final Value<double> value;
  const AltComparisonsCompanion({
    this.id = const Value.absent(),
    this.decisionId = const Value.absent(),
    this.criterionId = const Value.absent(),
    this.altA = const Value.absent(),
    this.altB = const Value.absent(),
    this.value = const Value.absent(),
  });
  AltComparisonsCompanion.insert({
    this.id = const Value.absent(),
    required int decisionId,
    required int criterionId,
    required int altA,
    required int altB,
    required double value,
  }) : decisionId = Value(decisionId),
       criterionId = Value(criterionId),
       altA = Value(altA),
       altB = Value(altB),
       value = Value(value);
  static Insertable<AltComparison> custom({
    Expression<int>? id,
    Expression<int>? decisionId,
    Expression<int>? criterionId,
    Expression<int>? altA,
    Expression<int>? altB,
    Expression<double>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (decisionId != null) 'decision_id': decisionId,
      if (criterionId != null) 'criterion_id': criterionId,
      if (altA != null) 'alt_a': altA,
      if (altB != null) 'alt_b': altB,
      if (value != null) 'value': value,
    });
  }

  AltComparisonsCompanion copyWith({
    Value<int>? id,
    Value<int>? decisionId,
    Value<int>? criterionId,
    Value<int>? altA,
    Value<int>? altB,
    Value<double>? value,
  }) {
    return AltComparisonsCompanion(
      id: id ?? this.id,
      decisionId: decisionId ?? this.decisionId,
      criterionId: criterionId ?? this.criterionId,
      altA: altA ?? this.altA,
      altB: altB ?? this.altB,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (decisionId.present) {
      map['decision_id'] = Variable<int>(decisionId.value);
    }
    if (criterionId.present) {
      map['criterion_id'] = Variable<int>(criterionId.value);
    }
    if (altA.present) {
      map['alt_a'] = Variable<int>(altA.value);
    }
    if (altB.present) {
      map['alt_b'] = Variable<int>(altB.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AltComparisonsCompanion(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('criterionId: $criterionId, ')
          ..write('altA: $altA, ')
          ..write('altB: $altB, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DecisionsTable decisions = $DecisionsTable(this);
  late final $CriteriaTable criteria = $CriteriaTable(this);
  late final $AlternativesTable alternatives = $AlternativesTable(this);
  late final $ComparisonsTable comparisons = $ComparisonsTable(this);
  late final $AltComparisonsTable altComparisons = $AltComparisonsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    decisions,
    criteria,
    alternatives,
    comparisons,
    altComparisons,
  ];
}

typedef $$DecisionsTableCreateCompanionBuilder =
    DecisionsCompanion Function({
      Value<int> id,
      required String title,
      Value<DateTime> createdAt,
    });
typedef $$DecisionsTableUpdateCompanionBuilder =
    DecisionsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<DateTime> createdAt,
    });

final class $$DecisionsTableReferences
    extends BaseReferences<_$AppDatabase, $DecisionsTable, Decision> {
  $$DecisionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CriteriaTable, List<CriteriaData>>
  _criteriaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.criteria,
    aliasName: $_aliasNameGenerator(db.decisions.id, db.criteria.decisionId),
  );

  $$CriteriaTableProcessedTableManager get criteriaRefs {
    final manager = $$CriteriaTableTableManager(
      $_db,
      $_db.criteria,
    ).filter((f) => f.decisionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_criteriaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AlternativesTable, List<Alternative>>
  _alternativesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.alternatives,
    aliasName: $_aliasNameGenerator(
      db.decisions.id,
      db.alternatives.decisionId,
    ),
  );

  $$AlternativesTableProcessedTableManager get alternativesRefs {
    final manager = $$AlternativesTableTableManager(
      $_db,
      $_db.alternatives,
    ).filter((f) => f.decisionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_alternativesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ComparisonsTable, List<Comparison>>
  _comparisonsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.comparisons,
    aliasName: $_aliasNameGenerator(db.decisions.id, db.comparisons.decisionId),
  );

  $$ComparisonsTableProcessedTableManager get comparisonsRefs {
    final manager = $$ComparisonsTableTableManager(
      $_db,
      $_db.comparisons,
    ).filter((f) => f.decisionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_comparisonsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AltComparisonsTable, List<AltComparison>>
  _altComparisonsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.altComparisons,
    aliasName: $_aliasNameGenerator(
      db.decisions.id,
      db.altComparisons.decisionId,
    ),
  );

  $$AltComparisonsTableProcessedTableManager get altComparisonsRefs {
    final manager = $$AltComparisonsTableTableManager(
      $_db,
      $_db.altComparisons,
    ).filter((f) => f.decisionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_altComparisonsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DecisionsTableFilterComposer
    extends Composer<_$AppDatabase, $DecisionsTable> {
  $$DecisionsTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> criteriaRefs(
    Expression<bool> Function($$CriteriaTableFilterComposer f) f,
  ) {
    final $$CriteriaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.criteria,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CriteriaTableFilterComposer(
            $db: $db,
            $table: $db.criteria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> alternativesRefs(
    Expression<bool> Function($$AlternativesTableFilterComposer f) f,
  ) {
    final $$AlternativesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alternatives,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlternativesTableFilterComposer(
            $db: $db,
            $table: $db.alternatives,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> comparisonsRefs(
    Expression<bool> Function($$ComparisonsTableFilterComposer f) f,
  ) {
    final $$ComparisonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.comparisons,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ComparisonsTableFilterComposer(
            $db: $db,
            $table: $db.comparisons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> altComparisonsRefs(
    Expression<bool> Function($$AltComparisonsTableFilterComposer f) f,
  ) {
    final $$AltComparisonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.altComparisons,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AltComparisonsTableFilterComposer(
            $db: $db,
            $table: $db.altComparisons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DecisionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DecisionsTable> {
  $$DecisionsTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DecisionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecisionsTable> {
  $$DecisionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> criteriaRefs<T extends Object>(
    Expression<T> Function($$CriteriaTableAnnotationComposer a) f,
  ) {
    final $$CriteriaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.criteria,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CriteriaTableAnnotationComposer(
            $db: $db,
            $table: $db.criteria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> alternativesRefs<T extends Object>(
    Expression<T> Function($$AlternativesTableAnnotationComposer a) f,
  ) {
    final $$AlternativesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alternatives,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlternativesTableAnnotationComposer(
            $db: $db,
            $table: $db.alternatives,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> comparisonsRefs<T extends Object>(
    Expression<T> Function($$ComparisonsTableAnnotationComposer a) f,
  ) {
    final $$ComparisonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.comparisons,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ComparisonsTableAnnotationComposer(
            $db: $db,
            $table: $db.comparisons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> altComparisonsRefs<T extends Object>(
    Expression<T> Function($$AltComparisonsTableAnnotationComposer a) f,
  ) {
    final $$AltComparisonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.altComparisons,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AltComparisonsTableAnnotationComposer(
            $db: $db,
            $table: $db.altComparisons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DecisionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DecisionsTable,
          Decision,
          $$DecisionsTableFilterComposer,
          $$DecisionsTableOrderingComposer,
          $$DecisionsTableAnnotationComposer,
          $$DecisionsTableCreateCompanionBuilder,
          $$DecisionsTableUpdateCompanionBuilder,
          (Decision, $$DecisionsTableReferences),
          Decision,
          PrefetchHooks Function({
            bool criteriaRefs,
            bool alternativesRefs,
            bool comparisonsRefs,
            bool altComparisonsRefs,
          })
        > {
  $$DecisionsTableTableManager(_$AppDatabase db, $DecisionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DecisionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DecisionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DecisionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DecisionsCompanion(
                id: id,
                title: title,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<DateTime> createdAt = const Value.absent(),
              }) => DecisionsCompanion.insert(
                id: id,
                title: title,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$DecisionsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            criteriaRefs = false,
            alternativesRefs = false,
            comparisonsRefs = false,
            altComparisonsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (criteriaRefs) db.criteria,
                if (alternativesRefs) db.alternatives,
                if (comparisonsRefs) db.comparisons,
                if (altComparisonsRefs) db.altComparisons,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (criteriaRefs)
                    await $_getPrefetchedData<
                      Decision,
                      $DecisionsTable,
                      CriteriaData
                    >(
                      currentTable: table,
                      referencedTable: $$DecisionsTableReferences
                          ._criteriaRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$DecisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).criteriaRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.decisionId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (alternativesRefs)
                    await $_getPrefetchedData<
                      Decision,
                      $DecisionsTable,
                      Alternative
                    >(
                      currentTable: table,
                      referencedTable: $$DecisionsTableReferences
                          ._alternativesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$DecisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).alternativesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.decisionId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (comparisonsRefs)
                    await $_getPrefetchedData<
                      Decision,
                      $DecisionsTable,
                      Comparison
                    >(
                      currentTable: table,
                      referencedTable: $$DecisionsTableReferences
                          ._comparisonsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$DecisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).comparisonsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.decisionId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (altComparisonsRefs)
                    await $_getPrefetchedData<
                      Decision,
                      $DecisionsTable,
                      AltComparison
                    >(
                      currentTable: table,
                      referencedTable: $$DecisionsTableReferences
                          ._altComparisonsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$DecisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).altComparisonsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.decisionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DecisionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DecisionsTable,
      Decision,
      $$DecisionsTableFilterComposer,
      $$DecisionsTableOrderingComposer,
      $$DecisionsTableAnnotationComposer,
      $$DecisionsTableCreateCompanionBuilder,
      $$DecisionsTableUpdateCompanionBuilder,
      (Decision, $$DecisionsTableReferences),
      Decision,
      PrefetchHooks Function({
        bool criteriaRefs,
        bool alternativesRefs,
        bool comparisonsRefs,
        bool altComparisonsRefs,
      })
    >;
typedef $$CriteriaTableCreateCompanionBuilder =
    CriteriaCompanion Function({
      Value<int> id,
      required int decisionId,
      required String name,
      Value<int> seedOrder,
      Value<double?> value,
    });
typedef $$CriteriaTableUpdateCompanionBuilder =
    CriteriaCompanion Function({
      Value<int> id,
      Value<int> decisionId,
      Value<String> name,
      Value<int> seedOrder,
      Value<double?> value,
    });

final class $$CriteriaTableReferences
    extends BaseReferences<_$AppDatabase, $CriteriaTable, CriteriaData> {
  $$CriteriaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DecisionsTable _decisionIdTable(_$AppDatabase db) =>
      db.decisions.createAlias(
        $_aliasNameGenerator(db.criteria.decisionId, db.decisions.id),
      );

  $$DecisionsTableProcessedTableManager get decisionId {
    final $_column = $_itemColumn<int>('decision_id')!;

    final manager = $$DecisionsTableTableManager(
      $_db,
      $_db.decisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_decisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AltComparisonsTable, List<AltComparison>>
  _altComparisonsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.altComparisons,
    aliasName: $_aliasNameGenerator(
      db.criteria.id,
      db.altComparisons.criterionId,
    ),
  );

  $$AltComparisonsTableProcessedTableManager get altComparisonsRefs {
    final manager = $$AltComparisonsTableTableManager(
      $_db,
      $_db.altComparisons,
    ).filter((f) => f.criterionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_altComparisonsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CriteriaTableFilterComposer
    extends Composer<_$AppDatabase, $CriteriaTable> {
  $$CriteriaTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seedOrder => $composableBuilder(
    column: $table.seedOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$DecisionsTableFilterComposer get decisionId {
    final $$DecisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableFilterComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> altComparisonsRefs(
    Expression<bool> Function($$AltComparisonsTableFilterComposer f) f,
  ) {
    final $$AltComparisonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.altComparisons,
      getReferencedColumn: (t) => t.criterionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AltComparisonsTableFilterComposer(
            $db: $db,
            $table: $db.altComparisons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CriteriaTableOrderingComposer
    extends Composer<_$AppDatabase, $CriteriaTable> {
  $$CriteriaTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seedOrder => $composableBuilder(
    column: $table.seedOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$DecisionsTableOrderingComposer get decisionId {
    final $$DecisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableOrderingComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CriteriaTableAnnotationComposer
    extends Composer<_$AppDatabase, $CriteriaTable> {
  $$CriteriaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get seedOrder =>
      $composableBuilder(column: $table.seedOrder, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$DecisionsTableAnnotationComposer get decisionId {
    final $$DecisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> altComparisonsRefs<T extends Object>(
    Expression<T> Function($$AltComparisonsTableAnnotationComposer a) f,
  ) {
    final $$AltComparisonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.altComparisons,
      getReferencedColumn: (t) => t.criterionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AltComparisonsTableAnnotationComposer(
            $db: $db,
            $table: $db.altComparisons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CriteriaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CriteriaTable,
          CriteriaData,
          $$CriteriaTableFilterComposer,
          $$CriteriaTableOrderingComposer,
          $$CriteriaTableAnnotationComposer,
          $$CriteriaTableCreateCompanionBuilder,
          $$CriteriaTableUpdateCompanionBuilder,
          (CriteriaData, $$CriteriaTableReferences),
          CriteriaData,
          PrefetchHooks Function({bool decisionId, bool altComparisonsRefs})
        > {
  $$CriteriaTableTableManager(_$AppDatabase db, $CriteriaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CriteriaTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CriteriaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CriteriaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> decisionId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> seedOrder = const Value.absent(),
                Value<double?> value = const Value.absent(),
              }) => CriteriaCompanion(
                id: id,
                decisionId: decisionId,
                name: name,
                seedOrder: seedOrder,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int decisionId,
                required String name,
                Value<int> seedOrder = const Value.absent(),
                Value<double?> value = const Value.absent(),
              }) => CriteriaCompanion.insert(
                id: id,
                decisionId: decisionId,
                name: name,
                seedOrder: seedOrder,
                value: value,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CriteriaTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            decisionId = false,
            altComparisonsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (altComparisonsRefs) db.altComparisons,
              ],
              addJoins: <
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
                if (decisionId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.decisionId,
                            referencedTable: $$CriteriaTableReferences
                                ._decisionIdTable(db),
                            referencedColumn:
                                $$CriteriaTableReferences
                                    ._decisionIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (altComparisonsRefs)
                    await $_getPrefetchedData<
                      CriteriaData,
                      $CriteriaTable,
                      AltComparison
                    >(
                      currentTable: table,
                      referencedTable: $$CriteriaTableReferences
                          ._altComparisonsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CriteriaTableReferences(
                                db,
                                table,
                                p0,
                              ).altComparisonsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.criterionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CriteriaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CriteriaTable,
      CriteriaData,
      $$CriteriaTableFilterComposer,
      $$CriteriaTableOrderingComposer,
      $$CriteriaTableAnnotationComposer,
      $$CriteriaTableCreateCompanionBuilder,
      $$CriteriaTableUpdateCompanionBuilder,
      (CriteriaData, $$CriteriaTableReferences),
      CriteriaData,
      PrefetchHooks Function({bool decisionId, bool altComparisonsRefs})
    >;
typedef $$AlternativesTableCreateCompanionBuilder =
    AlternativesCompanion Function({
      Value<int> id,
      required int decisionId,
      required String name,
      Value<double?> score,
    });
typedef $$AlternativesTableUpdateCompanionBuilder =
    AlternativesCompanion Function({
      Value<int> id,
      Value<int> decisionId,
      Value<String> name,
      Value<double?> score,
    });

final class $$AlternativesTableReferences
    extends BaseReferences<_$AppDatabase, $AlternativesTable, Alternative> {
  $$AlternativesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DecisionsTable _decisionIdTable(_$AppDatabase db) =>
      db.decisions.createAlias(
        $_aliasNameGenerator(db.alternatives.decisionId, db.decisions.id),
      );

  $$DecisionsTableProcessedTableManager get decisionId {
    final $_column = $_itemColumn<int>('decision_id')!;

    final manager = $$DecisionsTableTableManager(
      $_db,
      $_db.decisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_decisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AlternativesTableFilterComposer
    extends Composer<_$AppDatabase, $AlternativesTable> {
  $$AlternativesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  $$DecisionsTableFilterComposer get decisionId {
    final $$DecisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableFilterComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlternativesTableOrderingComposer
    extends Composer<_$AppDatabase, $AlternativesTable> {
  $$AlternativesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  $$DecisionsTableOrderingComposer get decisionId {
    final $$DecisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableOrderingComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlternativesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlternativesTable> {
  $$AlternativesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  $$DecisionsTableAnnotationComposer get decisionId {
    final $$DecisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlternativesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlternativesTable,
          Alternative,
          $$AlternativesTableFilterComposer,
          $$AlternativesTableOrderingComposer,
          $$AlternativesTableAnnotationComposer,
          $$AlternativesTableCreateCompanionBuilder,
          $$AlternativesTableUpdateCompanionBuilder,
          (Alternative, $$AlternativesTableReferences),
          Alternative,
          PrefetchHooks Function({bool decisionId})
        > {
  $$AlternativesTableTableManager(_$AppDatabase db, $AlternativesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AlternativesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AlternativesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$AlternativesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> decisionId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double?> score = const Value.absent(),
              }) => AlternativesCompanion(
                id: id,
                decisionId: decisionId,
                name: name,
                score: score,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int decisionId,
                required String name,
                Value<double?> score = const Value.absent(),
              }) => AlternativesCompanion.insert(
                id: id,
                decisionId: decisionId,
                name: name,
                score: score,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AlternativesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({decisionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (decisionId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.decisionId,
                            referencedTable: $$AlternativesTableReferences
                                ._decisionIdTable(db),
                            referencedColumn:
                                $$AlternativesTableReferences
                                    ._decisionIdTable(db)
                                    .id,
                          )
                          as T;
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

typedef $$AlternativesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlternativesTable,
      Alternative,
      $$AlternativesTableFilterComposer,
      $$AlternativesTableOrderingComposer,
      $$AlternativesTableAnnotationComposer,
      $$AlternativesTableCreateCompanionBuilder,
      $$AlternativesTableUpdateCompanionBuilder,
      (Alternative, $$AlternativesTableReferences),
      Alternative,
      PrefetchHooks Function({bool decisionId})
    >;
typedef $$ComparisonsTableCreateCompanionBuilder =
    ComparisonsCompanion Function({
      Value<int> id,
      required int decisionId,
      required int critA,
      required int critB,
      required double value,
    });
typedef $$ComparisonsTableUpdateCompanionBuilder =
    ComparisonsCompanion Function({
      Value<int> id,
      Value<int> decisionId,
      Value<int> critA,
      Value<int> critB,
      Value<double> value,
    });

final class $$ComparisonsTableReferences
    extends BaseReferences<_$AppDatabase, $ComparisonsTable, Comparison> {
  $$ComparisonsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DecisionsTable _decisionIdTable(_$AppDatabase db) =>
      db.decisions.createAlias(
        $_aliasNameGenerator(db.comparisons.decisionId, db.decisions.id),
      );

  $$DecisionsTableProcessedTableManager get decisionId {
    final $_column = $_itemColumn<int>('decision_id')!;

    final manager = $$DecisionsTableTableManager(
      $_db,
      $_db.decisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_decisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CriteriaTable _critATable(_$AppDatabase db) => db.criteria
      .createAlias($_aliasNameGenerator(db.comparisons.critA, db.criteria.id));

  $$CriteriaTableProcessedTableManager get critA {
    final $_column = $_itemColumn<int>('crit_a')!;

    final manager = $$CriteriaTableTableManager(
      $_db,
      $_db.criteria,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_critATable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CriteriaTable _critBTable(_$AppDatabase db) => db.criteria
      .createAlias($_aliasNameGenerator(db.comparisons.critB, db.criteria.id));

  $$CriteriaTableProcessedTableManager get critB {
    final $_column = $_itemColumn<int>('crit_b')!;

    final manager = $$CriteriaTableTableManager(
      $_db,
      $_db.criteria,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_critBTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ComparisonsTableFilterComposer
    extends Composer<_$AppDatabase, $ComparisonsTable> {
  $$ComparisonsTableFilterComposer({
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

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$DecisionsTableFilterComposer get decisionId {
    final $$DecisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableFilterComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CriteriaTableFilterComposer get critA {
    final $$CriteriaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.critA,
      referencedTable: $db.criteria,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CriteriaTableFilterComposer(
            $db: $db,
            $table: $db.criteria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CriteriaTableFilterComposer get critB {
    final $$CriteriaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.critB,
      referencedTable: $db.criteria,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CriteriaTableFilterComposer(
            $db: $db,
            $table: $db.criteria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComparisonsTableOrderingComposer
    extends Composer<_$AppDatabase, $ComparisonsTable> {
  $$ComparisonsTableOrderingComposer({
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

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$DecisionsTableOrderingComposer get decisionId {
    final $$DecisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableOrderingComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CriteriaTableOrderingComposer get critA {
    final $$CriteriaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.critA,
      referencedTable: $db.criteria,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CriteriaTableOrderingComposer(
            $db: $db,
            $table: $db.criteria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CriteriaTableOrderingComposer get critB {
    final $$CriteriaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.critB,
      referencedTable: $db.criteria,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CriteriaTableOrderingComposer(
            $db: $db,
            $table: $db.criteria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComparisonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ComparisonsTable> {
  $$ComparisonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$DecisionsTableAnnotationComposer get decisionId {
    final $$DecisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CriteriaTableAnnotationComposer get critA {
    final $$CriteriaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.critA,
      referencedTable: $db.criteria,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CriteriaTableAnnotationComposer(
            $db: $db,
            $table: $db.criteria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CriteriaTableAnnotationComposer get critB {
    final $$CriteriaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.critB,
      referencedTable: $db.criteria,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CriteriaTableAnnotationComposer(
            $db: $db,
            $table: $db.criteria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComparisonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ComparisonsTable,
          Comparison,
          $$ComparisonsTableFilterComposer,
          $$ComparisonsTableOrderingComposer,
          $$ComparisonsTableAnnotationComposer,
          $$ComparisonsTableCreateCompanionBuilder,
          $$ComparisonsTableUpdateCompanionBuilder,
          (Comparison, $$ComparisonsTableReferences),
          Comparison,
          PrefetchHooks Function({bool decisionId, bool critA, bool critB})
        > {
  $$ComparisonsTableTableManager(_$AppDatabase db, $ComparisonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ComparisonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ComparisonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$ComparisonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> decisionId = const Value.absent(),
                Value<int> critA = const Value.absent(),
                Value<int> critB = const Value.absent(),
                Value<double> value = const Value.absent(),
              }) => ComparisonsCompanion(
                id: id,
                decisionId: decisionId,
                critA: critA,
                critB: critB,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int decisionId,
                required int critA,
                required int critB,
                required double value,
              }) => ComparisonsCompanion.insert(
                id: id,
                decisionId: decisionId,
                critA: critA,
                critB: critB,
                value: value,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ComparisonsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            decisionId = false,
            critA = false,
            critB = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (decisionId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.decisionId,
                            referencedTable: $$ComparisonsTableReferences
                                ._decisionIdTable(db),
                            referencedColumn:
                                $$ComparisonsTableReferences
                                    ._decisionIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (critA) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.critA,
                            referencedTable: $$ComparisonsTableReferences
                                ._critATable(db),
                            referencedColumn:
                                $$ComparisonsTableReferences._critATable(db).id,
                          )
                          as T;
                }
                if (critB) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.critB,
                            referencedTable: $$ComparisonsTableReferences
                                ._critBTable(db),
                            referencedColumn:
                                $$ComparisonsTableReferences._critBTable(db).id,
                          )
                          as T;
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

typedef $$ComparisonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ComparisonsTable,
      Comparison,
      $$ComparisonsTableFilterComposer,
      $$ComparisonsTableOrderingComposer,
      $$ComparisonsTableAnnotationComposer,
      $$ComparisonsTableCreateCompanionBuilder,
      $$ComparisonsTableUpdateCompanionBuilder,
      (Comparison, $$ComparisonsTableReferences),
      Comparison,
      PrefetchHooks Function({bool decisionId, bool critA, bool critB})
    >;
typedef $$AltComparisonsTableCreateCompanionBuilder =
    AltComparisonsCompanion Function({
      Value<int> id,
      required int decisionId,
      required int criterionId,
      required int altA,
      required int altB,
      required double value,
    });
typedef $$AltComparisonsTableUpdateCompanionBuilder =
    AltComparisonsCompanion Function({
      Value<int> id,
      Value<int> decisionId,
      Value<int> criterionId,
      Value<int> altA,
      Value<int> altB,
      Value<double> value,
    });

final class $$AltComparisonsTableReferences
    extends BaseReferences<_$AppDatabase, $AltComparisonsTable, AltComparison> {
  $$AltComparisonsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DecisionsTable _decisionIdTable(_$AppDatabase db) =>
      db.decisions.createAlias(
        $_aliasNameGenerator(db.altComparisons.decisionId, db.decisions.id),
      );

  $$DecisionsTableProcessedTableManager get decisionId {
    final $_column = $_itemColumn<int>('decision_id')!;

    final manager = $$DecisionsTableTableManager(
      $_db,
      $_db.decisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_decisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CriteriaTable _criterionIdTable(_$AppDatabase db) =>
      db.criteria.createAlias(
        $_aliasNameGenerator(db.altComparisons.criterionId, db.criteria.id),
      );

  $$CriteriaTableProcessedTableManager get criterionId {
    final $_column = $_itemColumn<int>('criterion_id')!;

    final manager = $$CriteriaTableTableManager(
      $_db,
      $_db.criteria,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_criterionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AltComparisonsTableFilterComposer
    extends Composer<_$AppDatabase, $AltComparisonsTable> {
  $$AltComparisonsTableFilterComposer({
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

  ColumnFilters<int> get altA => $composableBuilder(
    column: $table.altA,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get altB => $composableBuilder(
    column: $table.altB,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$DecisionsTableFilterComposer get decisionId {
    final $$DecisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableFilterComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CriteriaTableFilterComposer get criterionId {
    final $$CriteriaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.criterionId,
      referencedTable: $db.criteria,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CriteriaTableFilterComposer(
            $db: $db,
            $table: $db.criteria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AltComparisonsTableOrderingComposer
    extends Composer<_$AppDatabase, $AltComparisonsTable> {
  $$AltComparisonsTableOrderingComposer({
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

  ColumnOrderings<int> get altA => $composableBuilder(
    column: $table.altA,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get altB => $composableBuilder(
    column: $table.altB,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$DecisionsTableOrderingComposer get decisionId {
    final $$DecisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableOrderingComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CriteriaTableOrderingComposer get criterionId {
    final $$CriteriaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.criterionId,
      referencedTable: $db.criteria,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CriteriaTableOrderingComposer(
            $db: $db,
            $table: $db.criteria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AltComparisonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AltComparisonsTable> {
  $$AltComparisonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get altA =>
      $composableBuilder(column: $table.altA, builder: (column) => column);

  GeneratedColumn<int> get altB =>
      $composableBuilder(column: $table.altB, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$DecisionsTableAnnotationComposer get decisionId {
    final $$DecisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CriteriaTableAnnotationComposer get criterionId {
    final $$CriteriaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.criterionId,
      referencedTable: $db.criteria,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CriteriaTableAnnotationComposer(
            $db: $db,
            $table: $db.criteria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AltComparisonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AltComparisonsTable,
          AltComparison,
          $$AltComparisonsTableFilterComposer,
          $$AltComparisonsTableOrderingComposer,
          $$AltComparisonsTableAnnotationComposer,
          $$AltComparisonsTableCreateCompanionBuilder,
          $$AltComparisonsTableUpdateCompanionBuilder,
          (AltComparison, $$AltComparisonsTableReferences),
          AltComparison,
          PrefetchHooks Function({bool decisionId, bool criterionId})
        > {
  $$AltComparisonsTableTableManager(
    _$AppDatabase db,
    $AltComparisonsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AltComparisonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$AltComparisonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$AltComparisonsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> decisionId = const Value.absent(),
                Value<int> criterionId = const Value.absent(),
                Value<int> altA = const Value.absent(),
                Value<int> altB = const Value.absent(),
                Value<double> value = const Value.absent(),
              }) => AltComparisonsCompanion(
                id: id,
                decisionId: decisionId,
                criterionId: criterionId,
                altA: altA,
                altB: altB,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int decisionId,
                required int criterionId,
                required int altA,
                required int altB,
                required double value,
              }) => AltComparisonsCompanion.insert(
                id: id,
                decisionId: decisionId,
                criterionId: criterionId,
                altA: altA,
                altB: altB,
                value: value,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AltComparisonsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({decisionId = false, criterionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (decisionId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.decisionId,
                            referencedTable: $$AltComparisonsTableReferences
                                ._decisionIdTable(db),
                            referencedColumn:
                                $$AltComparisonsTableReferences
                                    ._decisionIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (criterionId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.criterionId,
                            referencedTable: $$AltComparisonsTableReferences
                                ._criterionIdTable(db),
                            referencedColumn:
                                $$AltComparisonsTableReferences
                                    ._criterionIdTable(db)
                                    .id,
                          )
                          as T;
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

typedef $$AltComparisonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AltComparisonsTable,
      AltComparison,
      $$AltComparisonsTableFilterComposer,
      $$AltComparisonsTableOrderingComposer,
      $$AltComparisonsTableAnnotationComposer,
      $$AltComparisonsTableCreateCompanionBuilder,
      $$AltComparisonsTableUpdateCompanionBuilder,
      (AltComparison, $$AltComparisonsTableReferences),
      AltComparison,
      PrefetchHooks Function({bool decisionId, bool criterionId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DecisionsTableTableManager get decisions =>
      $$DecisionsTableTableManager(_db, _db.decisions);
  $$CriteriaTableTableManager get criteria =>
      $$CriteriaTableTableManager(_db, _db.criteria);
  $$AlternativesTableTableManager get alternatives =>
      $$AlternativesTableTableManager(_db, _db.alternatives);
  $$ComparisonsTableTableManager get comparisons =>
      $$ComparisonsTableTableManager(_db, _db.comparisons);
  $$AltComparisonsTableTableManager get altComparisons =>
      $$AltComparisonsTableTableManager(_db, _db.altComparisons);
}
