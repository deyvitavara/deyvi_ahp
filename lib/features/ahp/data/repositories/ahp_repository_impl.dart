/*import 'package:deyvi_ahp/features/ahp/data/models/comparison_model.dart';
import 'package:drift/drift.dart';
import '../../../../core/ahp_solver.dart';
import '../../domain/entities/pair_entity.dart';
import '../../domain/repositories/ahp_repository.dart';
import '../datasources/app_database.dart';

class AhpRepositoryImpl implements IAhpRepository {
  final AppDatabase db;
  final AhpSolver solver;
  AhpRepositoryImpl({required this.db, required this.solver});

  @override
  Future<int> createDecision(
      String title, List<String> alts, List<String> crits) async {
    final id = await db.into(db.decisions).insert(  
      DecisionsCompanion(title: Value(title)),
    );

    for (var i = 0; i < crits.length; i++) {
      await db.into(db.criteria).insert(
        CriteriaCompanion(
          decisionId: Value(id),
          name: Value(crits[i]),
          seedOrder: Value(i),
          value: const Value.absent(),
        ),
      );
    }

    for (var name in alts) {
      await db.into(db.alternatives).insert(
        AlternativesCompanion(
          decisionId: Value(id),
          name: Value(name),
          score: const Value.absent(),
        ),
      );
    }

    return id;
  }

  /// Inserta un juicio de alternativa A vs B para un criterio dado
@override
Future<void> addAltComparison(int decisionId, int critId, int a, int b, double v) {
  return db.into(db.altComparisons).insert(
    AltComparisonsCompanion(
      decisionId: Value(decisionId),
      criterionId: Value(critId),
      altA: Value(a),
      altB: Value(b),
      value: Value(v),
    ),
  );
}

/// Lee todos los juicios de alternativas para un criterio y los devuelve en índices ordinales
@override
Future<List<PairEntity>> fetchAltComparisons(int decisionId, int critId) async {
  final raws = await (db.select(db.altComparisons)
        ..where((t) => t.decisionId.equals(decisionId) & t.criterionId.equals(critId)))
      .get();
  return raws.map((r) => PairEntity(
    critA: r.altA,
    critB: r.altB,
    value: r.value,
    decisionId: r.decisionId,
  )).toList();
}

  @override
  Future<List<double>> computeWeights(int decisionId) async {
    // 1) Traer y ordenar criterios por seedOrder
    final crits = await (db.select(db.criteria)
          ..where((c) => c.decisionId.equals(decisionId))
          ..orderBy([(t) => OrderingTerm(
                expression: t.seedOrder,
                mode: OrderingMode.asc,
              )]))
        .get();

    final n = crits.length;
    // 2) Mapear cada id de criterio a su posición ordinal 0..n-1
    final idToIndex = {for (var i = 0; i < n; i++) crits[i].id: i};

    // 3) Cargar juicios crudos y traducir a índices
    final raw = await (db.select(db.comparisons)
          ..where((c) => c.decisionId.equals(decisionId)))
        .get();

    final judgments = <PairEntity>[];
    for (final r in raw) {
      final a = idToIndex[r.critA];
      final b = idToIndex[r.critB];
      if (a == null || b == null) continue; // ignora pares inválidos
      judgments.add(PairEntity(
        decisionId: r.decisionId,
        critA: a,
        critB: b,
        value: r.value,
      ));
    }

    // 4) Construir matriz y calcular vector propio
    final A = solver.buildMatrixWithJudgments(judgments, n);
    return solver.powerMethod(A);
  }

  @override
  Future<List<List<int>>> fetchCriticalPairs(
      int decisionId, double threshold) async {
    // Pasos idénticos al cálculo de pesos para idToIndex
    final crits = await (db.select(db.criteria)
          ..where((c) => c.decisionId.equals(decisionId))
          ..orderBy([(t) => OrderingTerm(
                expression: t.seedOrder,
                mode: OrderingMode.asc,
              )]))
        .get();

    final n = crits.length;
    final idToIndex = {for (var i = 0; i < n; i++) crits[i].id: i};

    final raw = await (db.select(db.comparisons)
          ..where((c) => c.decisionId.equals(decisionId)))
        .get();

    final judgments = <PairEntity>[];
    for (final r in raw) {
      final a = idToIndex[r.critA];
      final b = idToIndex[r.critB];
      if (a == null || b == null) continue;
      judgments.add(PairEntity(
        decisionId: r.decisionId,
        critA: a,
        critB: b,
        value: r.value,
      ));
    }

    final w = await computeWeights(decisionId);
    final A = solver.buildMatrixWithJudgments(judgments, n);

    final pairs = <List<int>>[];
    for (var i = 0; i < n; i++) {
      for (var j = i + 1; j < n; j++) {
        if ((A[i][j] - (w[i] / w[j])).abs() > threshold) {
          pairs.add([i, j]);
        }
      }
    }
    return pairs;
  }

  @override
  Future<void> addDefaultComparisons(
      int decisionId, List<PairEntity> pairs) async {
    await db.transaction(() async {
      for (var p in pairs) {
        await db.into(db.comparisons).insert(p.toCompanion());
      }
    });
  }

  @override
  Future<double> computeConsistency(int decisionId) async {
    final w = await computeWeights(decisionId);

    final judgments = await fetchComparisons(decisionId);
    // reconstruyo A con índices ordinales
    final crits = await (db.select(db.criteria)
          ..where((c) => c.decisionId.equals(decisionId)))
        .get();
    final raw = await (db.select(db.comparisons)
          ..where((c) => c.decisionId.equals(decisionId)))
        .get();

    // traduzco raw → ordinales como en computeWeights...
    final idToIndex = {for (var i = 0; i < crits.length; i++) crits[i].id: i};
    final jud = <PairEntity>[];
    for (final r in raw) {
      final a = idToIndex[r.critA], b = idToIndex[r.critB];
      if (a == null || b == null) continue;
      jud.add(PairEntity(
        decisionId: r.decisionId,
        critA: a,
        critB: b,
        value: r.value,
      ));
    }

    final A = solver.buildMatrixWithJudgments(jud, crits.length);
    return solver.consistencyRatio(A, w);
  }

  @override
  Future<List<PairEntity>> fetchComparisons(int decisionId) async {
    final rows = await (db.select(db.comparisons)
          ..where((c) => c.decisionId.equals(decisionId)))
        .get();
    return rows.map((r) => r.toEntity()).toList();
  }
}
*/


// lib/features/ahp/data/repositories/ahp_repository_impl.dart
import 'package:drift/drift.dart';
import '../../../../core/ahp_solver.dart';
import '../../domain/entities/pair_entity.dart';
import '../../domain/repositories/ahp_repository.dart';
import '../datasources/app_database.dart';

class AhpRepositoryImpl implements IAhpRepository {
  final AppDatabase db;
  final AhpSolver solver;
  AhpRepositoryImpl({required this.db, required this.solver});

  @override
  Future<int> createDecision(String title, List<String> alts, List<String> crits) async {
    final id = await db.into(db.decisions).insert(DecisionsCompanion(title: Value(title)));
    for (var i = 0; i < crits.length; i++) {
      await db.into(db.criteria).insert(CriteriaCompanion(
        decisionId: Value(id),
        name: Value(crits[i]),
        seedOrder: Value(i),
      ));
    }
    for (var name in alts) {
      await db.into(db.alternatives).insert(AlternativesCompanion(
        decisionId: Value(id),
        name: Value(name),
      ));
    }
    return id;
  }

  /// 1) Inserta C(n,2) pares con valor 1.0
  @override
  Future<void> addDefaultComparisons(int decisionId, List<PairEntity> _) async {
    final crits = await (db.select(db.criteria)
          ..where((c) => c.decisionId.equals(decisionId))
          ..orderBy([(c) => OrderingTerm(expression: c.seedOrder)]))
        .get();
    final n = crits.length;
    await db.transaction(() async {
      for (var i = 0; i < n; i++) {
        for (var j = i + 1; j < n; j++) {
          await db.into(db.comparisons).insert(ComparisonsCompanion(
            decisionId: Value(decisionId),
            critA: Value(i),
            critB: Value(j),
            value: Value(1.0),
          ));
        }
      }
    });
  }

  Future<List<PairEntity>> fetchComparisons(int decisionId) async {
    // mapeo IDs reales → índices ordinales 0..n-1
    final crits = await (db.select(db.criteria)
          ..where((c) => c.decisionId.equals(decisionId))
          ..orderBy([(c) => OrderingTerm(expression: c.seedOrder)]))
        .get();
    final idToIndex = {for (var i = 0; i < crits.length; i++) crits[i].id: i};

    final raw = await (db.select(db.comparisons)
          ..where((c) => c.decisionId.equals(decisionId)))
        .get();
    return raw.map((r) {
      final a = idToIndex[r.critA]!;
      final b = idToIndex[r.critB]!;
      return PairEntity(decisionId: r.decisionId,critA: a, critB: b, value: r.value);
    }).toList();
  }

  @override
  Future<List<List<int>>> fetchCriticalPairs(int decisionId, double threshold) async {
    final w = await computeWeights(decisionId);
    final A = solver.buildMatrixWithJudgments(await fetchComparisons(decisionId), w.length);
    final pairs = <List<int>>[];
    for (var i = 0; i < A.length; i++) {
      for (var j = i + 1; j < A.length; j++) {
        if ((A[i][j] - w[i] / w[j]).abs() > threshold) {
          pairs.add([i, j]);
        }
      }
    }
    return pairs;
  }

  @override
  Future<List<double>> computeWeights(int decisionId) async {
    // mapeo igual que fetchComparisons
    final crits = await (db.select(db.criteria)
          ..where((c) => c.decisionId.equals(decisionId))
          ..orderBy([(c) => OrderingTerm(expression: c.seedOrder)]))
        .get();
    final idToIndex = {for (var i = 0; i < crits.length; i++) crits[i].id: i};

    final raw = await (db.select(db.comparisons)
          ..where((c) => c.decisionId.equals(decisionId)))
        .get();
    final judgments = raw.map((r) {
      final a = idToIndex[r.critA]!;
      final b = idToIndex[r.critB]!;
      return PairEntity(decisionId: r.decisionId,critA: a, critB: b, value: r.value);
    }).toList();

    final A = solver.buildMatrixWithJudgments(judgments, crits.length);
    return solver.powerMethod(A);
  }

  @override
  Future<double> computeConsistency(int decisionId) async {
    final w = await computeWeights(decisionId);
    final A = solver.buildMatrixWithJudgments(await fetchComparisons(decisionId), w.length);
    return solver.consistencyRatio(A, w);
  }

  // alt‐comparisons idéntico a fetchComparisons pero con altComparisons table...
  @override
  Future<void> addAltComparison(int decisionId, int critId, int a, int b, double v) {
    return db.into(db.altComparisons).insert(AltComparisonsCompanion(
      decisionId: Value(decisionId),
      criterionId: Value(critId),
      altA: Value(a),
      altB: Value(b),
      value: Value(v),
    ));
  }

  @override
  Future<List<PairEntity>> fetchAltComparisons(int decisionId, int critId) async {
    final raw = await (db.select(db.altComparisons)
          ..where((t) =>
            t.decisionId.equals(decisionId) &
            t.criterionId.equals(critId)))
        .get();
    return raw.map((r) => PairEntity(decisionId: r.decisionId,critA: r.altA, critB: r.altB, value: r.value)).toList();
  }
}
