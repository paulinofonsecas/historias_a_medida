import 'package:historias_a_medida/features/Historia/data/data_sources/i_historia_datasource.dart';
import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';

class MemoryHistoriaDatasource implements IHistoriaDatasource {
  final list = <HistoriaEntity>[];

  @override
  Future<bool> addHistoria(HistoriaEntity entity) {
    if (list.contains(entity)) {
      return Future.value(false);
    }

    list.add(entity);
    return Future.value(true);
  }

  @override
  Future<List<HistoriaEntity>> getHistorias() {
    return Future.value(list);
  }
}
