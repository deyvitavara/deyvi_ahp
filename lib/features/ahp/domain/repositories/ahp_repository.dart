import '../entities/pair_entity.dart';

abstract class IAhpRepository {
  Future<int> createDecision(
    String title,
    List<String> alternatives,
    List<String> criteria,
  );
  Future<void> addDefaultComparisons(int decisionId, List<PairEntity> pairs);
  Future<void> addAltComparison(int decisionId, int critId, int a, int b, double v);
  Future<List<PairEntity>> fetchComparisons(int decisionId);
  Future<List<PairEntity>> fetchAltComparisons(int decisionId , int critId);
  Future<List<List<int>>> fetchCriticalPairs(
      int decisionId, double threshold);
  Future<List<double>> computeWeights(int decisionId);
  Future<double> computeConsistency(int decisionId);
}
