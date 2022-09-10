import 'package:flutter/material.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/constants.dart';
import '../apis/api.dart';
import 'dart:convert';
class UnDetailedTv {
  late int id;
  late String name;
  late String image;
  late int voteCount;
  late double voteAverage;
  UnDetailedTv(this.id,this.name, this.image, this.voteCount, this.voteAverage);
  UnDetailedTv.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = imageDomain + json["poster_path"];
    voteCount = json["vote_count"];
    voteAverage = json["vote_average"].toDouble();
  }
}