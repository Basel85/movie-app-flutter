import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movie_app/constants/string_constants.dart';

class Api {
  static late http.Response reponse;
  static Future<dynamic> getData(otherUrlSegments) async {
    try {
      reponse = await http
          .get(Uri.parse("$apiDomain$otherUrlSegments$apiKey"))
          .timeout(const Duration(seconds: 20));
      if (reponse.statusCode == 200) {
        return reponse.body;
      } else {
        throw "Something went wrong, please try again later";
      }
    } on SocketException {
      throw "Check your internet connection";
    } on TimeoutException {
      throw "Connection has timed out";
    } catch (e) {
      throw "Something went wrong, please try again later";
    }
  }

  static Future<dynamic> getQueryData(type, name) async {
    try {
      reponse = await http
          .get(Uri.parse("$apiDomain/search/$type?api_key=$apiKey&query=$name"))
          .timeout(const Duration(seconds: 20));
      if (reponse.statusCode == 200) {
        return reponse.body;
      } else {
        throw "Something went wrong, please try again later";
      }
    } on SocketException {
      throw "Check your internet connection";
    } on TimeoutException {
      throw "Connection has timed out";
    }
    catch(e){
      throw "Something went wrong, please try again later";
    }
  }
}
