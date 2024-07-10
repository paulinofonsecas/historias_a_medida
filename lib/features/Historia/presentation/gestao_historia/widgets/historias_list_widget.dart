import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/bloc/gestao_historia_bloc.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/widgets/historia_card_widget.dart';
import 'package:historias_a_medida/utils/dependencies.dart';

class HistoriasListWidget extends StatelessWidget {
  const HistoriasListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GestaoHistoriaBloc, GestaoHistoriaState>(
      bloc: getIt<GestaoHistoriaBloc>()..add(const GetAllHistorias()),
      builder: (context, state) {
        if (state is GestaoHistoriaLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GestaoHistoriaError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is GestaoHistoriaSuccess) {
          if (state.historias.isEmpty) {
            return const Center(
              child: Text('Nenhuma Historia encontrada'),
            );
          }

          return ListView.separated(
            itemCount: state.historias.length,
            separatorBuilder: (context, index) => const SizedBox(height: 32),
            itemBuilder: (context, index) {
              return HistoriaCardWidget(
                historia: state.historias[index],
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
