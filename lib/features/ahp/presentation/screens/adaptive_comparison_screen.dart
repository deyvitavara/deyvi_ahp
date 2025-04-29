/*import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart' as drift;
import '../../data/datasources/app_database.dart';
import '../../domain/usecases/fetch_critical_pairs.dart';
import '../../domain/usecases/compute_consistency.dart';

class AdaptiveComparisonScreen extends StatefulWidget {
  final int decisionId;
  const AdaptiveComparisonScreen({required this.decisionId, super.key});
  @override
  State<AdaptiveComparisonScreen> createState()=>_AdaptiveComparisonScreenState();
}

class _AdaptiveComparisonScreenState extends State<AdaptiveComparisonScreen>{
  List<List<int>> _pairs=[];
  int _idx=0;
  bool _loading=true;

  @override
  void initState(){
    super.initState();
    _load();
  }
  Future<void> _load() async {
    final all=await GetIt.I<FetchCriticalPairsUseCase>()
        .call(widget.decisionId,0.1);
    var ps=all.take(5).toList();
    if(ps.isEmpty) ps.add([0,1]);
    setState(() {
      _pairs = ps;
      _loading = false;
    });
  }

  Future<void> _answer(int dir) async {
    final db=GetIt.I<AppDatabase>();
    final p=_pairs[_idx];
    final v=dir==1?5.0:1/5.0;
    await (db.update(db.comparisons)
          ..where((t)=>t.decisionId.equals(widget.decisionId)&t.critA.equals(p[0])&t.critB.equals(p[1])))
        .write(ComparisonsCompanion(value:Value(v)));
    final cr=await GetIt.I<ComputeConsistencyUseCase>().call(widget.decisionId);
    if(cr<=0.10||_idx==_pairs.length-1){
      context.push('/result/${widget.decisionId}');
    } else {
      setState(()=>_idx++);
    }
  }

  @override
  Widget build(BuildContext context){
    if(_loading) return const Scaffold(body:Center(child:CircularProgressIndicator()));
    final p=_pairs[_idx];
    return Scaffold(
      appBar:AppBar(title:Text('Comparación ${_idx+1}/${_pairs.length}')),
      body:Center(child:Column(mainAxisSize:MainAxisSize.min, children:[
        const Text('¿Cuál es más importante?'),
        const SizedBox(height:12),
        Text('Criterio ${p[0]+1} vs. ${p[1]+1}',
            style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
        const SizedBox(height:32),
        Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:[
          ElevatedButton(onPressed:()=>_answer(-1),child:const Text('Izquierda')),
          ElevatedButton(onPressed:()=>_answer(1), child:const Text('Derecha')),
        ]),
      ])),
    );
  }
}
*/


// lib/features/ahp/presentation/screens/adaptive_comparison_screen.dart
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

// Ocultamos solo el Column para que Column sea siempre el de Flutter
import 'package:drift/drift.dart' hide Column;  
import '../../data/datasources/app_database.dart';
import '../../domain/usecases/fetch_critical_pairs.dart';
import '../../domain/usecases/compute_consistency.dart';

class AdaptiveComparisonScreen extends StatefulWidget {
  final int decisionId;
  const AdaptiveComparisonScreen({required this.decisionId, super.key});

  @override
  State<AdaptiveComparisonScreen> createState() =>
      _AdaptiveComparisonScreenState();
}

class _AdaptiveComparisonScreenState
    extends State<AdaptiveComparisonScreen> {
  List<List<int>> _pairs = [];
  int _idx = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadPairs();
  }

  Future<void> _loadPairs() async {
    final all = await GetIt.I<FetchCriticalPairsUseCase>()
        .call(widget.decisionId, 0.1);
    final ps = all.take(5).toList();
    if (ps.isEmpty) ps.add([0, 1]);
    setState(() {
      _pairs = ps;
      _idx = 0;
      _loading = false;
    });
  }

  Future<void> _answer(bool right) async {
    final p = _pairs[_idx];
    final v = right ? 5.0 : 1 / 5.0;
    final db = GetIt.I<AppDatabase>();

    // 1) Actualiza únicamente el campo `value` de esa comparación:
    await (db.update(db.comparisons)
          ..where((tbl) =>
              tbl.decisionId.equals(widget.decisionId) &
              tbl.critA.equals(p[0]) &
              tbl.critB.equals(p[1])))
        .write(ComparisonsCompanion(value: Value(v)));

    // 2) Recalcula el Consistency Ratio
    final cr = await GetIt.I<ComputeConsistencyUseCase>()
        .call(widget.decisionId);

    // 3) Si ya es consistente (CR ≤ 0.1) o agotaste pares, navega a resultados
    if (cr <= 0.10 || _idx == _pairs.length - 1) {
      context.push('/result/${widget.decisionId}');
    } else {
      setState(() => _idx++);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    final p = _pairs[_idx];
    return Scaffold(
      appBar:
          AppBar(title: Text('Comparación ${_idx + 1}/${_pairs.length}')),
      body: Center(
        child: Column(                // <-- Ahora sí es el widget Column
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('¿Cuál es más importante?'),
            const SizedBox(height: 12),
            Text(
              'Criterio ${p[0] + 1} vs. ${p[1] + 1}',
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _answer(false),
                  child: const Text('Izquierda'),
                ),
                ElevatedButton(
                  onPressed: () => _answer(true),
                  child: const Text('Derecha'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
