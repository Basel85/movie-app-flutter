import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Screens/homePage_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            brightness: Brightness.light,
            primary: const Color(0xffef322c),
            secondary: const Color(0xff272b30),
            tertiary: const Color(0xffee8b60),
            background: Colors.white
          ),
          textTheme: TextTheme(
            headline1: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color(0xff686b6e))),
            headline2: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xff1a1d1f))),
            headline3: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xff686b6e)),
            ),
            subtitle1: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xff686b6e)),
            ),
            subtitle2: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff1a1d1f)),
            ),
            bodyText1: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff686b6e)),
            ),
            bodyText2: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff1a1d1f)),
            ),
          )),
      home: MyHomePage(),
    );
  }
}
