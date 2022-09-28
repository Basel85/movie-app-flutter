import 'package:flutter/material.dart';
import 'package:movie_app/data/apis/api.dart';
import 'package:movie_app/data/models/undetailedmovie_model.dart';
import 'dart:convert';

class MoviesSearch with ChangeNotifier{
  String name = "";
  void reset(value){
    name = value;
    notifyListeners();
  }
  Future<dynamic> fetch(type) async{
    print("Hi");
    final data = await Api.getQueryData(type, name);
    final result  = json.decode(data) as Map<String,dynamic>;
    return result["results"].map((md)=>UnDetailedMovie.fromJson(md)).toList();
  }
  String getName(){
    return name;
  }
}