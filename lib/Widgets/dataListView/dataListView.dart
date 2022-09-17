import 'package:flutter/material.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/Screens/details_screen.dart';
import 'package:movie_app/Widgets/card/card.dart';
import 'package:movie_app/Widgets/loading.dart';
import '../../mixins/Data.dart';
import '../../providers/detailedData_provider.dart';

abstract class DataListView extends StatefulWidget {
  final Future<dynamic> fetch;
  Widget makeCard(data, context);
  DataListView(this.fetch);
  @override
  _DataListViewState createState() => _DataListViewState();
}

class _DataListViewState extends State<DataListView> with Data,PageLoading {
  @override
  void initState() {
    widget.fetch.then((value){
      setState(() {
        undetailedData = value;
        isLoading=false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return isLoading
        ? Loading()
        : Container(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: undetailedData.length,
                itemBuilder: (BuildContext context, int index) =>
                    widget.makeCard(
                        undetailedData[index],
                        context)));
  }
}

class MoviesListView extends DataListView {
  MoviesListView(super.fetch);








  @override
  Widget makeCard(data, context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetails(
          DetailedMovies.fetch(data.id,"movie")))),
      child: WorkCard(
        data.image,
        data.title,
        data.voteAverage,
      ),
    );
  }
}

class TvsListView extends DataListView {
  TvsListView(super.fetch);

  @override
  Widget makeCard(data, context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TVDetails(DetailedTvs.fetch(data.id,"tv")))),
      child: WorkCard(
        data.image,
        data.name,
        data.voteAverage,
      ),
    );
  }
}
