import 'package:alison_ecommerce/view/home/controller/home_controller.dart';
import 'package:alison_ecommerce/view/home/widgets/banner_widget.dart';
import 'package:alison_ecommerce/view/home/widgets/product_widget.dart';
import 'package:alison_ecommerce/view/home/widgets/recent_product_widget.dart';
import 'package:alison_ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeController>(context, listen: false).getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset('assets/logos/logo.png'),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<HomeController>(
        builder: (context, value, child) {
          final homeData = value.homedata;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if (homeData?.banner1 != null &&
                          homeData!.banner1!.isNotEmpty)
                        BannerWidget(size: size, banner: homeData.banner1![0]),
                      if (homeData?.banner2 != null &&
                          homeData!.banner2!.isNotEmpty)
                        BannerWidget(size: size, banner: homeData.banner2![0]),
                      if (homeData?.banner3 != null &&
                          homeData!.banner3!.isNotEmpty)
                        BannerWidget(size: size, banner: homeData.banner3![0]),
                      if (homeData?.banner4 != null &&
                          homeData!.banner4!.isNotEmpty)
                        BannerWidget(size: size, banner: homeData.banner4![0]),
                      if (homeData?.banner5 != null &&
                          homeData!.banner5!.isNotEmpty)
                        BannerWidget(size: size, banner: homeData.banner5![0]),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(text: "Recent View"),
                      TextButton(
                        onPressed: () {},
                        child: const CustomText(text: "View All"),
                      ),
                    ],
                  ),
                ),
                RecentProductWidget(homeData: homeData, size: size),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(text: "Our Products"),
                      TextButton(
                        onPressed: () {},
                        child: const CustomText(text: "View All"),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ProductRowWidget(homeData: homeData, size: size),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
