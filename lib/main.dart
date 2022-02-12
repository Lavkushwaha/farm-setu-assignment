import 'dart:async';

import 'package:farm_setu_assignment/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint("FLUTTER CONTEXT : ${details.context}");
    debugPrint("FLUTTER ERROR : ${details.exceptionAsString()}");
    debugPrint("FLUTTER STACKTRACE : ${details.stack}");
  };
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runZonedGuarded(
      () async {
        const Widget app = MyApp();
        runApp(app);
      },
      (dynamic error, dynamic stack) {
        //FIREBASE CRASHYLYTICS
      },
    );
  });
}