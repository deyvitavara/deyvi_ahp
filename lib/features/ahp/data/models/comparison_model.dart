import 'package:drift/drift.dart';

import '../../domain/entities/pair_entity.dart';
import '../datasources/app_database.dart';

extension ComparisonModelX on Comparison {
  PairEntity toEntity() => PairEntity(
        decisionId: decisionId,
        critA: critA,
        critB: critB,
        value: value,
      );
}

extension PairEntityX on PairEntity {
  ComparisonsCompanion toCompanion() => ComparisonsCompanion(
        decisionId: Value(decisionId),
        critA: Value(critA),
        critB: Value(critB),
        value: Value(value),
      );
}
