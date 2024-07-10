import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';

abstract class IHistoriaDatasource {
  Future<bool> addHistoria(HistoriaEntity entity);
  Future<List<HistoriaEntity>> getHistorias();
}
