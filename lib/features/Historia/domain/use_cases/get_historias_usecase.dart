import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';
import 'package:historias_a_medida/features/Historia/domain/repositories/i_historia_repository.dart';

class GetHistoriasUsecase {
  GetHistoriasUsecase(this.repository);
  final IHistoriaRepository repository;

  Future<List<HistoriaEntity>> call() async {
    return repository.getHistorias();
  }
}
