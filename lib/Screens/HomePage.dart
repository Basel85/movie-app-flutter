import 'package:flutter/material.dart';
import 'package:movie_app/Classes/apiUrlSegments.dart';
import 'package:movie_app/Widgets/dataListView/dataListView.dart';
import 'package:movie_app/Widgets/image/imageCarousel.dart';
import 'package:movie_app/Widgets/dataSection.dart';
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
            Container(padding: const EdgeInsets.only(left: 8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              DataSection("Now Playing",new MoviesListView("${ApiUrlSegments().domain}/movie/now_playing?api_key=${ApiUrlSegments().api_key}")),
              DataSection("On TV",new TvsListView("${ApiUrlSegments().domain}/tv/popular?api_key=${ApiUrlSegments().api_key}")),
              DataSection("Popular Movies", new MoviesListView("${ApiUrlSegments().domain}/movie/popular?api_key=${ApiUrlSegments().api_key}")),
            ]),
            )
          ],
        ),
      ),
    );
  }
}