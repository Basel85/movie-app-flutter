import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/dataListView/dataListView.dart';
import 'package:movie_app/Widgets/image/imageCarousel.dart';
import 'package:movie_app/Widgets/dataSection.dart';
import '../providers/undetailedData_provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            UpcomingData(UnDetailedMovies.fetch("movie", "upcoming",null)),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataSection("Now Playing",MoviesListView(UnDetailedMovies.fetch("movie","now_playing",null))),
                  DataSection("On TV", TvsListView(UnDetailedTvs.fetch("tv","popular",null))),
                  DataSection("Popular Movies", MoviesListView(UnDetailedMovies.fetch("movie","popular",null))),
                ])
          ],
        ),
      ),

    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
