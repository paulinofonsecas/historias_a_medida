// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:historias_a_medida/features/Historia/presentation/read_historia/bloc/bloc.dart';

void main() {
  group('ReadHistoriaState', () {
    test('supports value equality', () {
      expect(
        ReadHistoriaState(),
        equals(
          const ReadHistoriaState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ReadHistoriaState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const readHistoriaState = ReadHistoriaState(
            customProperty: 'My property',
          );
          expect(
            readHistoriaState.copyWith(),
            equals(readHistoriaState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const readHistoriaState = ReadHistoriaState(
            customProperty: 'My property',
          );
          final otherReadHistoriaState = ReadHistoriaState(
            customProperty: 'My property 2',
          );
          expect(readHistoriaState, isNot(equals(otherReadHistoriaState)));

          expect(
            readHistoriaState.copyWith(
              customProperty: otherReadHistoriaState.customProperty,
            ),
            equals(otherReadHistoriaState),
          );
        },
      );
    });
  });
}
