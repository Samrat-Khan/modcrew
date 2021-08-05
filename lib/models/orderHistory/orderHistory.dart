class OrderHistoryModel {
  final String productId;
  final String image;
  final String name;
  final int units;
  final double price;
  final bool isReviewAdded;
  final String review;
  OrderHistoryModel({
    required this.image,
    required this.isReviewAdded,
    required this.name,
    required this.price,
    required this.productId,
    required this.review,
    required this.units,
  });
}
