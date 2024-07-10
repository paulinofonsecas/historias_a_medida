import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';
import 'package:historias_a_medida/features/Historia/presentation/read_historia/cubit/text_zoom_cubit.dart';
import 'package:historias_a_medida/utils/dependencies.dart';

/// {@template read_historia_body}
/// Body of the ReadHistoriaPage.
///
/// Add what it does
/// {@endtemplate}
class ReadHistoriaBody extends StatelessWidget {
  /// {@macro read_historia_body}
  const ReadHistoriaBody({super.key});

  @override
  Widget build(BuildContext context) {
    final historia = getIt<HistoriaEntity>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: BlocBuilder<TextZoomCubit, TextZoomState>(
          builder: (context, state) {
            return Text(
              historia.historia,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: state.zoom,
                  ),
            );
          },
        ),
      ),
    );
  }
}
