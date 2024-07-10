import 'package:flutter/material.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/bloc/bloc.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/widgets/historias_list_widget.dart';

class GestaoHistoriaBody extends StatelessWidget {
  /// {@macro gestao_historia_body}
  const GestaoHistoriaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: const HistoriasListWidget(),
    );
  }
}
