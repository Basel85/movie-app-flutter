import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/providers/theme_mode_provider.dart';
import 'package:movie_app/statics/theme_mode_static.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ui/Screens/home_page_screen.dart';

Future<bool> getMode() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool("darkMode") ?? false;
}

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Mode>(create: (_) => Mode()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool valueGot = false;
  bool isRebuiltFromRoot = true;

  @override
  Widget build(BuildContext context) {
    
    return Consumer<Mode>(
      builder: (context, mode, _) {
        if (valueGot && !isRebuiltFromRoot) {
          ThemeModeStatic.value = !ThemeModeStatic.value;
        }
        isRebuiltFromRoot = false;
        return FutureBuilder(
          builder: ((context, snapShot) {
            if (!snapShot.hasData) {
              return const Loading();
            }
            if (!valueGot) {
              ThemeModeStatic.value = snapShot.data as bool;
            }
            valueGot = true;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.red,
                      brightness: !ThemeModeStatic.value
                          ? Brightness.light
                          : Brightness.dark,
                      primary: const Color(0xffef322c),
                      secondary: const Color(0xff272b30),
                      tertiary: const Color(0xffee8b60),
                      background: !ThemeModeStatic.value
                          ? Colors.white
                          : const Color(0xff1a1d1f)),
                  textTheme: TextTheme(
                    headline1: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: !ThemeModeStatic.value
                                ? const Color(0xff686b6e)
                                : const Color(0xffa9aaa6))),
                    headline2: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: !ThemeModeStatic.value
                                ? const Color(0xff1a1d1f)
                                : Colors.white)),
                    headline3: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: !ThemeModeStatic.value
                              ? const Color(0xff686b6e)
                              : const Color(0xffa9aaa6)),
                    ),
                    subtitle1: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: !ThemeModeStatic.value
                              ? const Color(0xff686b6e)
                              : const Color(0xffa9aaa6)),
                    ),
                    subtitle2: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: !ThemeModeStatic.value
                              ? const Color(0xff1a1d1f)
                              : Colors.white),
                    ),
                    bodyText1: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: !ThemeModeStatic.value
                              ? const Color(0xff686b6e)
                              : const Color(0xffa9aaa6)),
                    ),
                    bodyText2: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: !ThemeModeStatic.value
                              ? const Color(0xff1a1d1f)
                              : Colors.white),
                    ),
                  )),
              home: const Scaffold(
                body:  HomePageScreen()
              ),
            );
          }),
          future: !valueGot ? getMode() : null,
        );
      },
    );
  }
}
