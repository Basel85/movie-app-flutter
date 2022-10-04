import 'package:movie_app/data/apis/api.dart';
import 'package:movie_app/data/models/episode_model.dart';
import 'dart:convert';

class EpisodesRepository {
  static Future<dynamic> fetch(id, seasonNumber) async {
    final data = await Api.getData("/tv/$id/season/$seasonNumber?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    List<dynamic> x =
        result["episodes"].map((episode) => Episode.fromJson(episode)).toList();
    return x;
  }
}
