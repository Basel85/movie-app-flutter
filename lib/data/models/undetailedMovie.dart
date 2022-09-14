import 'package:flutter/material.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/constants.dart';
import '../apis/api.dart';
import 'dart:convert';

class UnDetailedMovie {
  late int id;
  late String title;
  late String? image;
  late int voteCount;
  late double voteAverage;
  UnDetailedMovie(
      this.id, this.title, this.image, this.voteCount, this.voteAverage);
  UnDetailedMovie.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = json["poster_path"]==null?null:imageDomain + json["poster_path"];
    voteCount = json["vote_count"];
    voteAverage = json["vote_average"].toDouble();
  }
}
