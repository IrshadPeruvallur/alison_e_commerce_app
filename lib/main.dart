import 'package:alison_ecommerce/auth/controller/auth_controller.dart';
import 'package:alison_ecommerce/auth/view/login_screen.dart';
import 'package:alison_ecommerce/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: ToggleAuth(),
        // The ToggleAuth cannot access the data because the token’s time period is very short, and the token expires very quickly.
        home: LoginScreen(),
      ),
    );
  }
}
