import 'package:flutter/material.dart';
import 'package:apkfree/env/env_state.dart';
import 'package:apkfree/main/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupAndRunApp(env: EnvValue.production);
}
