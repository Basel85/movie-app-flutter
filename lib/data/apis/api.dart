import 'package:http/http.dart' as http;
import 'package:movie_app/constants.dart';
class Api {
  late http.Response reponse;
  Future<dynamic> getData(otherUrlSegments) async{
    reponse = await http.get(Uri.parse("$apiDomain$otherUrlSegments$apiKey"));
    if (reponse.statusCode == 200) {
      return reponse.body;
    } else {
      return "error";
    }
  }
}
