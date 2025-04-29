import '../repositories/ahp_repository.dart';

/// Use‐case que devuelve el vector propio completo de pesos finales
class ComputeFinalWeightsUseCase {
  final IAhpRepository _repo;
  ComputeFinalWeightsUseCase(this._repo);

  Future<List<double>> call(int decisionId) {
    return _repo.computeWeights(decisionId);
  }
}
