import '../repositories/ahp_repository.dart';

/// Use-case para calcular el Consistency Ratio (CR)
class ComputeConsistencyUseCase {
  final IAhpRepository _repo;
  ComputeConsistencyUseCase(this._repo);

  /// Llama a IAhpRepository.computeConsistency(decisionId)
  Future<double> call(int decisionId) {
    return _repo.computeConsistency(decisionId);
  }
}
