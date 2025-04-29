import '../repositories/ahp_repository.dart';

class ComputeWeightsUseCase {
  final IAhpRepository repo;
  ComputeWeightsUseCase(this.repo);
  Future<List<double>> call(int id) => repo.computeWeights(id);
}
