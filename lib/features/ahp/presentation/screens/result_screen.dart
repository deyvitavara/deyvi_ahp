// lib/features/ahp/presentation/screens/result_screen.dart
/*
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get_it/get_it.dart';
import 'package:drift/drift.dart' hide Column;

import '../../domain/usecases/compute_final_weights.dart';
import '../../domain/usecases/compute_alt_weights.dart';
import '../../data/datasources/app_database.dart';

class ResultScreen extends StatefulWidget {
  final int decisionId;
  const ResultScreen({ required this.decisionId, super.key });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _loading = true;

  // nombres y pesos de criterios
  late List<String>  _critNames;
  late List<double>  _critWeights;

  // nombres de alternativas
  late List<String>  _altNames;
  // puntajes globales de alternativas
  late List<double>  _globalScores;

  @override
  void initState() {
    super.initState();
    _loadAndCompute();
  }

  Future<void> _loadAndCompute() async {
    final db = GetIt.I<AppDatabase>();

    // 1) Cargo criterios ORDENA­DOS por seedOrder
    final crits = await (db.select(db.criteria)
          ..where((c) => c.decisionId.equals(widget.decisionId))
          ..orderBy([
            (t) => OrderingTerm(
              expression: t.seedOrder,
              mode: OrderingMode.asc,
            )
          ]))
        .get();
    _critNames   = crits.map((c) => c.name).toList();

    // 2) Cargo alternativas (sin orden particular)
    final alts = await (db.select(db.alternatives)
          ..where((a) => a.decisionId.equals(widget.decisionId)))
        .get();
    _altNames    = alts.map((a) => a.name).toList();

    // 3) Pesos de criterios (vector propio de criterios)
    _critWeights = await GetIt.I<ComputeFinalWeightsUseCase>()
        .call(widget.decisionId);

    // 4) Inicializo vector global de alternativas
    final nAlt = _altNames.length;
    _globalScores = List.filled(nAlt, 0.0);

    // 5) Para cada criterio k:
    //    - obtengo pesos LOCALES de alternativas
    //    - sumo local[i] * critWeight[k] en globalScores[i]
    final altWCase = GetIt.I<ComputeAltWeightsIUseCase>();
    for (var k = 0; k < _critWeights.length; k++) {
      final local = await altWCase.call(
        widget.decisionId,
        k,
        nAlt,
      );
      for (var i = 0; i < nAlt; i++) {
        _globalScores[i] += local[i] * _critWeights[k];
      }
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // normalizar (por si acaso no suma exactamente 1.0)
    final sum = _globalScores.reduce((a, b) => a + b);
    final normalized = _globalScores.map((s) => s / sum).toList();

    // índice de la mejor alternativa
    final bestIdx = normalized.indexOf(normalized.reduce(max));
    final bestName = _altNames[bestIdx];
    final bestPct  = (normalized[bestIdx] * 100).toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados AHP')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 6) Gráfica: alternativas en %
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceEvenly,
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(normalized.length, (i) {
                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(toY: normalized[i] * 100),
                      ],
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 7) Texto: cada alternativa con %
            Text(
              List.generate(normalized.length, (i) {
                final pct = (normalized[i] * 100).toStringAsFixed(1);
                return '${_altNames[i]}: $pct%';
              }).join('\n'),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),

            const Divider(height: 32),

            // 8) Recomendación final
            Text(
              'La mejor alternativa es\n'
              '$bestName  ($bestPct %)',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

// lib/features/ahp/presentation/screens/result_screen.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get_it/get_it.dart';
import 'package:drift/drift.dart' hide Column;
import '../../domain/usecases/compute_alt_weights.dart';
import '../../domain/usecases/compute_final_weights.dart';
import '../../data/datasources/app_database.dart';

class ResultScreen extends StatefulWidget {
  final int decisionId;
  const ResultScreen({required this.decisionId, super.key});
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _loading = true;
  late List<String> _critNames, _altNames;
  late List<double> _critW, _global;

  @override
  void initState() {
    super.initState();
    _compute();
  }

  Future<void> _compute() async {
    final db = GetIt.I<AppDatabase>();

    // nombres de criterios
    final crits = await (db.select(db.criteria)
          ..where((c) => c.decisionId.equals(widget.decisionId))
          ..orderBy([(c) => OrderingTerm(expression: c.seedOrder)]))
        .get();
    _critNames = crits.map((c) => c.name).toList();
    _critW = await GetIt.I<ComputeFinalWeightsUseCase>()
        .call(widget.decisionId);

    // nombres de alternativas
    final alts = await (db.select(db.alternatives)
          ..where((a) => a.decisionId.equals(widget.decisionId)))
        .get();
    _altNames = alts.map((a) => a.name).toList();

    // inicializa
    final nAlt = _altNames.length;
    _global = List.filled(nAlt, 0.0);

    // multiplica local × global
    final altWCase = GetIt.I<ComputeAltWeightsUseCase>();
    for (var k = 0; k < _critW.length; k++) {
      final local = await altWCase.call(widget.decisionId, k, nAlt);
      for (var i = 0; i < nAlt; i++) {
        _global[i] += local[i] * _critW[k];
      }
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext c) {
    if (_loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final sum = _global.reduce((a, b) => a + b);
    final norm = _global.map((s) => s / sum).toList();
    final bestIdx = norm.indexOf(norm.reduce(max));
    final bestPct = (norm[bestIdx]*100).toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados AHP')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children:[
          SizedBox(
            height:200,
            child: BarChart(BarChartData(
              alignment: BarChartAlignment.spaceEvenly,
              titlesData: FlTitlesData(show:false),
              gridData: FlGridData(show:false),
              borderData: FlBorderData(show:false),
              barGroups: List.generate(norm.length,(i)=>BarChartGroupData(
                x:i, barRods:[BarChartRodData(toY:norm[i]*100)]
              )),
            )),
          ),
          const SizedBox(height:24),
          Text(
            List.generate(norm.length,(i){
              final p = (norm[i]*100).toStringAsFixed(1);
              return '${_altNames[i]}: $p%';
            }).join('\n'),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize:16),
          ),
          const Divider(height:32),
          Text(
            'La mejor alternativa es\n${_altNames[bestIdx]}  ($bestPct %)',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize:20,fontWeight:FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
