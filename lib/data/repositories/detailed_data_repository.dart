import 'package:movie_app/constants/string_constants.dart';
import 'package:movie_app/data/apis/getter_api.dart';
import 'package:movie_app/data/models/detailed_movie_model.dart';
import 'package:movie_app/data/models/detailed_tv_model.dart';
import 'dart:convert';

class DetailedDataRepository{
  static Future<dynamic> fetch(id,type) async {
    final data = await GetterApi.getData("$apiDomain/$type/$id?api_key=$apiKey");
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