import '../entities/pair_entity.dart';
import '../repositories/ahp_repository.dart';

class AddDefaultComparisonsUseCase {
  final IAhpRepository _repo;
  AddDefaultComparisonsUseCase(this._repo);

  /// Ahora sí recibe both: el id de la decisión y la lista de pares
  Future<void> call(int decisionId, List<PairEntity> pairs) {
    return _repo.addDefaultComparisons(decisionId, pairs);
  }
}
