import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/dataListView/castListView.dart';
import 'package:movie_app/Widgets/dataListView/seasonListView.dart';
import 'package:movie_app/Widgets/dataSection.dart';
import 'package:movie_app/Widgets/dataListView/dataListView.dart';
import 'package:movie_app/Widgets/image/imageDesign.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/data/models/undetailedMovie.dart';
import 'package:provider/provider.dart';
import '../data/models/undetailedTv.dart';

abstract class Details extends StatefulWidget {
  final providerWithNoListening;
  final providerWithListening;
  final id;
  List<String> Categories = [];

  Details(this.providerWithNoListening, this.providerWithListening,this.id);

  Widget buildImageSection();

  // Widget buildSimilarSection(context);

  Widget buildStorySection(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Story",
        style: Theme.of(context).textTheme.subtitle2,
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        providerWithListening.detailedData.overview,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    ]);
  }

  Widget buildOtherContents(context);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    widget.providerWithNoListening.fetch(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.providerWithListening.is_Loading
          ? Loading()
          : ListView(
              children: [
                widget.buildImageSection(),
                widget.buildOtherContents(context)
              ],
            ),
    );
  }
}

class MovieDetails extends Details {
  MovieDetails(super.providerWithNoListening, super.providerWithListening,super.id);

  Widget buildImageSection() {
    return Container(
      height: 400,
      child: MovieImageEditing(
          super.providerWithListening.detailedData, Categories),
    );
  }

  // @override
  // Widget buildSimilarSection(context) {
  //   return DataSection(
  //       "Similar",
  //       MoviesListView(
  //           Provider.of<SimilarMovies>(context,
  //               listen: false)
  //               ));
  // }

  Widget buildOtherContents(context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        buildStorySection(context),
        const SizedBox(
          height: 24,
        ),
        CastListView(super.providerWithListening.detailedData.id, "movie"),
        // buildSimilarSection(context)
      ]),
    );
  }
}

class TVDetails extends Details {
  TVDetails(super.providerWithNoListening, super.providerWithListening,super.id);

  Widget buildImageSection() {
    return Container(
      height: 400,
      child:
          TvImageEditing(super.providerWithListening.detailedData, Categories),
    );
  }

  // @override
  // Widget buildSimilarSection(context) {
  //   return DataSection(
  //       "Similar",
  //       TvsListView(
  //       Provider.of<SimilarTvs>(context,
  //       listen: false)
  //       ));
  // }

  Widget buildOtherContents(context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 24, right: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        buildStorySection(context),
        const SizedBox(
          height: 24,
        ),
        SeasonListView(super.providerWithListening.detailedData.seasons),
        // buildSimilarSection(context)
      ]),
    );
  }
}
