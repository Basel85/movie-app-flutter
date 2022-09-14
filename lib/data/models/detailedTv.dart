import 'package:movie_app/constants.dart';

class DetailedTv {
  late int id;
  late String name;
  late String image;
  late int voteCount;
  late double voteAverage;
  late String firstAirDate;
  late List<dynamic> genres;
  late String overview;
  late List<dynamic> seasons;
  DetailedTv(this.name, this.image, this.voteCount, this.voteAverage,
      this.firstAirDate, this.genres, this.overview, this.seasons);
  DetailedTv.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = imageDomain + json["poster_path"];
    voteCount = json["vote_count"];
    voteAverage = json["vote_average"];
    firstAirDate = json["first_air_date"];
    genres = json["genres"];
    overview = json["overview"];
    seasons = json["seasons"];
  }
}
