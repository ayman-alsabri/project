import 'package:flutter/material.dart';

class MyAppTheme {
  static final lightTheme = ThemeData(
      fontFamily: 'Cairo',
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color.fromARGB(255, 219, 229, 247),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF80A1FF),
          onPrimary: Color(0xFFE5EEFD),
          secondary: Color.fromRGBO(169, 183, 209, 1),
          onSecondary: Color.fromARGB(255, 255, 255, 255),
          tertiary: Color(0xffE4EDFC),
          onTertiary: Color(0xffA3B5CD),
          error: Colors.red,
          onError: Color(0xFFE5EEFD),
          surface: Color(0xFFD4E0F6),
          onSurface: Color(0xFF80A1FF),
          shadow: Color.fromARGB(137, 219, 228, 243)));

  static final darkTheme = ThemeData(
      fontFamily: 'Cairo',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF24272C),
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFFEE4E12),
          onPrimary: Color(0xFFFFFEFA),
          tertiary: Color(0xff1D2025),
          onTertiary: Color(0xff808388),
          secondary: Color(0xFF111216),
          onSecondary: Color(0xFF333A42),
          error: Colors.red,
          onError: Color(0xFFE5EEFD),
          surface: Color(0xFF17181C),
          onSurface: Color(0xFFEE4E12),
          shadow: Color(0x881F2427)));

  // ThemeData(
  //   scaffoldBackgroundColor:  const Color(0xFFE5EEFD),
  //     colorScheme: const ColorScheme(
  //         brightness: Brightness.light,
  //         primary: Color(0xFFEE4E12),
  //         onPrimary: Color(0xFFE5EEFD),
  //         secondary: Color(0xffC1A2D4),
  //         onSecondary: Color(0xFFE5EEFD),
  //         error: Color.fromARGB(255, 177, 17, 5),
  //         onError: Color(0xFFE5EEFD),
  //         surface: Color(0xFFE5EEFD),
  //         onSurface: Color(0xFFEE4E12)));
}
