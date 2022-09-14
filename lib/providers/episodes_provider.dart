import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/episode.dart';
import '../data/apis/api.dart';
class Episodes with ChangeNotifier{
  List<dynamic> episodes = [];
  Future<void> fetch(id,seasonNumber) async{
    final data = await Api().getData("/tv/$id/season/$seasonNumber?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    episodes = result["episodes"].map((episode) => Episode.fromJson(episode)).toList();
    notifyListeners();
  }
}