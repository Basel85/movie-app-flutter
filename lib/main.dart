import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/providers/searchMovies_provider.dart';
import 'package:provider/provider.dart';
import 'Screens/homePage_screen.dart';
import 'Screens/search_screen.dart';

void main() {
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider<MoviesSearch>(create: (_)=>MoviesSearch())
  ],child: const MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageController _pageController;
  int currentIndex=0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }
  void onItemTapped(currentIndex){
    _pageController.jumpToPage(currentIndex);
  }
  void onPageChanged(index){
    setState(() {
      currentIndex=index;
    });
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomNavigationBarItemScreens = [MyHomePage(),Search()];
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
      home:Scaffold(
        body: PageView(
          onPageChanged: onPageChanged,
          controller: _pageController,
          children: bottomNavigationBarItemScreens,

        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTapped,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xffef322c),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search,),label: "Search")
          ],
        ),
      ),
    );
  }
}
