import '../entities/pair_entity.dart';
import '../repositories/ahp_repository.dart';

class FetchComparisonsUseCase {
  final IAhpRepository repo;
  FetchComparisonsUseCase(this.repo);
  Future<List<PairEntity>> call(int id) => repo.fetchComparisons(id);
}
