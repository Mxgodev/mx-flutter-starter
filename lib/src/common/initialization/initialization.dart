import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:mx_flutter_starter/src/common/initialization/platform/platform_initialization.dart';
import 'package:mx_flutter_starter/src/common/util/logging.dart';

Future<void>? _$initializeApp;
Future<void> $initializeApp() => _$initializeApp ??= Future<void>(() async {
      late final WidgetsBinding binding;
      try {
        binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();
        await $setupLogging();
        _catchExceptions();
        await platformInitialization();
      } on Object catch (e, s) {
        logger.severe("Failed to initialize app", e, s);
        rethrow;
      } finally {
        binding.addPostFrameCallback((_) {
          binding.allowFirstFrame();
        });
      }
    });

void _catchExceptions() {
  PlatformDispatcher.instance.onError = (exception, stackTrace) {
    logger.severe("PlatformDispatcher error", exception, stackTrace);
    return true;
  };

  final sourceFlutterError = FlutterError.onError;
  FlutterError.onError = (details) {
    sourceFlutterError?.call(details);
  };
}
