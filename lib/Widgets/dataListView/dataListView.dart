import 'package:flutter/material.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/Screens/Details.dart';
import 'package:movie_app/Widgets/card/card.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/data/models/detailedMovie.dart';
import 'package:movie_app/data/models/undetailedMovie.dart';
import 'package:movie_app/providers/undetailedData_provider.dart';
import 'package:provider/provider.dart';

import '../../data/models/detailedTv.dart';

abstract class DataListView extends StatefulWidget {
  final type;
  final category;
  final providerWithNoListening;
  final providerWithListening;
  Widget makeCard(data, context);
  DataListView(this.type,this.category,this.providerWithNoListening,this.providerWithListening);
  @override
  _DataListViewState createState() => _DataListViewState();
}

class _DataListViewState extends State<DataListView> {
  @override
  void initState() {
    widget.providerWithNoListening.fetch(widget.type,widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.providerWithListening.is_Loading
        ? Loading()
        : Container(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.providerWithListening.dataList.length,
                itemBuilder: (BuildContext context, int index) =>
                    widget.makeCard(
                        widget.providerWithListening.dataList[index],
                        context)));
  }
}

class MoviesListView extends DataListView {
  MoviesListView(super.type, super.category, super.providerWithNoListening, super.providerWithListening);


  

  @override
  Widget makeCard(data, context) {
    return WorkCard(
        data.image,
        data.title,
        data.voteAverage,
        MovieDetails(Provider.of<DetailedMovies>(context, listen: false),
            Provider.of<DetailedMovies>(context), data.id));
  }
}

class TvsListView extends DataListView {
  TvsListView(super.type, super.category, super.providerWithNoListening, super.providerWithListening);

  @override
  Widget makeCard(data, context) {
    return WorkCard(
        data.image,
        data.name,
        data.voteAverage,
        TVDetails(Provider.of<DetailedTvs>(context, listen: false),
            Provider.of<DetailedTvs>(context), data.id));
  }
}
