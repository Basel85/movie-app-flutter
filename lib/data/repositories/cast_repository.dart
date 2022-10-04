import 'package:movie_app/data/apis/api.dart';
import 'package:movie_app/data/models/actor_model.dart';
import 'dart:convert';

class CastRepository {
  static Future<dynamic> fetch(id, type) async {
    final data = await Api.getData("/$type/$id/credits?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    return result["cast"].map((cast) => Actor.fromJson(cast)).toList();
  }
}