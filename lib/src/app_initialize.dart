import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:easy_pro/src/datasource/models/formulaire.dart';

final class AppInitialize {
  static Future<void> hiveConnect() async {
    final directory = await getApplicationDocumentsDirectory();

    Hive
      ..init(directory.path)
      ..registerAdapter(FormulaireAdapter());

    await Hive.openBox('testBox');
  }
}
