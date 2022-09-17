import 'dart:convert';

import '../data/apis/api.dart';
import '../data/models/detailedMovie.dart';
import '../data/models/detailedTv.dart';

class DetailedData{
  static void getData(Map<String, dynamic> result){}
  static Future<dynamic> fetch(id,type) async {
    final data = await Api.getData("/$type/$id?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    return result;
  }
}
class DetailedMovies{
  static Future<dynamic> fetch(id,type) async {
    final result = await DetailedData.fetch(id, type) as Map<String,dynamic>;
    return DetailedMovie.fromJson(result);
  }
}
class DetailedTvs extends DetailedData{
  static Future<dynamic> fetch(id,type) async {
    final result = await DetailedData.fetch(id, type) as Map<String,dynamic>;
    return DetailedTv.fromJson(result);
  }
}