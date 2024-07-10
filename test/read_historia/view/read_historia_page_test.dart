// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:historias_a_medida/features/Historia/presentation/read_historia/read_historia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReadHistoriaPage', () {
    group('route', () {
      test('is routable', () {
        expect(ReadHistoriaPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ReadHistoriaView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ReadHistoriaPage()));
      expect(find.byType(ReadHistoriaView), findsOneWidget);
    });
  });
}
