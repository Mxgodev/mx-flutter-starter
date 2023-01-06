import 'package:flutter/material.dart';

class MaterialScope extends StatefulWidget {
  const MaterialScope({Key? key}) : super(key: key);

  @override
  State<MaterialScope> createState() => _MaterialScopeState();
}

class _MaterialScopeState extends State<MaterialScope> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
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
