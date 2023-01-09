import 'package:flutter/material.dart';
import 'package:mx_flutter_starter/src/common/data/dependencies.dart';
import 'package:mx_flutter_starter/src/common/widget/dependencies_scope.dart';
import 'package:mx_flutter_starter/src/feature/settings/widget/theme_scope.dart';

import 'material_scope.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.dependencies,
  }) : super(key: key);

  final IDependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      dependencies: dependencies,
      child: const ThemeScope(
        child: MaterialScope(),
      ),
    );
  }
}
