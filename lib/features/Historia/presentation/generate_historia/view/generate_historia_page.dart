import 'package:flutter/material.dart';
import 'package:historias_a_medida/features/Historia/presentation/generate_historia/bloc/bloc.dart';
import 'package:historias_a_medida/features/Historia/presentation/generate_historia/widgets/generate_historia_body.dart';

/// {@template generate_historia_page}
/// A description for GenerateHistoriaPage
/// {@endtemplate}
class GenerateHistoriaPage extends StatelessWidget {
  /// {@macro generate_historia_page}
  const GenerateHistoriaPage({super.key});

  /// The static route for GenerateHistoriaPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const GenerateHistoriaPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerateHistoriaBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Crie uma historia'),
              actions: [
                TextButton.icon(
                  onPressed: () {
                    if (context
                        .read<GenerateHistoriaBloc>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context
                          .read<GenerateHistoriaBloc>()
                          .add(const GenerateHistoriaSubmitted());
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar'),
                ),
              ],
            ),
            body: const GenerateHistoriaView(),
          );
        },
      ),
    );
  }
}

/// {@template generate_historia_view}
/// Displays the Body of GenerateHistoriaView
/// {@endtemplate}
class GenerateHistoriaView extends StatelessWidget {
  /// {@macro generate_historia_view}
  const GenerateHistoriaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenerateHistoriaBody();
  }
}
