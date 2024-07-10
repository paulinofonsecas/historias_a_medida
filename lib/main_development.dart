import 'dart:async';

import 'package:flutter/material.dart';
import 'package:historias_a_medida/app/app.dart';
import 'package:historias_a_medida/bootstrap.dart';
import 'package:historias_a_medida/utils/dependencies.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await initDependencies();

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter('./app_financas_db');

  unawaited(bootstrap(() => const App()));
}
