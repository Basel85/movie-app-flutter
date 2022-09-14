import 'package:flutter/material.dart';
import 'package:movie_app/data/apis/api.dart';
import 'dart:convert';

abstract class UnDetailedData with ChangeNotifier {
  List<dynamic> dataList = [];
  void getData(Map<String, dynamic> result);
  Future<void> fetch(type,category, [id]) async {
    String idUrlSegment = "";
    if (id != null) {
      idUrlSegment = id + "/";
    }
    final data = await Api().getData("/$type/$idUrlSegment$category?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    getData(result);
    notifyListeners();
  }
}

