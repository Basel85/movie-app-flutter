import 'package:flutter/material.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/data/apis/api.dart';
import 'dart:convert';

class DetailedMovie {
  late int id;
  late String title;
  late String image;
  late int voteCount;
  late double voteAverage;
  late String releaseDate;
  late List<dynamic> genres;
  late String overview;
  DetailedMovie(this.title, this.image, this.voteCount, this.voteAverage,
      this.releaseDate, this.genres, this.overview);
  DetailedMovie.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = imageDomain + json["poster_path"];
    voteCount = json["vote_count"];
    voteAverage = json["vote_average"];
    releaseDate = json["release_date"];
    genres = json["genres"];
    overview = json["overview"];
  }
}

class DetailedMovies with ChangeNotifier, PageLoading {
  DetailedMovie detailedData = DetailedMovie("", "", 0, 0.0, "", [], "");

  Future<void>? reset() {
    detailedData = DetailedMovie("", "", 0, 0.0, "", [], "");
    is_Loading = true;
    notifyListeners();
  }

  Future<void> fetch(id) async {
    final data = await Api().getData("/movie/$id?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    detailedData = DetailedMovie.fromJson(result);
    is_Loading = false;
    notifyListeners();
  }
}
