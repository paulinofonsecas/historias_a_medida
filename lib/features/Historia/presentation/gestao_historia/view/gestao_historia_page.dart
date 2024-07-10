import 'package:flutter/material.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/bloc/bloc.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/widgets/gestao_historia_body.dart';

/// {@template gestao_historia_page}
/// A description for GestaoHistoriaPage
/// {@endtemplate}
class GestaoHistoriaPage extends StatelessWidget {
  /// {@macro gestao_historia_page}
  const GestaoHistoriaPage({super.key});

  /// The static route for GestaoHistoriaPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const GestaoHistoriaPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GestaoHistoriaBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestão de historias'),
        ),
        body: const GestaoHistoriaView(),
      ),
    );
  }
}

/// {@template gestao_historia_view}
/// Displays the Body of GestaoHistoriaView
/// {@endtemplate}
class GestaoHistoriaView extends StatelessWidget {
  /// {@macro gestao_historia_view}
  const GestaoHistoriaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GestaoHistoriaBody();
  }
}
