import 'package:flutter/material.dart';
import '../../domain/entities/pair_entity.dart';
import '../../domain/usecases/add_default_comparisons.dart';
import '../../domain/usecases/compute_consistency.dart';
import '../screens/seed_ranking_screen.dart'; // para PairEntity

class SeedProvider extends ChangeNotifier {
  final AddDefaultComparisonsUseCase _addDefaults;
  final ComputeConsistencyUseCase _consistency;
  SeedProvider(this._addDefaults, this._consistency);

  Future<double> saveSeed(int decisionId, List<int> seedOrder) async {
    final pairs = <PairEntity>[];
    for (var i = 0; i < seedOrder.length - 1; i++) {
      pairs.add(PairEntity(
        decisionId: decisionId,
        critA: seedOrder[i],
        critB: seedOrder[i + 1],
        value: 3.0,
      ));
    }
    await _addDefaults.call(decisionId, pairs);
    return _consistency.call(decisionId);
  }
}
