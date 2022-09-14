import 'package:flutter/material.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/Screens/details_screen.dart';
import 'package:movie_app/Widgets/card/card.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../mixins/Data.dart';
import '../../providers/detailedData_provider.dart';

abstract class DataListView extends StatefulWidget with Data {
  final type;
  final category;
  final providerWithNoListening;
  final providerWithListening;
  Widget makeCard(data, context);
  DataListView(this.type,this.category,this.providerWithNoListening,this.providerWithListening);
  @override
  _DataListViewState createState() => _DataListViewState();
}

class _DataListViewState extends State<DataListView> with PageLoading {

  @override
  void initState() {
    widget.providerWithNoListening.fetch(widget.type,widget.category).then((_)=> is_Loading=false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.undetailedData = widget.providerWithListening.dataList;
    return is_Loading
        ? Loading()
        : Container(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.undetailedData.length,
                itemBuilder: (BuildContext context, int index) =>
                    widget.makeCard(
                        widget.undetailedData[index],
                        context)));
  }
}

class MoviesListView extends DataListView {
  MoviesListView(super.type, super.category, super.providerWithNoListening, super.providerWithListening);


  

  @override
  Widget makeCard(data, context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetails(
          Provider.of<DetailedMovies>(context, listen: false),
          Provider.of<DetailedMovies>(context),
          data.id,"movie"))),
      child: WorkCard(
        data.image,
        data.title,
        data.voteAverage,
      ),
    );
  }
}

class TvsListView extends DataListView {
  TvsListView(super.type, super.category, super.providerWithNoListening, super.providerWithListening);

  @override
  Widget makeCard(data, context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TVDetails(Provider.of<DetailedTvs>(context, listen: false),
          Provider.of<DetailedTvs>(context), data.id,"tv"))),
      child: WorkCard(
        data.image,
        data.name,
        data.voteAverage,
      ),
    );
  }
}
