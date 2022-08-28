import 'package:flutter/material.dart';
import 'package:movie_app/Classes/apiUrlSegments.dart';
import 'package:movie_app/Classes/data.dart';
import 'package:movie_app/Classes/fetcher.dart';
import 'package:movie_app/Classes/pageLoading.dart';
import 'package:movie_app/Widgets/dataListView/castListView.dart';
import 'package:movie_app/Widgets/dataSection.dart';
import 'package:movie_app/Widgets/dataListView/dataListView.dart';
import 'package:movie_app/Widgets/image/imageDesign.dart';
import 'package:movie_app/Widgets/loading.dart';

abstract class Details extends StatefulWidget with PageLoading, Data {
  final _id;
  final _type;
  List<String> Categories = [];
  Details(this._id, this._type);
  Widget buildImageSection();
  Widget buildSimilarSection();
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
        dataInAMap["overview"],
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
    Fetcher("${ApiUrlSegments().domain}/${widget._type}/${widget._id}?api_key=${ApiUrlSegments().api_key}")
        .fetch()
        .then((Value) {
      setState(() {
        widget.dataInAMap = Value;
        for (var category in widget.dataInAMap["genres"]) {
          widget.Categories.add(category["name"]);
        }
        widget.is_Loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.is_Loading
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
  MovieDetails(super.id, super.type);
  Widget buildImageSection() {
    return Container(
      height: 400,
      child: MovieImageEditing(dataInAMap, Categories),
    );
  }

  @override
  Widget buildSimilarSection() {
    return DataSection(
        "Similar",
        new MoviesListView(
            "${ApiUrlSegments().domain}/${_type}/${_id}/similar?api_key=${ApiUrlSegments().api_key}"));
  }

  Widget buildOtherContents(context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        buildStorySection(context),
        const SizedBox(
          height: 24,
        ),
        CastListView(_id, _type),
        buildSimilarSection()
      ]),
    );
  }
}

class TVDetails extends Details {
  TVDetails(super.id, super.type);

  Widget buildImageSection() {
    return Container(
      height: 400,
      child: TvImageEditing(dataInAMap, Categories),
    );
  }

  @override
  Widget buildSimilarSection() {
    return DataSection(
        "Similar",
        new TvsListView(
            "${ApiUrlSegments().domain}/${_type}/${_id}/similar?api_key=${ApiUrlSegments().api_key}"));
  }

  Widget buildOtherContents(context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        buildStorySection(context),
        const SizedBox(
          height: 24,
        ),
        buildSimilarSection()
      ]),
    );
  }
}
