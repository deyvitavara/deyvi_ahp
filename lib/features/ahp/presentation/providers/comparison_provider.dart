import 'package:flutter/material.dart';
import '../../domain/usecases/fetch_comparisons.dart';
import '../../domain/usecases/fetch_critical_pairs.dart';
import '../../domain/usecases/compute_consistency.dart';

class ComparisonProvider extends ChangeNotifier {
  final FetchComparisonsUseCase _fetchAll;
  final FetchCriticalPairsUseCase _fetchPairs;
  final ComputeConsistencyUseCase _consistency;
  ComparisonProvider(this._fetchAll, this._fetchPairs, this._consistency);

  Future<List<List<int>>> getPairs(int id, double t) =>
      _fetchPairs.call(id, t);

  Future<double> check(int id) => _consistency.call(id);
}
