class ProductModel {
  final String? image;
  final String? price;
  final String? oldprice;
  final String? name;
  final String? manufacturer;
  final String? store;
  final int? cart;

  ProductModel({
    this.image,
    this.price,
    this.name,
    this.oldprice,
    this.manufacturer,
    this.store,
    this.cart,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      image: json['image'],
      price: json['price'],
      name: json['name'],
      cart: json['cart'],
      oldprice: json['oldprice'],
      store: json['store'],
      manufacturer: json['manufacturer'],
    );
  }
}
