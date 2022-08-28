import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/Classes/apiUrlSegments.dart';
import 'package:movie_app/Classes/data.dart';
import 'package:movie_app/Classes/fetcher.dart';
import 'package:movie_app/Classes/pageLoading.dart';
import 'package:movie_app/Screens/Details.dart';
import 'package:movie_app/Widgets/image/imageDesign.dart';
import 'package:movie_app/Widgets/loading.dart';
class UpcomingMovies extends StatefulWidget with Data,PageLoading{
  @override
  State<UpcomingMovies> createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMovies> {
  @override
  void initState() {
    Fetcher("${ApiUrlSegments().domain}/movie/upcoming?api_key=${ApiUrlSegments().api_key}").fetch().then((value){
      setState(() {
        widget.dataInAList=value["results"];
        widget.is_Loading=false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.is_Loading?Loading():CarouselSlider(options: CarouselOptions(
      height: 400,
      viewportFraction: 1,
    ), items: widget.dataInAList.map((movie) {
      return GestureDetector(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetails(movie["id"],"movie")),),
      child: CarouselImageEditing(movie, "Action • Drama • Adventure"),
    );
    },).toList());
  }
}
