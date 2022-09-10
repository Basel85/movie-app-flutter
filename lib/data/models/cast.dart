import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/data/apis/api.dart';
import 'package:provider/provider.dart';

class Cast {
  late String originalName;
  late String profileImage;
  Cast(this.originalName, this.profileImage);
  Cast.fromJson(Map<String, dynamic> json) {
    originalName = json["original_name"];
    profileImage = json["profile_path"];
  }
}

class Casts with ChangeNotifier, PageLoading {
  List<dynamic> casts = [];
  int castCount = 0;

  Future<void>? reset() {
    casts = [];
    castCount = 0;
    is_Loading = true;
    notifyListeners();
  }

  int countAvaliableProfileImage(casts) {
    int count = 0;
    for (var cast in casts) {
      if (cast.profileImage == null) {
        return count;
      }
      count++;
    }
    return count;
  }

  Future<void> fetch(id, type) async {
    final data = await Api().getData("/$type/$id/credits?api_key=");
    final result = json.decode(data) as Map<String, dynamic>;
    casts = result["cast"].map((cast) => Cast.fromJson(cast)).toList();
    castCount = countAvaliableProfileImage(casts);
    print("HHii");
    is_Loading = false;
    notifyListeners();
  }
}
