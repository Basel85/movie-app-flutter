import 'package:movie_app/constants/string_constants.dart';

class UnDetailedTv {
  late int? id;
  late String? name;
  late String? image;
  late int? voteCount;
  late double? voteAverage;
  UnDetailedTv(this.id,this.name, this.image, this.voteCount, this.voteAverage);
  UnDetailedTv.fromJson(Map<String, dynamic> json) {
    id = json["id"]??0;
    name = json["name"]??"No name yet";
    image = json["poster_path"]==null?null:imageDomain + json["poster_path"];
    voteCount = json["vote_count"]??0;
    voteAverage = json["vote_average"].toDouble()??0.0;
  }
}
