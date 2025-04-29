/*import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:drift/drift.dart' as show ;
import '../../data/datasources/app_database.dart';
import '../../domain/usecases/compute_final_weights.dart';
import '../../domain/usecases/fetch_critical_pairs.dart';
import '../../domain/usecases/compute_alt_weights.dart';
import '../../domain/usecases/compute_consistency.dart';

class AlternativeComparisonScreen extends StatefulWidget {
  final int decisionId;
  const AlternativeComparisonScreen(this.decisionId, {super.key});

  @override
  State<AlternativeComparisonScreen> createState() =>
      _AlternativeComparisonScreenState();
}

class _AlternativeComparisonScreenState
    extends State<AlternativeComparisonScreen> {
  List<String> _altNames = [];
  List<List<int>> _pairs = [];
  int _idx = 0;
  int _critIndex = 0;
  List<double> _critWeights = [];

  @override
  void initState() {
    super.initState();
    _loadAlts();
  }

  Future<void> _loadAlts() async {
    final db = GetIt.I<AppDatabase>();
    // 1) Cargo nombres de alternativas
    final alts = await (db.select(db.alternatives)
          ..where((t) => t.decisionId.equals(widget.decisionId)))
        .get();
    _altNames = alts.map((a) => a.name).toList();

    // 2) Cargo pesos de criterios (para iterar)
    _critWeights = await GetIt.I<ComputeFinalWeightsUseCase>().call(widget.decisionId);

    // 3) Cargo primeros pares de alternativas para criterio 0
    _loadPairsForCriterion();
  }

  Future<void> _loadPairsForCriterion() async {
    final nAlt = _altNames.length;
    // Genera lista de todos los pares (i<j)
    _pairs = [];
    for (var i = 0; i < nAlt; i++)
      for (var j = i + 1; j < nAlt; j++) _pairs.add([i, j]);
    setState(() { _idx = 0; });
  }

  Future<void> _answer(bool right) async {
    final a = _pairs[_idx][0], b = _pairs[_idx][1];
    final v = right ? 5.0 : 1/5.0;

    // Guardo el juicio en la nueva tabla
    await GetIt.I<AppDatabase>().into(
      GetIt.I<AppDatabase>().altComparisons)
      .insert(AltComparisonsCompanion(
        decisionId: Value(widget.decisionId),
        criterionId: Value(_critIndex),
        altA: Value(a),
        altB: Value(b),
        value: Value(v),
      ));

    if (_idx == _pairs.length - 1) {
      // si ya pasé todos los pares, paso al siguiente criterio o a ResultScreen
      if (_critIndex + 1 < _critWeights.length) {
        _critIndex++;
        await _loadPairsForCriterion();
      } else {
        Navigator.of(context).pushReplacementNamed(
          '/result?decisionId=${widget.decisionId}');
      }
    } else {
      setState(() => _idx++);
    }
  }

  @override
  Widget build(BuildContext c) {
    if (_altNames.isEmpty || _pairs.isEmpty) {
      return const Scaffold(body:Center(child:CircularProgressIndicator()));
    }
    final a = _pairs[_idx][0], b = _pairs[_idx][1];
    return Scaffold(
      appBar: AppBar(
        title: Text('Alt Compar ${_critIndex+1}/${_critWeights.length}'),
      ),
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Criterio ${_critIndex+1}: vota alternativa',
            style: const TextStyle(fontSize:18)),
          const SizedBox(height:12),
          Text('¿${_altNames[a]} vs ${_altNames[b]}?',
              style: const TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
          const SizedBox(height:24),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:[
            ElevatedButton(
              onPressed: () => _answer(false),
              child: const Text('Izquierda'),
            ),
            ElevatedButton(
              onPressed: () => _answer(true),
              child: const Text('Derecha'),
            ),
          ]),
        ],
      )),
    );
  }
}
*/

// lib/features/ahp/presentation/screens/alternative_comparison_screen.dart
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:drift/drift.dart' as drift;
import '../../data/datasources/app_database.dart';
import '../../domain/usecases/compute_alt_weights.dart';
import '../../domain/usecases/add_default_comparisons.dart';

class AlternativeComparisonScreen extends StatefulWidget {
  final int decisionId;
  const AlternativeComparisonScreen(this.decisionId, {super.key});
  @override
  _AlternativeComparisonScreenState createState() => _AlternativeComparisonScreenState();
}

class _AlternativeComparisonScreenState extends State<AlternativeComparisonScreen> {
  late List<String> _altNames;
  late List<List<int>> _pairs;
  int _idx = 0, _critIndex = 0;
  late final List<double> _critWeights;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final db = GetIt.I<AppDatabase>();
    final alts = await (db.select(db.alternatives)
          ..where((t) => t.decisionId.equals(widget.decisionId)))
        .get();
    _altNames = alts.map((a) => a.name).toList();

    // tras AHP de criterios, ya tenemos el vector propio wCrit
    _critWeights = await GetIt.I<ComputeAltWeightsUseCase>() // en realidad ComputeFinalWeightsUseCase
        .call(widget.decisionId, 0, _altNames.length); // no importa k=0, sólo queremos wCrit
    _makePairs();
    setState(() {});
  }

  void _makePairs() {
    _pairs = [];
    for (var i = 0; i < _altNames.length; i++) {
      for (var j = i + 1; j < _altNames.length; j++) {
        _pairs.add([i, j]);
      }
    }
    _idx = 0;
  }

  Future<void> _answer(bool right) async {
      final db = GetIt.I<AppDatabase>();                // <-- aquí defines 'db'

    final a = _pairs[_idx][0], b = _pairs[_idx][1];
    final v = right ? 5.0 : 1/5.0;
    await GetIt.I<AppDatabase>().into(db.altComparisons).insert(AltComparisonsCompanion(
      decisionId: Value(widget.decisionId),
      criterionId: Value(_critIndex),
      altA: Value(a),
      altB: Value(b),
      value: Value(v),
    ));
    if (_idx < _pairs.length - 1) {
      setState(() => _idx++);
    } else if (_critIndex < _critWeights.length - 1) {
      _critIndex++;
      _makePairs();
      setState(() {});
    } else {
      Navigator.of(context).pushReplacementNamed(
        '/result/${widget.decisionId}');
    }
  }

  @override
  Widget build(BuildContext c) {
    if (_altNames.isEmpty) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final a = _pairs[_idx][0], b = _pairs[_idx][1];
    return Scaffold(
      appBar: AppBar(title: Text('Criterio ${_critIndex+1}/${_critWeights.length}')),
      body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('¿ ${_altNames[a]}  vs.  ${_altNames[b]} ?', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height:24),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:[
          ElevatedButton(onPressed: ()=>_answer(false), child: const Text('Izquierda')),
          ElevatedButton(onPressed: ()=>_answer(true),  child: const Text('Derecha')),
        ]),
      ])),
    );
  }
}
