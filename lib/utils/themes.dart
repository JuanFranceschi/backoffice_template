import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const themeColor = Color.fromARGB(255, 171, 104, 255);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.openSansTextTheme(),
  scaffoldBackgroundColor: const Color.fromARGB(255, 217, 220, 226),
  backgroundColor: const Color.fromARGB(255, 217, 220, 226),
  hintColor: const Color.fromARGB(255, 188, 192, 199),
  focusColor: themeColor,
  errorColor: const Color.fromARGB(255, 255, 104, 104),
  shadowColor: const Color.fromARGB(50, 102, 108, 114),
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 217, 220, 226),
    primaryContainer: Color.fromARGB(255, 224, 228, 234),
    secondaryContainer: Color.fromARGB(255, 218, 220, 228),
    tertiaryContainer: Color.fromARGB(255, 230, 232, 238),
    primary: Color.fromARGB(255, 41, 46, 51),
    secondary: Color.fromARGB(255, 154, 163, 172),
    shadow: Color.fromARGB(50, 102, 108, 114),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: themeColor,
      textStyle: const TextStyle(
        color: Color.fromARGB(255, 217, 220, 226),
      ),
    ),
  ),
  dataTableTheme: DataTableThemeData(
    headingRowColor: MaterialStateColor.resolveWith((states) {
      return const Color.fromARGB(255, 214, 218, 224);
    }),
    headingTextStyle: const TextStyle(
      color: Color.fromARGB(255, 41, 46, 51),
    ),
    dataTextStyle: const TextStyle(
      color: Color.fromARGB(255, 46, 50, 56),
    ),
    dataRowColor: MaterialStateColor.resolveWith((states) {
      return const Color.fromARGB(255, 230, 232, 238);
    }),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 52, 53, 65),
  textTheme: GoogleFonts.openSansTextTheme(),
  backgroundColor: const Color.fromARGB(255, 52, 53, 65),
  hintColor: const Color.fromARGB(255, 142, 142, 142),
  focusColor: themeColor,
  errorColor: const Color.fromARGB(255, 197, 64, 64),
  shadowColor: const Color.fromARGB(20, 233, 232, 232),
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 52, 53, 65),
    primaryContainer: Color.fromARGB(255, 42, 42, 52),
    secondaryContainer: Color.fromARGB(255, 32, 33, 35),
    tertiaryContainer: Color.fromARGB(255, 46, 46, 60),
    primary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 114, 114, 114),
    shadow: Color.fromARGB(20, 233, 232, 232),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: themeColor,
      textStyle: const TextStyle(
        color: Color.fromARGB(255, 217, 220, 226),
      ),
    ),
  ),
  dataTableTheme: DataTableThemeData(
    headingRowColor: MaterialStateColor.resolveWith((states) {
      return const Color.fromARGB(255, 32, 33, 35);
    }),
    headingTextStyle: const TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    dataTextStyle: const TextStyle(
      color: Color.fromARGB(255, 220, 220, 220),
    ),
    dataRowColor: MaterialStateColor.resolveWith((states) {
      return const Color.fromARGB(255, 46, 46, 60);
    }),
  ),
);
