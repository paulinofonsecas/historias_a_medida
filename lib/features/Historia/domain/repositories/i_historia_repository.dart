import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';

abstract class IHistoriaRepository {
  Future<bool> addHistoria(HistoriaEntity entity);
  Future<List<HistoriaEntity>> getHistorias();
}
