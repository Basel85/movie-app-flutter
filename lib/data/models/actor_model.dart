class Actor {
  late String? originalName;
  String? profileImage;
  Actor(this.originalName, this.profileImage);
  Actor.fromJson(Map<String, dynamic> json) {
    originalName = json["original_name"]??"No name yet";
    profileImage = json["profile_path"];
  }
}
