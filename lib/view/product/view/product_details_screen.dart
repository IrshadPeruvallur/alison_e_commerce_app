import 'package:alison_ecommerce/constants/colors.dart';
import 'package:alison_ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String? productId;
  final String? slug;
  final String? code;
  final String? image;
  final String? name;
  final String? oldPrice;
  final String? price;
  final String? store;
  final String? manufacturer;

  const ProductDetailsPage({
    super.key,
    this.productId,
    this.slug,
    this.code,
    this.image,
    this.name,
    this.oldPrice,
    this.price,
    this.store,
    this.manufacturer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: name ?? ''),
        backgroundColor: whiteColor,
      ),
      body: Column(
        children: [
          // Product Image
          SizedBox(
            height: 300,
            width: double.infinity,
            child: image != null && image!.isNotEmpty
                ? Image.network(
                    'https://example.com/$image') // Replace with your base URL
                : const Placeholder(), // Placeholder if image URL is empty
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomText(
                      text: name ?? '',
                      size: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomText(
                      text: '₹${price ?? ''}',
                      size: 20,
                      color: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Old Price: ₹${oldPrice ?? ''}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomText(
                      text: 'Store: ${store ?? ''}',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomText(
                      text: 'Manufacturer: ${manufacturer ?? ''}',
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom Bar
          Container(
            padding: const EdgeInsets.all(16.0),
            color: whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const CustomText(text: 'Add to Cart'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const CustomText(text: 'View Similar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
