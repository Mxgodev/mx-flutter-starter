import 'package:flutter/cupertino.dart';
import 'package:mx_flutter_starter/src/common/widget/dependencies_scope.dart';

abstract class IDependencies {}

class Dependencies implements IDependencies {}

extension DependenciesHelper on BuildContext {
  IDependencies get dependencies => DependenciesScope.of(this);
}
