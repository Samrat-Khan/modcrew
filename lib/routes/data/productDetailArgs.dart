class ProductDetailArgs {
  final String name;
  final double price;
  final String detail;
  final int totalStock;
  final String imagePath;
  final bool isSale;
  final double discount;

  ProductDetailArgs({
    required this.name,
    required this.price,
    required this.detail,
    required this.totalStock,
    required this.imagePath,
    required this.discount,
    required this.isSale,
  });
}
