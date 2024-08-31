import 'dart:developer';

import 'package:alison_ecommerce/constants/colors.dart';
import 'package:alison_ecommerce/view/home/model/banner_model.dart';
import 'package:alison_ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.size,
    this.banner,
  });

  final Size size;
  final BannerModel? banner;

  @override
  Widget build(BuildContext context) {
    return banner != null
        ? Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(banner!.image!),
                    fit: BoxFit.cover,
                    onError: (error, stackTrace) {
                      log('Error loading banner image: $error');
                    },
                  ),
                ),
                width: size.width,
                height: size.height * 0.3,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: whiteColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: CustomText(
                    text: "Shop Now",
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
