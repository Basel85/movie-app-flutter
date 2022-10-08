import 'package:movie_app/constants/string_constants.dart';

class Episode{
  late String? name;
  late String? overview;
  late String? airDate;
  late String? image;
  Episode(this.name,this.overview,this.airDate,this.image);
  Episode.fromJson(Map<String,dynamic> json){
    name = json["name"] ?? "No name yet";
    overview = json["overview"]??"No overview yet";
    airDate = json["air_date"]??"No date yet";
    image = json["still_path"]==null?null:imageDomain + json["still_path"];
  }
}