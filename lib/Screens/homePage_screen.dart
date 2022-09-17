import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/dataListView/dataListView.dart';
import 'package:movie_app/Widgets/image/imageCarousel.dart';
import 'package:movie_app/Widgets/dataSection.dart';
import '../providers/undetailedData_provider.dart';

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
            UpcomingData(UnDetailedMovies.fetch("movie", "upcoming",null)),
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataSection("Now Playing",MoviesListView(UnDetailedMovies.fetch("movie","now_playing",null))),
                    DataSection("On TV", TvsListView(UnDetailedTvs.fetch("tv","popular",null))),
                    DataSection("Popular Movies", MoviesListView(UnDetailedMovies.fetch("movie","popular",null))),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
