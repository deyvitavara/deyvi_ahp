import '../../domain/entities/decision_entity.dart';
import '../datasources/app_database.dart';

extension DecisionModelX on Decision {
  DecisionEntity toEntity() => DecisionEntity(
        id: id,
        title: title,
        createdAt: createdAt,
      );
}
