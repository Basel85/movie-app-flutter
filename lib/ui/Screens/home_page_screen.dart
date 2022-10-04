import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/data/repositories/undetailed_data_repository.dart';
import 'package:movie_app/providers/theme_mode_provider.dart';
import 'package:movie_app/statics/theme_mode_static.dart';
import 'package:movie_app/ui/Widgets/category_section.dart';
import 'package:movie_app/ui/Widgets/fetchers/category_fetcher.dart';
import 'package:movie_app/ui/Widgets/fetchers/upcoming_futurebuilder.dart';




class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text("Movie App", style: Theme.of(context).textTheme.subtitle2),
        actions: [
          Switch.adaptive(
            onChanged: (_) {
              Provider.of<Mode>(context, listen: false).changeMode();
            },
            value: ThemeModeStatic.value,
          ),
         ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            UpcomingFetcher(UnDetailedMoviesRepository.fetch("movie", "upcoming", null)),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DataSection(
                  "Now Playing",
                  MoviesCategoryFetcher(
                      UnDetailedMoviesRepository.fetch("movie", "now_playing", null))),
              DataSection("On TV",
                  TvsCategoryFetcher(UnDetailedTvsRepository.fetch("tv", "popular", null))),
              DataSection(
                  "Popular Movies",
                  MoviesCategoryFetcher(
                      UnDetailedMoviesRepository.fetch("movie", "popular", null))),
            ])
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}