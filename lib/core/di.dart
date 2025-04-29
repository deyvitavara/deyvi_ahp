import 'package:get_it/get_it.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import '../features/ahp/data/datasources/app_database.dart';
import '../core/ahp_solver.dart';
import '../features/ahp/data/repositories/ahp_repository_impl.dart';
import '../features/ahp/domain/repositories/ahp_repository.dart';
import '../features/ahp/domain/usecases/add_default_comparisons.dart';
import '../features/ahp/domain/usecases/compute_alt_weights.dart';
import '../features/ahp/domain/usecases/compute_final_weights.dart';
import '../features/ahp/domain/usecases/compute_seed_weights.dart';
import '../features/ahp/domain/usecases/compute_weights.dart';
import '../features/ahp/domain/usecases/create_decision.dart';
import '../features/ahp/domain/usecases/fetch_comparisons.dart';
import '../features/ahp/domain/usecases/fetch_critical_pairs.dart';
import '../features/ahp/domain/usecases/compute_consistency.dart';
import '../features/ahp/presentation/providers/decision_provider.dart';
import '../features/ahp/presentation/providers/seed_provider.dart';
import '../features/ahp/presentation/providers/comparison_provider.dart';
import '../features/ahp/presentation/providers/result_provider.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => AppDatabase());
  sl.registerLazySingleton(() => AhpSolver());
  sl.registerLazySingleton<IAhpRepository>(
    () => AhpRepositoryImpl(db: sl(), solver: sl()),
  );
  sl.registerFactory(() => ComputeAltWeightsUseCase(sl<IAhpRepository>(), sl<AhpSolver>()));
  sl.registerFactory(() => ComputeConsistencyUseCase(sl<IAhpRepository>()));
  sl.registerFactory(() => ComputeSeedWeights(sl<IAhpRepository>()));
  sl.registerFactory(() => CreateDecisionUseCase(sl()));
  sl.registerFactory(() => AddDefaultComparisonsUseCase(sl()));
  sl.registerFactory(() => FetchComparisonsUseCase(sl()));
  sl.registerFactory(() => FetchCriticalPairsUseCase(sl()));
  sl.registerFactory(() => ComputeWeightsUseCase(sl()));
   sl.registerFactory(() => ComputeFinalWeightsUseCase(sl()));
  sl.registerFactory(() => DecisionProvider(sl()));
  sl.registerFactory(() => SeedProvider(sl(), sl()));
  sl.registerFactory(() => ComparisonProvider(sl(), sl(), sl()));
  sl.registerFactory(() => ResultProvider(sl()));
}
