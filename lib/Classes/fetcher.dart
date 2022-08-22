import 'package:http/http.dart' as http;
import 'dart:convert';
class Fetcher{
  final apiUrl;
  Fetcher(this.apiUrl);
  Future<dynamic> fetch() async {
    final res = await http.get(Uri.parse(apiUrl));
    if (res.statusCode == 200) {
      return json.decode(res.body) as Map<String, dynamic>;
    } else {
      throw("Something went wrong, please try again");
    }
  }
}