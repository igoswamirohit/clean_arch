import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'app.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  setupLogging();
  runApp(App());
}

//For Interceptor Logging
void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    log('${rec.level.name}: ${rec.message}');
  });
}
