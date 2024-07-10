import 'dart:async';

import 'package:historias_a_medida/app/app.dart';
import 'package:historias_a_medida/bootstrap.dart';
import 'package:historias_a_medida/utils/dependencies.dart';

void main() async {
  await initDependencies();

  unawaited(bootstrap(() => const App()));
}
