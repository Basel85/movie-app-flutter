import 'package:movie_app/constants.dart';

class DetailedMovie {
  late int? id;
  late String? title;
  late String? image;
  late int? voteCount;
  late double? voteAverage;
  late String? releaseDate;
  late List<dynamic>? genres;
  late String? overview;
  DetailedMovie(this.title, this.image, this.voteCount, this.voteAverage,
      this.releaseDate, this.genres, this.overview);
  DetailedMovie.fromJson(Map<String, dynamic> json) {
    id = json["id"]??0;
    title = json["title"]??"No title yet";
    image = json["poster_path"]==null?null:imageDomain + json["poster_path"];
    voteCount = json["vote_count"]??0;
    voteAverage = json["vote_average"]??0.0;
    releaseDate = json["release_date"]??"No date yet";
    genres = json["genres"]??[];
    overview = json["overview"]??"No overview yet";
  }
}
