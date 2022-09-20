import 'package:http/http.dart' as http;
import 'package:movie_app/constants.dart';
class Api {
  static late http.Response reponse;
  static Future<dynamic> getData(otherUrlSegments) async{
    reponse = await http.get(Uri.parse("$apiDomain$otherUrlSegments$apiKey"));
    if (reponse.statusCode == 200) {
      return reponse.body;
    } else {
      throw "error";
    }
  }
  static Future<dynamic> getQueryData(type,name) async{
    reponse = await http.get(Uri.parse("$apiDomain/search/$type?api_key=$apiKey&query=$name"));
    if (reponse.statusCode == 200) {
      return reponse.body;
    } else {
      throw "error";
    }
  }
}
