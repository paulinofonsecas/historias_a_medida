// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:historias_a_medida/features/Historia/presentation/read_historia/bloc/bloc.dart';

void main() {
  group('ReadHistoriaEvent', () {  
    group('CustomReadHistoriaEvent', () {
      test('supports value equality', () {
        expect(
          CustomReadHistoriaEvent(),
          equals(const CustomReadHistoriaEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomReadHistoriaEvent(),
          isNotNull
        );
      });
    });
  });
}
