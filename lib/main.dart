// lib/main.dart

import 'package:flutter/material.dart';
import 'core/di.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'features/ahp/presentation/providers/decision_provider.dart';
import 'features/ahp/presentation/providers/seed_provider.dart';
import 'features/ahp/presentation/providers/comparison_provider.dart';
import 'features/ahp/presentation/providers/result_provider.dart';

import 'features/ahp/presentation/screens/data_input_screen.dart';
import 'features/ahp/presentation/screens/seed_ranking_screen.dart';
import 'features/ahp/presentation/screens/adaptive_comparison_screen.dart';
import 'features/ahp/presentation/screens/result_screen.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(routes: [
      // Pantalla inicial: ingreso de datos
      GoRoute(
        path: '/',
        builder: (_, __) => const DataInputScreen(),
      ),

      // Pantalla de seed ranking
      GoRoute(
        path: '/seed/:decisionId',
        builder: (_, state) {
          final rawId = state.pathParameters['decisionId']!;
          final id = int.parse(rawId);
          return SeedRankingScreen(decisionId: id);
        },
      ),

      // Pantalla de comparaciones adaptativas
      GoRoute(
        path: '/compare/:decisionId',
        builder: (_, state) {
          final rawId = state.pathParameters['decisionId']!;
          final id = int.parse(rawId);
          return AdaptiveComparisonScreen(decisionId: id);
        },
      ),

      // Pantalla de resultados
      GoRoute(
        path: '/result/:decisionId',
        builder: (_, state) {
          final rawId = state.pathParameters['decisionId']!;
          final id = int.parse(rawId);
          return ResultScreen(decisionId: id);
        },
      ),
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<DecisionProvider>()),
        ChangeNotifierProvider(create: (_) => sl<SeedProvider>()),
        ChangeNotifierProvider(create: (_) => sl<ComparisonProvider>()),
        ChangeNotifierProvider(create: (_) => sl<ResultProvider>()),
      ],
      child: MaterialApp.router(
        title: 'AHP Puro Offline',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: router,
      ),
    );
  }
}
