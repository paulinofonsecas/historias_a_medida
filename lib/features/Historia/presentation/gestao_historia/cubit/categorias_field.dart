import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:historias_a_medida/features/Historia/presentation/generate_historia/bloc/generate_historia_bloc.dart';

class CategoriasField extends StatelessWidget {
  const CategoriasField({super.key});

  static const categorias = [
    'Educação',
    'Aventura',
    'Ciência',
    'Drama',
    'Fantasia',
    'Amor',
    'Ficção Científica',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      onSelected: (value) {
        context.read<GenerateHistoriaBloc>().historiaModel =
            context.read<GenerateHistoriaBloc>().historiaModel.copyWith(
                  categorias: value,
                );
      },
      label: const Text('Categoria'),
      dropdownMenuEntries:
          categorias.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
      initialSelection: categorias[0],
    );
  }
}
