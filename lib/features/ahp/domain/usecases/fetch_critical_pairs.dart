import '../repositories/ahp_repository.dart';

class FetchCriticalPairsUseCase {
  final IAhpRepository repo;
  FetchCriticalPairsUseCase(this.repo);
  Future<List<List<int>>> call(int id, double t) =>
      repo.fetchCriticalPairs(id, t);
}
