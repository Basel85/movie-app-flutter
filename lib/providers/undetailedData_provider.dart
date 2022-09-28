import 'package:movie_app/data/apis/api.dart';
import 'dart:convert';

import '../data/models/undetailedmovie_model.dart';
import '../data/models/undetailedtv_model.dart';

abstract class UnDetailedData{
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
class UnDetailedMovies{
  static Future<dynamic> fetch(type,category, [id]) async {
    final result = await UnDetailedData.fetch(type, category,id) as Map<String,dynamic>;
    return result["results"]
        .map((md) => UnDetailedMovie.fromJson(md))
        .toList();
  }
}
class UnDetailedTvs{
  static Future<dynamic> fetch(type,category, [id]) async {
    final result = await UnDetailedData.fetch(type, category,id) as Map<String,dynamic>;
    return result["results"].map((md) => UnDetailedTv.fromJson(md)).toList();
  }
}


