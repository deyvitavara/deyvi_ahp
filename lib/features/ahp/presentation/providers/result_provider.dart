import 'package:flutter/material.dart';
import '../../domain/usecases/compute_weights.dart';

class ResultProvider extends ChangeNotifier {
  final ComputeWeightsUseCase _compute;
  ResultProvider(this._compute);

  Future<List<double>> getFinal(int id) => _compute.call(id);
}
