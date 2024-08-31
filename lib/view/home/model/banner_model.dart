class BannerModel {
  final String? title;
  final String? image;
  final String? subTitle;

  BannerModel({
    this.title,
    this.image,
    this.subTitle,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      title: json['title'],
      image: json['image'],
      subTitle: json['sub_title'],
    );
  }
}
