import 'package:flutter/material.dart';
import 'package:movie_app/data/repositories/undetailed_data_repository.dart';
import 'package:movie_app/interfaces/refresher.dart';
import 'package:movie_app/mixins/data.dart';
import 'package:movie_app/ui/Widgets/builders/cast_builder.dart';
import 'package:movie_app/ui/Widgets/builders/season_builder.dart';
import 'package:movie_app/ui/Widgets/builders/category_builder.dart';
import 'package:movie_app/ui/Widgets/fetchers/category_fetcher.dart';
import 'package:movie_app/ui/Widgets/imageEditing/image_editing.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/builders/story_builder.dart';
import 'package:movie_app/ui/Widgets/reload.dart';

abstract class DetailsFetcher extends StatefulWidget {
  final Future<dynamic> _fetch;
  DetailsFetcher(this._fetch, {super.key});
  List<dynamic> genres = [];
  Widget buildImageSection(detailedData);

  Widget buildOtherContents(detailedData);

  @override
  State<DetailsFetcher> createState() => _DetailsFetcherState();
}

class _DetailsFetcherState extends State<DetailsFetcher>
    with Data {
  @override
  Widget build(BuildContext context) {
    detailedData = null;
    widget.genres = [];
    print("I got u ,homie");
    return FutureBuilder(
        builder: ((context, snapshot) {
          print(detailedData);
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("Hello");
            return const Loading();
          }
          if (snapshot.hasError) {
            return Reload(snapshot.error.toString());
          }
          detailedData = snapshot.data as dynamic;
          for (int i = 0; i < detailedData.genres.length; i++) {
            widget.genres.add(detailedData.genres[i]["name"]);
          }
          return ListView(
            children: [
              widget.buildImageSection(detailedData),
              widget.buildOtherContents(detailedData)
            ],
          );
        }),
        future: widget._fetch);
  }

  
}

class MovieDetailsFetcher extends DetailsFetcher {
  MovieDetailsFetcher(super.fetch, {super.key});

  @override
  Widget buildImageSection(detailedData) {
    return SizedBox(
      height: 400,
      child: MovieImageEditing(detailedData, genres),
    );
  }

  @override
  Widget buildOtherContents(detailedData) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      StoryBuilder(detailedData),
      CastBuilder(detailedData.id),
      CategoryBuilder(
          "Similar",
          MoviesCategoryFetcher(UnDetailedMoviesRepository.fetch(
              "movie", "similar", detailedData.id))),
    ]);
  }
}

class TVDetailsFetcher extends DetailsFetcher {
  TVDetailsFetcher(super.fetch, {super.key});

  @override
  Widget buildImageSection(detailedData) {
    return SizedBox(
      height: 400,
      child: TvImageEditing(detailedData, genres),
    );
  }

  @override
  Widget buildOtherContents(detailedData) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      StoryBuilder(detailedData),
      SeasonBuilder(detailedData.id, detailedData.seasons),
      CategoryBuilder(
          "Similar",
          TvsCategoryFetcher(
              UnDetailedTvsRepository.fetch("tv", "similar", detailedData.id))),
    ]);
  }
}
