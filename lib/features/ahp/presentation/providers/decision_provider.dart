import 'package:flutter/material.dart';
import '../../domain/usecases/create_decision.dart';

class DecisionProvider extends ChangeNotifier {
  final CreateDecisionUseCase _create;
  DecisionProvider(this._create);
  Future<int> newDecision(
          String title, List<String> alts, List<String> crits) =>
      _create.call(title, alts, crits);
}
