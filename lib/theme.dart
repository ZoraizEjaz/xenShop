import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors_constants.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
  primaryColorDark: primaryColorDark,
  primaryColorLight: primaryColorLight,
  primaryColor: primaryColorDark,
  scaffoldBackgroundColor: Colors.white,
  textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryColorDark,
      selectionColor: primaryColorDark,
      selectionHandleColor: primaryColorDark
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    focusColor: primaryColorDark,
    floatingLabelStyle: const TextStyle(color: primaryColorDark),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: blueGradientFirstColor),
    ),
  ),
);