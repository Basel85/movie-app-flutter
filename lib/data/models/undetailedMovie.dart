import 'package:flutter/material.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/constants.dart';
import '../apis/api.dart';
import 'dart:convert';

class UnDetailedMovie {
  late int id;
  late String title;
  late String image;
  late int voteCount;
  late double voteAverage;
  UnDetailedMovie(
      this.id, this.title, this.image, this.voteCount, this.voteAverage);
  UnDetailedMovie.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = imageDomain + json["poster_path"];
    voteCount = json["vote_count"];
    voteAverage = json["vote_average"].toDouble();
  }
}

class SimilarMovies with ChangeNotifier, PageLoading {
  List<dynamic> dataList = [];
  Future<void>? reset() {
    dataList = [];
    is_Loading = true;
    notifyListeners();
  }
  Future<dynamic> fetch(id) async {
    final data = await Api().getData("/movie/$id/similar?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    dataList = result["results"]
        .map((similarMovie) => UnDetailedMovie.fromJson(similarMovie))
        .toList();
    is_Loading = false;
    notifyListeners();
  }
}
