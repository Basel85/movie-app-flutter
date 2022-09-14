import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/dataListView/dataListView.dart';
import 'package:movie_app/Widgets/image/imageCarousel.dart';
import 'package:movie_app/Widgets/dataSection.dart';
import 'package:movie_app/providers/undetailedMovies_provider.dart';
import 'package:movie_app/providers/undetailedTvs_provider.dart';
import 'package:provider/provider.dart';

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
            UpcomingData("movie",Provider.of<UpcomingMovies>(context,listen: false),Provider.of<UpcomingMovies>(context)),
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataSection("Now Playing",MoviesListView("movie","now_playing",Provider.of<NowPlayingMovies>(context,listen: false),Provider.of<NowPlayingMovies>(context),null)),
                    DataSection("On TV", TvsListView("tv","popular",Provider.of<PopularTvs>(context,listen: false),Provider.of<PopularTvs>(context),null)),
                    DataSection("Popular Movies", MoviesListView("movie","popular",Provider.of<PopularMovies>(context,listen: false),Provider.of<PopularMovies>(context),null)),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
