import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color _iconColor = Colors.red.shade200;

  ///light Mode
  ///Colors for light Mode
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVariantColor = Colors.white;
  static const Color _lightSecondaryColor = Colors.black;
  static const Color _lightOnPrimaryColor = Colors.black;

  ///TextStyle for light Mode
  static final TextStyle _lightHeadingTextStyle = TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500, color: _lightOnPrimaryColor);
  static final TextStyle _lightTaskNameTextStyle = TextStyle(fontSize: 18.0, color: _lightOnPrimaryColor);
  static final TextStyle _lightTaskDurationTextStyle = TextStyle(fontSize: 16.0, color: Colors.grey);

  ///light Mode Theme Modifying
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightPrimaryVariantColor,
      appBarTheme: AppBarTheme(
        color: _lightPrimaryVariantColor,
        iconTheme: IconThemeData(
            color: _lightOnPrimaryColor
        ),
      ),
      colorScheme: ColorScheme.light(
          primary: _lightPrimaryColor,
          secondary: _lightSecondaryColor,
          onPrimary: _lightOnPrimaryColor,
          primaryVariant: _lightPrimaryVariantColor
      ),
      iconTheme: IconThemeData(
          color: _iconColor
      ),
      textTheme: _lightTextTheme
  );

  static final TextTheme _lightTextTheme = TextTheme(
      headline1: _lightHeadingTextStyle,
      bodyText1: _lightTaskNameTextStyle,
      bodyText2: _lightTaskDurationTextStyle
  );


  ///Dark Mode
  ///Colors for Dark Mode
  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  ///TextStyle for Dark Mode
  static final TextStyle _darkHeadingTextStyle = _lightHeadingTextStyle.copyWith(fontWeight: FontWeight.bold, color: _darkOnPrimaryColor);
  static final TextStyle _darkTaskNameTextStyle = _lightTaskNameTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkTaskDurationTextStyle = _lightTaskDurationTextStyle;

  ///Dark Mode Theme Modifying
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryVariantColor,
      appBarTheme: AppBarTheme(
        color: _darkPrimaryVariantColor,
        iconTheme: IconThemeData(
            color: _darkOnPrimaryColor
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: _darkPrimaryColor,
        primaryVariant: _darkPrimaryVariantColor,
        secondary: _darkSecondaryColor,
        onPrimary: _darkOnPrimaryColor,
      ),
      iconTheme: IconThemeData(
          color: _iconColor
      ),
      textTheme: _darkTextTheme
  );

  static final TextTheme _darkTextTheme = TextTheme(
      headline1: _darkHeadingTextStyle,
      bodyText1: _darkTaskNameTextStyle,
      bodyText2: _darkTaskDurationTextStyle
  );
}