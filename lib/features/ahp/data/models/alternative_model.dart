import '../../domain/entities/alternative_entity.dart';
import '../datasources/app_database.dart';

extension AlternativeModelX on Alternative {
  AlternativeEntity toEntity() => AlternativeEntity(
        id: id,
        decisionId: decisionId,
        name: name,
        score: score,
      );
}
