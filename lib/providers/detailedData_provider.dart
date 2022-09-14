import 'dart:convert';

import 'package:flutter/material.dart';
import '../data/apis/api.dart';
import '../data/models/detailedMovie.dart';
import '../data/models/detailedTv.dart';

abstract class DetailedData with ChangeNotifier{
  dynamic detailedData;
  void getData(Map<String, dynamic> result);
  Future<void> fetch(type,id) async {
    final data = await Api().getData("/$type/$id?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    getData(result);
    notifyListeners();
  }
}
class DetailedMovies extends DetailedData{
  @override
  void getData(Map<String, dynamic> result) {
    detailedData = DetailedMovie.fromJson(result);
  }

}
class DetailedTvs extends DetailedData{
  @override
  void getData(Map<String, dynamic> result) {
    detailedData = DetailedTv.fromJson(result);
  }
}