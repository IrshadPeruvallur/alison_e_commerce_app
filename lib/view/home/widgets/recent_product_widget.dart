import 'package:alison_ecommerce/view/home/model/home_model.dart';
import 'package:alison_ecommerce/view/product/view/product_details_screen.dart';
import 'package:alison_ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RecentProductWidget extends StatelessWidget {
  const RecentProductWidget({
    super.key,
    required this.homeData,
    required this.size,
  });

  final HomeModel? homeData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          homeData?.recentViews?.length ?? 0,
          (index) {
            final data = homeData!.recentViews![index];
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
                            name: data.name,
                            image: data.image,
                            price: data.price,
                            manufacturer: data.manufacturer,
                            oldPrice: data.oldprice,
                            store: data.store,
                          ),
                        )),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(data.image ?? ''),
                        ),
                      ),
                      width: size.width * 0.35,
                      height: size.height * 0.25,
                    ),
                  ),
                  SizedBox(
                      width: size.width * 0.35,
                      child: CustomText(
                          textAlign: TextAlign.start,
                          size: 10,
                          text: data.name ?? 'Product name')),
                  CustomText(
                    text: '₹${data.price ?? ''}',
                    color: Colors.green,
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
