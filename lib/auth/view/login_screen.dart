// ignore_for_file: use_build_context_synchronously

import 'package:alison_ecommerce/auth/controller/auth_controller.dart';
import 'package:alison_ecommerce/constants/colors.dart';
import 'package:alison_ecommerce/view/home/home_screen.dart';
import 'package:alison_ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authController = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: blackColor,
          image: const DecorationImage(
            opacity: .6,
            fit: BoxFit.cover,
            image: AssetImage('assets/images/login_background.png'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Sign In",
                color: whiteColor,
                size: 35,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 40),
              TextField(
                controller: authController.phoneController,
                style: TextStyle(color: whiteColor),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: whiteColor),
                  hintText: "Email or Phone",
                  hintStyle: TextStyle(color: whiteColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: authController.passwordController,
                obscureText: true,
                style: TextStyle(color: whiteColor),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: whiteColor),
                  hintText: "Password",
                  hintStyle: TextStyle(color: whiteColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: "Forgot Password?",
                    color: whiteColor,
                    size: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await authController.login();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                      } catch (e) {
                        rethrow;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: CustomText(
                      text: "Sign In",
                      color: blackColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: CustomText(
                    text: "Don’t have an account? Create Account",
                    color: whiteColor,
                    size: 14,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
