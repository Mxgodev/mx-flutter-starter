import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mx_flutter_starter/src/common/data/dependencies.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeScope extends StatefulWidget {
  final Widget child;

  const ThemeScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  static ThemeMode modeOf(BuildContext context) => _InheritedThemeScope.of(context).themeMode;

  static Brightness brightnessOf(BuildContext context) {
    switch (modeOf(context)) {
      case ThemeMode.system:
        return window.platformBrightness;
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
    }
  }

  static void setMode(BuildContext context, ThemeMode mode) =>
      _InheritedThemeScope.of(context).state.setThemeMode(mode);

  @override
  State<ThemeScope> createState() => _ThemeScopeState();
}

class _ThemeScopeState extends State<ThemeScope> {
  static const String _$themeModeKey = 'theme_mode';

  late final SharedPreferences _sharedPreferences = context.dependencies.sharedPreferences;

  late ThemeMode _themeMode;

  ThemeMode? get _savedThemeMode {
    final String? modeName = _sharedPreferences.getString(_$themeModeKey);
    if (modeName == null) return null;
    return ThemeMode.values.firstWhereOrNull((mode) => mode.name == modeName);
  }

  void setThemeMode(ThemeMode mode) {
    _sharedPreferences.setString(_$themeModeKey, mode.name).ignore();
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  void initState() {
    _themeMode = _savedThemeMode ?? ThemeMode.system;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedThemeScope(
      state: this,
      themeMode: _themeMode,
      child: widget.child,
    );
  }
}

class _InheritedThemeScope extends InheritedWidget {
  final ThemeMode themeMode;
  final _ThemeScopeState state;

  const _InheritedThemeScope({
    Key? key,
    required Widget child,
    required this.themeMode,
    required this.state,
  }) : super(key: key, child: child);

  static _InheritedThemeScope of(BuildContext context) {
    final _InheritedThemeScope? result = context.dependOnInheritedWidgetOfExactType<_InheritedThemeScope>();
    assert(result != null, 'No _InheritedThemeScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(_InheritedThemeScope oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
