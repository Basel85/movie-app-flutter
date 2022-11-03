import 'package:movie_app/constants/string_constants.dart';
import 'package:movie_app/data/apis/getter_api.dart';
import 'package:movie_app/data/models/undetailed_movie_model.dart';
import 'dart:convert';

class SearchedMoviesRepository{
  static Future<dynamic> fetch(name) async{
    final data = await GetterApi.getData("$apiDomain/search/movie?api_key=$apiKey&query=$name");
    final result  = json.decode(data) as Map<String,dynamic>;
    return result["results"].map((md)=>UnDetailedMovie.fromJson(md)).toList();
  }
}