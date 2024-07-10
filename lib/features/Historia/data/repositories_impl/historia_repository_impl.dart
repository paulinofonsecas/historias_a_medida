import 'package:historias_a_medida/features/Historia/data/data_sources/i_historia_datasource.dart';
import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';
import 'package:historias_a_medida/features/Historia/domain/repositories/i_historia_repository.dart';

class HistoriaRepositoryImpl implements IHistoriaRepository {
  HistoriaRepositoryImpl(this._historiaDatasource);

  final IHistoriaDatasource _historiaDatasource;

  @override
  Future<bool> addHistoria(HistoriaEntity entity) {
    return _historiaDatasource.addHistoria(entity);
  }

  @override
  Future<List<HistoriaEntity>> getHistorias() {
    return _historiaDatasource.getHistorias();
  }
}
