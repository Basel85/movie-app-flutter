import 'package:flutter/material.dart';
import 'package:movie_app/data/repositories/undetailed_data_repository.dart';
import 'package:movie_app/interfaces/refresher.dart';
import 'package:movie_app/ui/Widgets/builders/category_builder.dart';
import 'package:movie_app/ui/Widgets/fetchers/category_fetcher.dart';
import 'package:movie_app/ui/Widgets/fetchers/upcoming_fetcher.dart';

class HomePageListView extends StatefulWidget {
  const HomePageListView({super.key});

  @override
  State<HomePageListView> createState() => _HomePageListViewState();
}

class _HomePageListViewState extends State<HomePageListView> implements Refresher {
  @override
  Widget build(BuildContext context) {
    print("Surprise isn't it");
    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView(
        children: [
          UpcomingFetcher(
              UnDetailedMoviesRepository.fetch("movie", "upcoming", null)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CategoryBuilder(
                "Now Playing",
                MoviesCategoryFetcher(UnDetailedMoviesRepository.fetch(
                    "movie", "now_playing", null))),
            CategoryBuilder(
                "On TV",
                TvsCategoryFetcher(
                    UnDetailedTvsRepository.fetch("tv", "popular", null))),
            CategoryBuilder(
                "Popular Movies",
                MoviesCategoryFetcher(UnDetailedMoviesRepository.fetch(
                    "movie", "popular", null))),
          ])
        ],
      ),
    );
  }

  @override
  Future<void> refresh() async {
    setState(() {});
  }
}
