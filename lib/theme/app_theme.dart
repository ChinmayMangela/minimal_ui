import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
    static final lightTheme = ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        scaffoldBackgroundColor: Colors.grey.shade100,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
            surface: Colors.grey.shade200,
            primary: Colors.white,
            secondary: Colors.black,
            tertiary: Colors.grey,
        ),
    );
}