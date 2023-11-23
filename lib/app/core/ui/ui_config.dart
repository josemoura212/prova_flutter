import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get tittle => "Prova Flutter";

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      );
}
