import 'package:movie_app/constants.dart';

class DetailedMovie {
  late int id;
  late String title;
  late String? image;
  late int voteCount;
  late double voteAverage;
  late String releaseDate;
  late List<dynamic> genres;
  late String overview;
  DetailedMovie(this.title, this.image, this.voteCount, this.voteAverage,
      this.releaseDate, this.genres, this.overview);
  DetailedMovie.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = json["poster_path"]==null?null:imageDomain + json["poster_path"];
    voteCount = json["vote_count"];
    voteAverage = json["vote_average"];
    releaseDate = json["release_date"];
    genres = json["genres"];
    overview = json["overview"];
  }
}
