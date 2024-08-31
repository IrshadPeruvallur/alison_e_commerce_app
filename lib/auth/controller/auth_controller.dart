import 'package:alison_ecommerce/auth/model/auth_model.dart';
import 'package:alison_ecommerce/service/auth_service.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false;

  Future<dynamic> login() async {
    isLoading = true;
    notifyListeners();
    final data = AuthModel(
      emailOrPhone: phoneController.text,
      password: passwordController.text.trim(),
    );
    await _authService.login(data);
    isLoading = false;
    notifyListeners();
  }
}
