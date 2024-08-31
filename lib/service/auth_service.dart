import 'dart:developer';

import 'package:alison_ecommerce/auth/model/auth_model.dart';
import 'package:alison_ecommerce/constants/url.dart';
import 'package:alison_ecommerce/service/shared_preference.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();
  Future<dynamic> login(AuthModel data) async {
    try {
      final url =
          '$endPointURL$loginURL?email_phone=${data.emailOrPhone}&password=${data.password}';
      Response response = await _dio.post(url);
      if (response.statusCode == 200) {
        log(response.data['message']);
        final data = response.data['customerdata'];
        AuthModel customerdata = AuthModel.fromJson(data);
        SharedPreferencesService.setSharedPreferences(
            key: 'token', value: customerdata.token!);
        SharedPreferencesService.setSharedPreferences(
            key: 'id', value: customerdata.id!);
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
