import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';
import 'package:historias_a_medida/features/Historia/domain/repositories/i_historia_repository.dart';

class AddHistoriaUsecase {
  AddHistoriaUsecase(this.repository);
  final IHistoriaRepository repository;

  Future<bool> call(HistoriaEntity entity) async {
    return repository.addHistoria(entity);
  }
}
