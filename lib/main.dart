import 'dart:io';

import 'package:easy_pro/src/shared/services/my_http_Overrides.dart';
import 'package:flutter/material.dart';
import 'package:easy_pro/src/app_initialize.dart';
import 'package:easy_pro/src/core/easy_pro_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();
  await AppInitialize.hiveConnect();
  runApp(EasyProApp());
}
