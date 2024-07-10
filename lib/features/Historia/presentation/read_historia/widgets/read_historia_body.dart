import 'package:flutter/material.dart';
import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';
import 'package:historias_a_medida/utils/dependencies.dart';
import 'package:markdown_widget/widget/markdown.dart';

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

    return Padding(
      padding: const EdgeInsets.all(8),
      child: MarkdownWidget(
        data: historia.historia,
      ),
    );
  }
}
