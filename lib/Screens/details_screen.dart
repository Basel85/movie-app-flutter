import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/dataListView/castListView.dart';
import 'package:movie_app/Widgets/dataListView/seasonListView.dart';
import 'package:movie_app/Widgets/image/imageDesign.dart';
import 'package:movie_app/Widgets/loading.dart';
import '../mixins/Data.dart';
import '../mixins/pageLoading.dart';

abstract class Details extends StatefulWidget with Data {
  final providerWithNoListening;
  final providerWithListening;
  final id;
  final type;
  List<String> Categories = [];

  Details(this.providerWithNoListening, this.providerWithListening,this.id,this.type);

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
        detailedData.overview,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    ]);
  }

  Widget buildOtherContents(context);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with PageLoading {
  @override
  void initState() {
    widget.providerWithNoListening.fetch(widget.type,widget.id).then((_){
      is_Loading=false;
      print("NNNN");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.detailedData = widget.providerWithListening.detailedData;
    print(widget.detailedData);
    return Scaffold(
      body: is_Loading
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
  MovieDetails(super.providerWithNoListening, super.providerWithListening, super.id, super.type);



  Widget buildImageSection() {
    return Container(
      height: 400,
      child: MovieImageEditing(
          detailedData, Categories),
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
        CastListView(detailedData.id, "movie"),
        // buildSimilarSection(context)
      ]),
    );
  }
}

class TVDetails extends Details {
  TVDetails(super.providerWithNoListening, super.providerWithListening, super.id, super.type);



  Widget buildImageSection() {
    return Container(
      height: 400,
      child:
          TvImageEditing(detailedData, Categories),
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
        SeasonListView(detailedData.id,detailedData.seasons),
        // buildSimilarSection(context)
      ]),
    );
  }
}
