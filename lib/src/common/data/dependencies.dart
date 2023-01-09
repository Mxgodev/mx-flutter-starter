import 'package:flutter/cupertino.dart';
import 'package:mx_flutter_starter/src/common/widget/dependencies_scope.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IDependencies {
  SharedPreferences get sharedPreferences;
}

class Dependencies implements IDependencies {
  @override
  final SharedPreferences sharedPreferences;

  Dependencies({
    required this.sharedPreferences,
  });
}

extension DependenciesHelper on BuildContext {
  IDependencies get dependencies => DependenciesScope.of(this);
}
