import 'package:deyvi_ahp/features/ahp/domain/usecases/compute_consistency.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart';
import '../../data/datasources/app_database.dart';
import '../../domain/usecases/compute_weights.dart';
// en lib/features/ahp/presentation/screens/seed_ranking_screen.dart


class SeedRankingScreen extends StatefulWidget {
  final int decisionId;
  const SeedRankingScreen({required this.decisionId, super.key});

  @override
  State<SeedRankingScreen> createState() => _SeedRankingScreenState();
}

class _SeedRankingScreenState extends State<SeedRankingScreen> {
  List<Map<String, dynamic>> _items = [];
  bool _loading = true, _saving = false;
  double? _initialCr;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final db = GetIt.I<AppDatabase>();
    final rows = await (db.select(db.criteria)
          ..where((c) => c.decisionId.equals(widget.decisionId)))
        .get();

    setState(() {
      _items = rows
          .map((c) => {
                'id': c.id,
                'name': c.name,
              })
          .toList();
      _loading = false;
    });
  }

  Future<void> _onSave() async {
    setState(() => _saving = true);

    // 1) Grabar seedOrder de TODOS los criterios según su posición en _items
    final db = GetIt.I<AppDatabase>();
    for (var i = 0; i < _items.length; i++) {
      final id = _items[i]['id'] as int;
      final name = _items[i]['name'] as String;
      await db.update(db.criteria).replace(
        CriteriaCompanion(
          id: Value(id),
          decisionId: Value(widget.decisionId),
          name: Value(name),
          seedOrder: Value(i),
          value: const Value.absent(),
        ),
      );
    }

    // 2) Calcular CR inicial a partir del vector semilla
    final cr = await GetIt.I<ComputeConsistencyUseCase>().call(widget.decisionId);
    setState(() {
      _initialCr = cr;
      _saving = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('CR inicial = ${cr.toStringAsFixed(3)}')),
    );

    // 3) Navegar a comparaciones
    context.push('/compare/${widget.decisionId}');
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Ordena los criterios')),
      body: ReorderableListView.builder(
        itemCount: _items.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            final itm = _items.removeAt(oldIndex);
            _items.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, itm);
          });
        },
        itemBuilder: (_, i) {
          final it = _items[i];
          return ListTile(
            key: ValueKey(it['id']),
            title: Text(it['name']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saving ? null : _onSave,
        child: _saving
            ? const CircularProgressIndicator(color: Colors.white)
            : const Icon(Icons.arrow_forward),
      ),
    );
  }
}
