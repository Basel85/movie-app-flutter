import 'package:flutter/material.dart';
import 'package:movie_app/Classes/apiUrlSegments.dart';
import 'package:movie_app/Widgets/dataDisplaying.dart';
import 'package:movie_app/Widgets/upcomingMoviesCarousel.dart';
import 'package:movie_app/Widgets/dataCategory.dart';
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            UpcomingMovies(),
            DataCategory("Now Playing",new MoviesDisplaying("${ApiUrlSegments().domain}/movie/now_playing?api_key=${ApiUrlSegments().api_key}")),
            DataCategory("On TV",new TvsDisplaying("${ApiUrlSegments().domain}/tv/popular?api_key=${ApiUrlSegments().api_key}")),
            DataCategory("Popular Movies", new MoviesDisplaying("${ApiUrlSegments().domain}/movie/popular?api_key=${ApiUrlSegments().api_key}")),
          ],
        ),
      ),
    );
  }
}