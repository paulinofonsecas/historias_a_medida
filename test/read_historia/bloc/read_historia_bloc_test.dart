// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:historias_a_medida/features/Historia/presentation/read_historia/bloc/bloc.dart';

void main() {
  group('ReadHistoriaBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ReadHistoriaBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final readHistoriaBloc = ReadHistoriaBloc();
      expect(readHistoriaBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<ReadHistoriaBloc, ReadHistoriaState>(
      'CustomReadHistoriaEvent emits nothing',
      build: ReadHistoriaBloc.new,
      act: (bloc) => bloc.add(const CustomReadHistoriaEvent()),
      expect: () => <ReadHistoriaState>[],
    );
  });
}
