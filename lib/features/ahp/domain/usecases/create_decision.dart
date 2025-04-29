import '../repositories/ahp_repository.dart';

class CreateDecisionUseCase {
  final IAhpRepository repo;
  CreateDecisionUseCase(this.repo);
  Future<int> call(
    String title,
    List<String> alts,
    List<String> crits,
  ) =>
      repo.createDecision(title, alts, crits);
}
