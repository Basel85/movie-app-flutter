import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

class GetterApi{
  static late http.Response reponse;
  static Future<dynamic> getData(urlSegment) async {
    try {
      reponse = await http
          .get(Uri.parse(urlSegment))
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
}
