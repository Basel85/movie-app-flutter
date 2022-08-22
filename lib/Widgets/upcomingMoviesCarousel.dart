import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/Classes/apiUrlSegments.dart';
import 'package:movie_app/Classes/data.dart';
import 'package:movie_app/Classes/fetcher.dart';
import 'package:movie_app/Classes/imageUrlSegments.dart';
import 'package:movie_app/Classes/pageLoading.dart';
import 'package:movie_app/Screens/Details.dart';
import 'package:movie_app/Widgets/infoInsideImage.dart';
import 'dart:convert';

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
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetails(movie["id"],ImageUrlSegments().domain+movie["poster_path"],"movie")),),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(ImageUrlSegments().domain+movie["poster_path"],),
              ),
            ),
            width: double.infinity,
          ),
          Align(
            alignment: AlignmentDirectional(0, 1),
            child: Container(
              width: double.infinity,
              height: 200,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Theme.of(context).colorScheme.background
                  ],
                  stops: [0, 1],
                  begin:
                  AlignmentDirectional(0, -1),
                  end: AlignmentDirectional(0, 1),
                ),
              ),
              child: InfoInsideImage(movie["original_title"],"Action • Drama • Adventure",movie["vote_average"],movie["vote_count"]),
            ),
          ),
        ],
      ),
    );
    },).toList());
  }
}
