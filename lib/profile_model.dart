class ProfileModel {
  final String url;

  ProfileModel({required this.url});
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      url: json['url'] as String,
    );
  }
}
