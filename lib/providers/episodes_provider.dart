import 'dart:convert';
import 'package:movie_app/data/models/episode.dart';
import '../data/apis/api.dart';
class Episodes{
  static Future<void> fetch(id,seasonNumber) async{
    final data = await Api.getData("/tv/$id/season/$seasonNumber?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    return result["episodes"].map((episode) => Episode.fromJson(episode)).toList();
  }
}