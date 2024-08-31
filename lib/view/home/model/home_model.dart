import 'package:alison_ecommerce/view/home/model/banner_model.dart';
import 'package:alison_ecommerce/view/home/model/product_model.dart';

class HomeModel {
  final List<BannerModel>? banner1;
  final List<BannerModel>? banner2;
  final List<BannerModel>? banner3;
  final List<BannerModel>? banner4;
  final List<BannerModel>? banner5;
  final List<ProductModel>? recentViews;
  final List<ProductModel>? ourProducts;

  HomeModel({
    this.banner1,
    this.banner2,
    this.banner3,
    this.banner4,
    this.banner5,
    this.recentViews,
    this.ourProducts,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      banner1: (json['banner1'] as List<dynamic>?)
          ?.map((item) => BannerModel.fromJson(item))
          .toList(),
      banner2: (json['banner2'] as List<dynamic>?)
          ?.map((item) => BannerModel.fromJson(item))
          .toList(),
      banner3: (json['banner3'] as List<dynamic>?)
          ?.map((item) => BannerModel.fromJson(item))
          .toList(),
      banner4: (json['banner4'] as List<dynamic>?)
          ?.map((item) => BannerModel.fromJson(item))
          .toList(),
      banner5: (json['banner5'] as List<dynamic>?)
          ?.map((item) => BannerModel.fromJson(item))
          .toList(),
      recentViews: (json['recentviews'] as List<dynamic>?)
          ?.map((item) => ProductModel.fromJson(item))
          .toList(),
      ourProducts: (json['our_products'] as List<dynamic>?)
          ?.map((item) => ProductModel.fromJson(item))
          .toList(),
    );
  }
}
