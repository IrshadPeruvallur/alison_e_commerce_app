import 'package:alison_ecommerce/auth/view/login_screen.dart';
import 'package:alison_ecommerce/service/shared_preference.dart';
import 'package:alison_ecommerce/view/home/home_screen.dart';
import 'package:flutter/material.dart';

class ToggleAuth extends StatelessWidget {
  const ToggleAuth({super.key});

  Future<String?> _getToken() async {
    return await SharedPreferencesService.getSharedPreferences(key: 'token');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data != null) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
