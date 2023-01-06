import 'dart:developer' as developer;

import 'package:logging/logging.dart';

final logger = Logger("App");

Future<void> $setupLogging() async {
  Logger.root.onRecord.listen((record) {
    developer.log(
      record.message,
      error: record.error,
      level: record.level.value,
      sequenceNumber: record.sequenceNumber,
      stackTrace: record.stackTrace,
      time: record.time,
      zone: record.zone,
      name: record.loggerName,
    );
  });
}
