import 'package:flutter/material.dart';
import 'package:easy_pro/src/app_initialize.dart';
import 'package:easy_pro/src/core/easy_pro_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://3df576ff8cc7f34a850d7ff24378a580@o4507005797007360.ingest.us.sentry.io/4507005800808448';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      // HttpOverrides.global = MyHttpOverrides();
      await AppInitialize.hiveConnect();

      runApp(EasyProApp());
    },
  );
}
