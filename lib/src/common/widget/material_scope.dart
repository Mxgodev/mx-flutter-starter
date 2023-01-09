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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Mxgodev's starter app",
                textScaleFactor: 2,
              ),
              IconButton(
                onPressed: () {
                  if (ThemeScope.brightnessOf(context) == Brightness.dark) {
                    ThemeScope.setMode(context, ThemeMode.light);
                  } else {
                    ThemeScope.setMode(context, ThemeMode.dark);
                  }
                },
                icon: const Icon(Icons.light_mode),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
