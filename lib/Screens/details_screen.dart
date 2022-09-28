import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/ListView/cast_listview.dart';
import 'package:movie_app/Widgets/ListView/season_listview.dart';
import 'package:movie_app/Widgets/stack/imagedesign_stack.dart';
import 'package:movie_app/Widgets/loading.dart';
import '../Widgets/futureBuilder/category_futurebuilder.dart';
import '../Widgets/categorysection.dart';
import '../mixins/data.dart';
import '../providers/casts_provider.dart';
import '../providers/undetailedData_provider.dart';

abstract class DetailsScreen extends StatelessWidget with Data {
  final Future<dynamic> fetch;
  List<String> genres = [];
  DetailsScreen(this.fetch, {super.key});

  Widget buildImageSection(detailedData);

  Widget buildStorySection(context, detailedData) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Story",
        style: Theme.of(context).textTheme.subtitle2,
      ),
      const SizedBox(
        height: 16,
      ),
      Text(
        detailedData.overview,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    ]);
  }

  Widget buildOtherContents(context, detailedData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      builder: ((context, snapshot) {
        if (snapshot.connectionState==ConnectionState.waiting) {
          return const Loading();
        }
        return ListView(
          children: [
            buildImageSection(detailedData),
            buildOtherContents(context, detailedData)
          ],
        );
      }),
      future: fetch.then((value) {
        detailedData = value as dynamic;
        for (int i = 0; i < detailedData.genres.length; i++) {
          genres.add(detailedData.genres[i]["name"]);
        }
      }),
    ));
  }
}

class MovieDetailsScreen extends DetailsScreen {
  MovieDetailsScreen(super.fetch, {super.key});

  @override
  Widget buildImageSection(detailedData) {
    return SizedBox(
      height: 400,
      child: MovieImageEditingStack(detailedData, genres),
    );
  }

  Widget buildSimilarSection(context, detailedData) {
    return DataSection(
        "Similar",
        MoviesCategoryFutureBuilder(
            UnDetailedMovies.fetch("movie", "similar", detailedData.id)));
  }

  @override
  Widget buildOtherContents(context, detailedData) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(left: 24, top: 24, right: 24),
        child: buildStorySection(context, detailedData),
      ),
      CastListView(Casts.fetch(detailedData.id, "movie")),
      buildSimilarSection(context, detailedData)
    ]);
  }
}

class TVDetailsScreen extends DetailsScreen {
  TVDetailsScreen(super.fetch, {super.key});

  @override
  Widget buildImageSection(detailedData) {
    return SizedBox(
      height: 400,
      child: TvImageEditingStack(detailedData, genres),
    );
  }

  Widget buildSimilarSection(context, detailedData) {
    return DataSection("Similar",
        TvsCategoryFutureBuilder(UnDetailedTvs.fetch("tv", "similar", detailedData.id)));
  }

  @override
  Widget buildOtherContents(context, detailedData) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(left: 24, top: 24, right: 24),
        child: buildStorySection(context, detailedData),
      ),
      SeasonListView(detailedData.id, detailedData.seasons),
      buildSimilarSection(context, detailedData)
    ]);
  }
}
