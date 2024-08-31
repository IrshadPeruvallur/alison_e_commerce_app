import 'package:alison_ecommerce/view/home/model/home_model.dart';
import 'package:alison_ecommerce/view/product/view/product_details_screen.dart';
import 'package:alison_ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductRowWidget extends StatelessWidget {
  const ProductRowWidget({
    super.key,
    required this.homeData,
    required this.size,
  });

  final HomeModel? homeData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        homeData?.ourProducts?.length ?? 0,
        (index) {
          final product = homeData!.ourProducts![index];
          return Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          name: product.name,
                          image: product.image,
                          price: product.price,
                          manufacturer: product.manufacturer,
                          oldPrice: product.oldprice,
                          store: product.store,
                        ),
                      )),
                  child: Container(
                    decoration: const BoxDecoration(
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   // image: NetworkImage(),
                        // ),
                        ),
                    width: size.width * 0.35,
                    height: size.height * 0.25,
                    child: Image.network(product.image ?? ''),
                  ),
                ),
                SizedBox(
                    width: size.width * 0.35,
                    child: CustomText(
                        textAlign: TextAlign.start,
                        size: 10,
                        text: product.name ?? 'Product name')),
                CustomText(
                  text: '₹${product.price ?? ''}',
                  color: Colors.green,
                  textAlign: TextAlign.start,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
