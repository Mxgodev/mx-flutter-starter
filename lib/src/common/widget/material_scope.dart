import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mx_flutter_starter/src/common/localization/generated/l10n.dart';
import 'package:mx_flutter_starter/src/feature/settings/widget/theme_scope.dart';

class MaterialScope extends StatefulWidget {
  const MaterialScope({Key? key}) : super(key: key);

  @override
  State<MaterialScope> createState() => _MaterialScopeState();
}

class _MaterialScopeState extends State<MaterialScope> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      themeMode: ThemeScope.modeOf(context),
      home: const Scaffold(
        body: Center(
          child: Text(
            "Mxgodev's starter app",
            textScaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
