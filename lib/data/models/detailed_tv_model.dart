import 'package:movie_app/constants/string_constants.dart';

class DetailedTv {
  late int? id;
  late String? name;
  late String? image;
  late int? voteCount;
  late double? voteAverage;
  late String? firstAirDate;
  late List<dynamic>? genres;
  late String? overview;
  late List<dynamic>? seasons;
  late int? numberOfSeasons;
  DetailedTv(
      this.name,
      this.image,
      this.voteCount,
      this.voteAverage,
      this.firstAirDate,
      this.genres,
      this.overview,
      this.seasons,
      this.numberOfSeasons);
  DetailedTv.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    name = json["name"] ?? "No name yet";
    image =json["poster_path"] == null ? null : imageDomain + json["poster_path"];
    voteCount = json["vote_count"] ?? 0;
    voteAverage = json["vote_average"] ?? 0.0;
    firstAirDate = json["first_air_date"] ?? "No air date yet";
    genres = json["genres"] ?? [];
    overview = json["overview"] ?? "No overview yet";
    seasons = json["seasons"] ?? [];
    numberOfSeasons = json["number_of_seasons"] ?? 0;
  }
}
