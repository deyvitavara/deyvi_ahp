// lib/features/ahp/domain/usecases/compute_alt_weights.dart
import '../repositories/ahp_repository.dart';
import '../../../../core/ahp_solver.dart';

class ComputeAltWeightsUseCase {
  final IAhpRepository repo;
  final AhpSolver solver;
  ComputeAltWeightsUseCase(this.repo, this.solver);

  /// decisionId, criterio k (ordinal), y número total de alternativas
  Future<List<double>> call(int decisionId, int critIndex, int nAlt) async {
    final judgments = await repo.fetchAltComparisons(decisionId, critIndex);
    final A = solver.buildMatrixWithJudgments(judgments, nAlt);
    return solver.powerMethod(A);
  }
}
