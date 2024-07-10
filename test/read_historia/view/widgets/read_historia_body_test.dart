// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:historias_a_medida/features/Historia/presentation/read_historia/read_historia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReadHistoriaBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ReadHistoriaBloc(),
          child: MaterialApp(home: ReadHistoriaBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
