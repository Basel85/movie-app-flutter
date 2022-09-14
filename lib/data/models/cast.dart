class Cast {
  late String originalName;
  String? profileImage;
  Cast(this.originalName, this.profileImage);
  Cast.fromJson(Map<String, dynamic> json) {
    originalName = json["original_name"];
    profileImage = json["profile_path"];
  }
}
