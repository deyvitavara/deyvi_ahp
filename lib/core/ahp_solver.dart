// lib/core/ahp_solver.dart

import 'dart:math';
import '../features/ahp/domain/entities/pair_entity.dart';

class AhpSolver {
  /// Construye la matriz A (n×n) a partir de juicios explícitos,
  /// rellenando transitivamente las entradas faltantes.
  List<List<double>> buildMatrixWithJudgments(
    List<PairEntity> judgments,
    int n,
  ) {
    // 1. Inicializa A con 1.0 en todas las posiciones
    final A = List.generate(n, (_) => List.filled(n, 1.0));

    // 2. Aplica los juicios directos
    for (final j in judgments) {
      final a = j.critA;
      final b = j.critB;
      final v = j.value;
      A[a][b] = v;
      A[b][a] = 1.0 / v;
    }

    // 3. Garantiza que diagonal = 1.0
    for (var i = 0; i < n; i++) {
      A[i][i] = 1.0;
    }

    // 4. Floyd–Warshall multiplicativo para transitividad
    for (var k = 0; k < n; k++) {
      for (var i = 0; i < n; i++) {
        for (var j = 0; j < n; j++) {
          if (A[i][j] == 1.0 && A[i][k] > 0 && A[k][j] > 0) {
            final viaK = A[i][k] * A[k][j];
            A[i][j] = viaK;
            A[j][i] = 1.0 / viaK;
          }
        }
      }
    }

    return A;
  }

  /// Método de la potencia para obtener el vector propio principal.
  List<double> powerMethod(
    List<List<double>> A, {
    int maxIter = 100,
    double tol = 1e-8,
  }) {
    final n = A.length;
    var x = List.filled(n, 1.0);
    var xNew = List.filled(n, 0.0);

    for (var iter = 0; iter < maxIter; iter++) {
      for (var i = 0; i < n; i++) {
        xNew[i] = 0.0;
        for (var j = 0; j < n; j++) {
          xNew[i] += A[i][j] * x[j];
        }
      }
      final sum = xNew.reduce((a, b) => a + b);
      for (var i = 0; i < n; i++) {
        xNew[i] /= sum;
      }
      final error = List.generate(n, (i) => (xNew[i] - x[i]).abs())
          .reduce(max);
      if (error < tol) break;
      x = List.from(xNew);
    }

    return xNew;
  }

  /// Calcula el autovalor principal a partir de A y su vector propio w.
  double eigenValue(List<List<double>> A, List<double> w) {
    final n = A.length;
    var Aw = List.filled(n, 0.0);
    for (var i = 0; i < n; i++) {
      for (var j = 0; j < n; j++) {
        Aw[i] += A[i][j] * w[j];
      }
    }
    return Aw.asMap().entries
            .map((e) => e.value / w[e.key])
            .reduce((a, b) => a + b) /
        n;
  }

  /// Calcula el Consistency Ratio CR = CI / RI.
  double consistencyRatio(List<List<double>> A, List<double> w) {
    final n = A.length;
    final lambdaMax = eigenValue(A, w);
    final ci = (lambdaMax - n) / (n - 1);
    const riMap = {
      1: 0.00,
      2: 0.00,
      3: 0.58,
      4: 0.90,
      5: 1.12,
      6: 1.24,
      7: 1.32,
      8: 1.41,
      9: 1.45,
      10: 1.49,
    };
    final ri = riMap[n] ?? 1.0;
    return ci / ri;
  }
}
