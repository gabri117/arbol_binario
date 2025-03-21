import 'package:arbol_binario/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'presentation/pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      home: HomePage(),
    );
  }
}