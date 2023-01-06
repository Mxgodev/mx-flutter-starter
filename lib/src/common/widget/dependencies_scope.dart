import 'package:flutter/material.dart';
import 'package:mx_flutter_starter/src/common/data/dependencies.dart';

class DependenciesScope extends InheritedWidget {
  final IDependencies dependencies;

  const DependenciesScope({
    Key? key,
    required Widget child,
    required this.dependencies,
  }) : super(key: key, child: child);

  static IDependencies of(BuildContext context) {
    final DependenciesScope? result =
        context.getElementForInheritedWidgetOfExactType<DependenciesScope>()?.widget as DependenciesScope?;
    assert(result != null, 'No DependenciesScope found in context');
    return result!.dependencies;
  }

  @override
  bool updateShouldNotify(DependenciesScope oldWidget) {
    return false;
  }
}
