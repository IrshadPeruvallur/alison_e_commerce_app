import 'dart:developer';

import 'package:alison_ecommerce/constants/url.dart';
import 'package:alison_ecommerce/service/shared_preference.dart';
import 'package:alison_ecommerce/view/home/model/home_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio();
  Future<dynamic> getHomeData() async {
    final token =
        await SharedPreferencesService.getSharedPreferences(key: 'token');
    final id = await SharedPreferencesService.getSharedPreferences(key: 'id');
    try {
      final url = '$endPointURL$homeURL?id=$id&token=$token';
      Response response = await _dio.post(url);
      if (response.statusCode == 200) {
        log(response.data['message']);
        final data = response.data;
        HomeModel homeData = HomeModel.fromJson(data);
        return homeData;
      }
    } on DioException catch (e) {
      log('DioException caught: ${e.response?.statusCode} - ${e.response?.statusMessage}');

      rethrow;
    } catch (e) {
      log('An unexpected error occurred: $e');
      rethrow;
    }
    return null;
  }
}
