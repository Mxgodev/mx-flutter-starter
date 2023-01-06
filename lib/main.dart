import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mx_flutter_starter/src/common/data/dependencies.dart';
import 'package:mx_flutter_starter/src/common/initialization/initialization.dart';
import 'package:mx_flutter_starter/src/common/util/logging.dart';
import 'package:mx_flutter_starter/src/common/widget/app.dart';
import 'package:mx_flutter_starter/src/common/widget/error_app.dart';

void main() {
  runZonedGuarded(
    () async {
      try {
        await $initializeApp();
      } on Object catch (e, s) {
        logger.severe("App initialization error", e, s);
        runApp(const ErrorApp());
        return;
      }

      final IDependencies dependencies = Dependencies();
      runApp(App(dependencies: dependencies));
    },
    (error, stack) => logger.severe("Zone error", error, stack),
  );
}
