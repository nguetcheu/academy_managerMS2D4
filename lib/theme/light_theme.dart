import "package:flutter/material.dart";

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0C6170),
    brightness: Brightness.light,
    primary: const Color(0xFF0C6170),
    secondary: const Color(0xFFE9EDEC),
    background: const Color(0XFFF6F6F6),
    onBackground: const Color(0XFF000000),
    tertiary: const Color(0XFF707070),
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(fontWeight: FontWeight.w600),
  ),
);
