import 'package:get_it/get_it.dart';
import 'package:historias_a_medida/features/Historia/data/data_sources/i_historia_datasource.dart';
import 'package:historias_a_medida/features/Historia/data/data_sources/local/memory_historia_datasource.dart';
import 'package:historias_a_medida/features/Historia/data/repositories_impl/historia_repository_impl.dart';
import 'package:historias_a_medida/features/Historia/domain/repositories/i_historia_repository.dart';
import 'package:historias_a_medida/features/Historia/domain/use_cases/add_historia_usecase.dart';
import 'package:historias_a_medida/features/Historia/domain/use_cases/get_historias_usecase.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/bloc/gestao_historia_bloc.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/cubit/bottom_nav_bar_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt
    ..registerLazySingleton<IHistoriaDatasource>(
      MemoryHistoriaDatasource.new,
    )
    ..registerLazySingleton<IHistoriaRepository>(
      () => HistoriaRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<GetHistoriasUsecase>(
      () => GetHistoriasUsecase(getIt()),
    )
    ..registerLazySingleton<AddHistoriaUsecase>(
      () => AddHistoriaUsecase(getIt()),
    )
    ..registerLazySingleton(BottomNavBarCubit.new)
    ..registerLazySingleton(GestaoHistoriaBloc.new);
}
