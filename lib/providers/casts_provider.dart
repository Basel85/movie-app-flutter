import 'package:flutter/material.dart';
import '../data/apis/api.dart';
import '../data/models/cast.dart';
import 'dart:convert';

class Casts with ChangeNotifier {
  List<dynamic> casts = [];

  Future<dynamic> fetch(id, type) async {
    final data = await Api().getData("/$type/$id/credits?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    print(result["cast"]);
    casts = result["cast"].map((cast) => Cast.fromJson(cast)).toList();
    notifyListeners();
    return casts;
  }
}