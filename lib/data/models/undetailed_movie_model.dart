import 'package:movie_app/constants.dart';

class UnDetailedMovie {
  late int? id;
  late String? title;
  late String? image;
  late int? voteCount;
  late double? voteAverage;
  UnDetailedMovie(
      this.id, this.title, this.image, this.voteCount, this.voteAverage);
  UnDetailedMovie.fromJson(Map<String, dynamic> json) {
    id = json["id"]??0;
    title = json["title"]??"No title yet";
    image = json["poster_path"]==null?null:imageDomain + json["poster_path"];
    voteCount = json["vote_count"]??0;
    voteAverage = json["vote_average"].toDouble()??0.0;
  }
}
