// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:historias_a_medida/features/Historia/presentation/generate_historia/bloc/generate_historia_bloc.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/cubit/bottom_nav_bar_cubit.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/gestao_historia.dart';
import 'package:historias_a_medida/utils/dependencies.dart';
import 'package:historias_a_medida/utils/snackbar_util.dart';

/// {@template generate_historia_body}
/// Body of the GenerateHistoriaPage.
///
/// Add what it does
/// {@endtemplate}
class GenerateHistoriaBody extends StatefulWidget {
  /// {@macro generate_historia_body}
  const GenerateHistoriaBody({super.key});

  @override
  State<GenerateHistoriaBody> createState() => _GenerateHistoriaBodyState();
}

class _GenerateHistoriaBodyState extends State<GenerateHistoriaBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenerateHistoriaBloc, GenerateHistoriaState>(
      listener: (context, state) {
        if (state is GenerateHistoriaSuccess) {
          SnackbarUtil.showSucessSnackbar(
            context: context,
            message: 'Historia criada com sucesso',
          );

          context.read<BottomNavBarCubit>().onBottomNavBarChanged(1);
          getIt<GestaoHistoriaBloc>().add(const GetAllHistorias());
        }

        if (state is GenerateHistoriaError) {
          SnackbarUtil.showErrorSnackbar(
            context: context,
            message: state.error,
          );
        }
      },
      builder: (context, state) {
        if (state is GenerateHistoriaLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Form(
          key: context.read<GenerateHistoriaBloc>().formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o nome da Historia';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome da historia',
                  ),
                  onChanged: (value) {
                    context.read<GenerateHistoriaBloc>().historiaModel = context
                        .read<GenerateHistoriaBloc>()
                        .historiaModel
                        .copyWith(
                          nome: value,
                        );
                  },
                ),
                const Gutter(),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o nome do personagem principal';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome do personagem principal',
                    helperText: 'Capitão América',
                  ),
                  onChanged: (value) {
                    context.read<GenerateHistoriaBloc>().historiaModel = context
                        .read<GenerateHistoriaBloc>()
                        .historiaModel
                        .copyWith(
                          personagemPrincipal: value,
                        );
                  },
                ),
                const Gutter(),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe os coadjuvantes';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome dos coadjuvantes',
                    helperText: 'Ex: Aranha, Homem de Ferro, etc',
                  ),
                  onChanged: (value) {
                    context.read<GenerateHistoriaBloc>().historiaModel = context
                        .read<GenerateHistoriaBloc>()
                        .historiaModel
                        .copyWith(
                          coadjuvantes: value,
                        );
                  },
                ),
                const Gutter(),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a descrição da Historia';
                    }
                    return null;
                  },
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descricao',
                  ),
                  onChanged: (value) {
                    context.read<GenerateHistoriaBloc>().historiaModel = context
                        .read<GenerateHistoriaBloc>()
                        .historiaModel
                        .copyWith(
                          descricao: value,
                        );
                  },
                ),
                const Gutter(),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe as categorias da Historia';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Categorias',
                    helperText: 'Ex: Aventura, Fantasia, etc',
                  ),
                  onChanged: (value) {
                    context.read<GenerateHistoriaBloc>().historiaModel = context
                        .read<GenerateHistoriaBloc>()
                        .historiaModel
                        .copyWith(
                          categorias: value,
                        );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
