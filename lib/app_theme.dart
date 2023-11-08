import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      colorScheme: _colorScheme,
      textTheme: _myTextTheme,
      appBarTheme: AppBarTheme(color: _colorScheme.primary),
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _themeData().elevatedButtonTheme,
      textButtonTheme: _themeData().textButtonTheme,
      outlinedButtonTheme: _themeData().outlinedButtonTheme,
    );
  }

  TextTheme get _myTextTheme {
    return TextTheme(
      //... Your text theme styles here
    );
  }

  ColorScheme get _colorScheme {
    const primaryColor = Colors.blue;
    const secondaryColor = Colors.red;

    final seeds = FlexSchemeColor.from(
      primary: primaryColor,
      secondary: secondaryColor,
      brightness: Brightness.light,
    );

    final colors = FlexThemeData.light(
      useMaterial3: true,
      colors: seeds,
    ).colorScheme;

    return ColorScheme(
      //... Your color scheme styles here
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      //... Your button theme styles here
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      //... Your input field theme styles here
    );
  }
}