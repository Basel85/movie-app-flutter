import 'package:movie_app/data/apis/api.dart';
import 'package:movie_app/data/models/undetailed_movie_model.dart';
import 'package:movie_app/data/models/undetailed_tv_model.dart';
import 'dart:convert';

abstract class UnDetailedDataRepository{
  static Future<dynamic> fetch(type,category, [id]) async {
    String idUrlSegment = "";
    if (id != null) {
      idUrlSegment = "$id/";
    }
    final data = await Api.getData("/$type/$idUrlSegment$category?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    return result;
  }
}
class UnDetailedMoviesRepository{
  static Future<dynamic> fetch(type,category, [id]) async {
    final result = await UnDetailedDataRepository.fetch(type, category,id) as Map<String,dynamic>;
    return result["results"]
        .map((md) => UnDetailedMovie.fromJson(md))
        .toList();
  }
}
class UnDetailedTvsRepository{
  static Future<dynamic> fetch(type,category, [id]) async {
    final result = await UnDetailedDataRepository.fetch(type, category,id) as Map<String,dynamic>;
    return result["results"].map((md) => UnDetailedTv.fromJson(md)).toList();
  }
}


