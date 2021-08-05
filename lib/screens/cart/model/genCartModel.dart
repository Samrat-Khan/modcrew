class CartModel {
  final String image;
  final String name;
  final String productId;
  final int productUnits;
  final double productPrice;
  final String sku;
  final double subTotal;

  CartModel({
    required this.image,
    required this.name,
    required this.productId,
    required this.productUnits,
    required this.productPrice,
    required this.sku,
    required this.subTotal,
  });
}
