import 'package:movie_app/data/apis/api.dart';
import 'package:movie_app/data/models/detailed_movie_model.dart';
import 'package:movie_app/data/models/detailed_tv_model.dart';
import 'dart:convert';

class DetailedDataRepository{

  static Future<dynamic> fetch(id,type) async {
    final data = await Api.getData("/$type/$id?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    return result;
  }
}
class DetailedMoviesRepository{
  static Future<dynamic> fetch(id,type) async {
    final result = await DetailedDataRepository.fetch(id, type) as Map<String,dynamic>;
    return DetailedMovie.fromJson(result);
  }
}
class DetailedTvsRepository  extends DetailedDataRepository{
  static Future<dynamic> fetch(id,type) async {
    final result = await DetailedDataRepository.fetch(id, type) as Map<String,dynamic>;
    return DetailedTv.fromJson(result);
  }
}