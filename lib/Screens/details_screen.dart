import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/dataListView/castListView.dart';
import 'package:movie_app/Widgets/dataListView/seasonListView.dart';
import 'package:movie_app/Widgets/image/imageDesign.dart';
import 'package:movie_app/Widgets/loading.dart';
import '../Widgets/dataListView/dataListView.dart';
import '../Widgets/dataSection.dart';
import '../mixins/Data.dart';
import '../mixins/pageLoading.dart';
import '../providers/casts_provider.dart';
import '../providers/undetailedData_provider.dart';

abstract class Details extends StatefulWidget {
  final Future<dynamic> fetch;
  List<String> categories = [];
  Details(this.fetch);

  Widget buildImageSection(detailedData);

  Widget buildStorySection(context,detailedData) {
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

  Widget buildOtherContents(context,detailedData);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with Data,PageLoading {
  @override
  void initState() {
    widget.fetch.then((value){
      setState(() {
        detailedData = value;
        isLoading=false;
        for(int i=0;i<detailedData.genres.length;i++){
          widget.categories.add(detailedData.genres[i]["name"]);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(is_Loading);
    return Scaffold(
      body: isLoading
          ? Loading()
          : ListView(
              children: [
                widget.buildImageSection(detailedData),
                widget.buildOtherContents(context,detailedData)
              ],
            ),
    );
  }
}

class MovieDetails extends Details {
  MovieDetails(super.fetch);


  Widget buildImageSection(detailedData) {
    return Container(
      height: 400,
      child: MovieImageEditing(
          detailedData, categories),
    );
  }

  @override
  Widget buildSimilarSection(context,detailedData) {
    return DataSection(
        "Similar",
        MoviesListView(UnDetailedMovies.fetch("movie","similar",detailedData.id)
    ));
  }

  Widget buildOtherContents(context,detailedData) {
    return Container(

      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(left: 24, top: 24,right: 24,bottom: 16),
          child: buildStorySection(context,detailedData),
        ),
        CastListView(Casts.fetch(detailedData.id, "movie")),
        buildSimilarSection(context,detailedData)
      ]),
    );
  }
}

class TVDetails extends Details {
  TVDetails(super.fetch);









  Widget buildImageSection(detailedData) {
    return Container(
      height: 400,
      child:
          TvImageEditing(detailedData, categories),
    );
  }

  @override
  Widget buildSimilarSection(context,detailedData) {
    return DataSection(
        "Similar",
        TvsListView(UnDetailedTvs.fetch("tv","similar",detailedData.id)
        ));
  }

  Widget buildOtherContents(context,detailedData) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(left: 24, top: 24,right: 24,bottom: 16),
          child: buildStorySection(context,detailedData),
        ),
        SeasonListView(detailedData.id,detailedData.seasons),
        buildSimilarSection(context,detailedData)
      ]),
    );
  }
}
