import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'app_database.g.dart';

class Decisions extends Table {
  IntColumn get id        => integer().autoIncrement()();
  TextColumn get title    => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Criteria extends Table {
  IntColumn    get id         => integer().autoIncrement()();
  IntColumn    get decisionId => integer().references(Decisions, #id)();
  TextColumn   get name       => text()();
  IntColumn    get seedOrder  => integer().withDefault(Constant(0))();
  RealColumn   get value      => real().nullable()();
}

class AltComparisons extends Table {
  IntColumn    get id          => integer().autoIncrement()();
  IntColumn    get decisionId  => integer().references(Decisions, #id)();
  IntColumn    get criterionId => integer().references(Criteria, #id)();
  IntColumn    get altA        => integer()();
  IntColumn    get altB        => integer()();
  RealColumn   get value       => real()();
}

class Alternatives extends Table {
  IntColumn    get id         => integer().autoIncrement()();
  IntColumn    get decisionId => integer().references(Decisions, #id)();
  TextColumn   get name       => text()();
  RealColumn   get score      => real().nullable()();
}

class Comparisons extends Table {
  IntColumn get id         => integer().autoIncrement()();
  IntColumn get decisionId => integer().references(Decisions, #id)();
  IntColumn get critA      => integer().references(Criteria, #id)();
  IntColumn get critB      => integer().references(Criteria, #id)();
  RealColumn get value     => real()();
}

@DriftDatabase(tables: [Decisions, Criteria, Alternatives, Comparisons, AltComparisons])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir  = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'ahp.sqlite'));
    return NativeDatabase(file);
  });
}
