import '../../domain/entities/criterion_entity.dart';
import '../datasources/app_database.dart';

extension CriterionModelX on CriteriaData {
  CriterionEntity toEntity() => CriterionEntity(
        id: id,
        decisionId: decisionId,
        name: name,
        seedOrder: seedOrder,
        value: value,
      );
}
