import 'package:movie_app/constants.dart';

class Episode{
  late String name;
  late String overview;
  late String airDate;
  late String? image;
  Episode(this.name,this.overview,this.airDate,this.image);
  Episode.fromJson(Map<String,dynamic> json){
    name = json["name"];
    overview = json["overview"];
    airDate = json["air_date"];
    image = json["still_path"]==null?null:imageDomain + json["still_path"];
  }
}