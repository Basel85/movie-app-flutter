import 'package:flutter/material.dart';
import 'package:movie_app/Classes/data.dart';
import 'package:movie_app/Classes/fetcher.dart';
import 'package:movie_app/Classes/imageUrlSegments.dart';
import 'package:movie_app/Classes/pageLoading.dart';
import 'package:movie_app/Screens/Details.dart';
import 'package:movie_app/Widgets/card.dart';
import 'package:movie_app/Widgets/loading.dart';
abstract class DataDisplaying extends StatefulWidget with PageLoading,Data {
  final String apiUrl;

  Widget makeCard(data);

  DataDisplaying(this.apiUrl);

  @override
  _DataDisplayingState createState() => _DataDisplayingState();
}

class _DataDisplayingState extends State<DataDisplaying> {


  @override
  void initState() {
    Fetcher(widget.apiUrl).fetch().then((value) {
      setState(() {
        widget.dataInAList=value["results"];
        widget.is_Loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.is_Loading
        ? Loading()
        : Container(
        height: 300,
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.dataInAList.length,
        itemBuilder: (BuildContext context, int index)=>widget.makeCard(widget.dataInAList[index]))
    );}
}

class MoviesDisplaying extends DataDisplaying {
  MoviesDisplaying(super.apiUrl);

  @override
  Widget makeCard(data){
    return WorkCard(ImageUrlSegments().domain+data["poster_path"],data["original_title"], data["vote_average"],MovieDetails(data["id"],ImageUrlSegments().domain+data["poster_path"],"movie"));
  }
}

class TvsDisplaying extends DataDisplaying{
  TvsDisplaying(super.apiUrl);

  @override
  Widget makeCard(data) {
    return WorkCard(ImageUrlSegments().domain+data["poster_path"],data["original_name"], data["vote_average"],TVDetails(data["id"],ImageUrlSegments().domain+data["poster_path"],"tv"));
  }
}
