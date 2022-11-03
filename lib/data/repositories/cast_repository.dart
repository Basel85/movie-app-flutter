import 'package:movie_app/constants/string_constants.dart';
import 'package:movie_app/data/apis/getter_api.dart';
import 'package:movie_app/data/models/actor_model.dart';
import 'dart:convert';

class CastRepository {
  static Future<dynamic> fetch(id, type) async {
    final result = await GetterApi.getData("$apiDomain/$type/$id/credits?api_key=$apiKey");
    final data = json.decode(result) as Map<String, dynamic>;
    return data["cast"].map((actor) => Actor.fromJson(actor)).toList();
  }
}