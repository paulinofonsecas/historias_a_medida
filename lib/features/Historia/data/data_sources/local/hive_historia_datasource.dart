import 'package:historias_a_medida/features/Historia/data/data_sources/i_historia_datasource.dart';
import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHistoriaDatasource implements IHistoriaDatasource {
  late Box<Map<dynamic, dynamic>> _bancoBox;
  final String boxName = 'historias_geradas';

  Future<void> initDb() async {
    _bancoBox = await Hive.openBox(boxName);
  }

  @override
  Future<bool> addHistoria(HistoriaEntity entity) async {
    try {
      await initDb();

      await _bancoBox.add(entity.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<HistoriaEntity>> getHistorias() async {
    try {
      await initDb();
      final data = _bancoBox.values.toList();
      final result = data
          .map<HistoriaEntity>(
            HistoriaEntity.fromMap,
          )
          .toList();

      return result;
    } on Exception {
      return [];
    }
  }
}
