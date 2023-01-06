import 'dart:async';

import 'package:mx_flutter_starter/src/common/util/logging.dart';

void main() {
  runZonedGuarded(
    () {},
    (error, stack) => logger.severe(error, stack),
  );
}
