import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/decision_provider.dart';

class DataInputScreen extends StatefulWidget {
  const DataInputScreen({super.key});
  @override
  State<DataInputScreen> createState() => _DataInputScreenState();
}

class _DataInputScreenState extends State<DataInputScreen> {
  final tCtrl = TextEditingController();
  final aCtrl = TextEditingController();
  final cCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DecisionProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva Decisión AHP')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: tCtrl, decoration: const InputDecoration(labelText: 'Título')),
          const SizedBox(height: 8),
          TextField(controller: aCtrl, decoration: const InputDecoration(labelText: 'Alternativas (coma)')),
          const SizedBox(height: 8),
          TextField(controller: cCtrl, decoration: const InputDecoration(labelText: 'Criterios (coma)')),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              final title = tCtrl.text.trim();
              final alts  = aCtrl.text.split(',').map((s)=>s.trim()).toList();
              final crits = cCtrl.text.split(',').map((s)=>s.trim()).toList();
              final id = await prov.newDecision(title, alts, crits);
              context.push('/seed/$id');
            },
            child: const Text('Comenzar'),
          ),
        ]),
      ),
    );
  }
}
