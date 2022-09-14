import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/dataListView/castListView.dart';
import 'package:movie_app/Widgets/dataListView/seasonListView.dart';
import 'package:movie_app/Widgets/image/imageDesign.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/providers/undetailedMovies_provider.dart';
import 'package:provider/provider.dart';
import '../Widgets/dataListView/dataListView.dart';
import '../Widgets/dataSection.dart';
import '../mixins/Data.dart';
import '../mixins/pageLoading.dart';
import '../providers/undetailedTvs_provider.dart';

abstract class Details extends StatefulWidget with Data {
  final provider;

  final id;
  final type;
  List<String> Categories = [];

  Details(this.provider,this.id,this.type);

  Widget buildImageSection();

  // Widget buildSimilarSection(context);

  Widget buildStorySection(context) {
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

  Widget buildOtherContents(context);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with PageLoading {
  @override
  void initState() {
    widget.provider(context,listen : false).fetch(widget.type,widget.id).then((_){
      is_Loading=false;
      widget.detailedData = widget.provider(context).detailedData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(context);
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
  MovieDetails(super.provider, super.id, super.type);


  Widget buildImageSection() {
    return Container(
      height: 400,
      child: MovieImageEditing(
          detailedData, Categories),
    );
  }

  @override
  Widget buildSimilarSection(context) {
    return DataSection(
        "Similar",
        MoviesListView("movie","similar",
        Provider.of<SimilarMovies>(context,
            listen: false),Provider.of<SimilarMovies>(context),detailedData.id
    ));
  }

  Widget buildOtherContents(context) {
    return Container(

      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(left: 24, top: 24,right: 24,bottom: 16),
          child: buildStorySection(context),
        ),
        CastListView(detailedData.id, "movie"),
        buildSimilarSection(context)
      ]),
    );
  }
}

class TVDetails extends Details {
  TVDetails(super.provider, super.id, super.type);





  Widget buildImageSection() {
    return Container(
      height: 400,
      child:
          TvImageEditing(detailedData, Categories),
    );
  }

  @override
  Widget buildSimilarSection(context) {
    return DataSection(
        "Similar",
        TvsListView("tv","similar",
        Provider.of<SimilarTvs>(context,
        listen: false),Provider.of<SimilarTvs>(context),detailedData.id
        ));
  }

  Widget buildOtherContents(context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(left: 24, top: 24,right: 24,bottom: 16),
          child: buildStorySection(context),
        ),
        SeasonListView(detailedData.id,detailedData.seasons),
        buildSimilarSection(context)
      ]),
    );
  }
}
