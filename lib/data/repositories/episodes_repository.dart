import 'package:movie_app/constants/string_constants.dart';
import 'package:movie_app/data/apis/getter_api.dart';
import 'package:movie_app/data/models/episode_model.dart';
import 'dart:convert';

class EpisodesRepository {
  static Future<dynamic> fetch(id, seasonNumber) async {
    final data = await GetterApi.getData("$apiDomain/tv/$id/season/$seasonNumber?api_key=$apiKey");
    final result = json.decode(data) as Map<String, dynamic>;
    return result["episodes"].map((episode) => Episode.fromJson(episode)).toList();
  }
}
