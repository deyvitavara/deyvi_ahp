// lib/features/ahp/domain/usecases/compute_seed_weights.dart

import '../repositories/ahp_repository.dart';

class ComputeSeedWeights {
  final IAhpRepository repo;
  ComputeSeedWeights(this.repo);

  /// Ahora llama a computeWeights, que es el método definido en IAhpRepository
  Future<List<double>> call(int decisionId) =>
      repo.computeWeights(decisionId);
}
