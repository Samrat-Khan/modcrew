class OrderHistory {
  final String productName;
  final String review;
  final bool isUserGivenReview;
  final double productPrice;
  final int buyedProductNo;
  final String imagePath;
  final double totalPrice;
  OrderHistory({
    required this.productName,
    required this.productPrice,
    required this.buyedProductNo,
    this.isUserGivenReview = false,
    this.review = '',
    required this.imagePath,
    required this.totalPrice,
  });
}

final List<OrderHistory> orderHistory = [
  OrderHistory(
    productName: "Dress 2",
    productPrice: 200,
    buyedProductNo: 3,
    imagePath: 'assets/images/f2.png',
    totalPrice: 200 * 3,
  ),
  OrderHistory(
    productName: "Lamborghini Huracán",
    productPrice: 7000,
    buyedProductNo: 1,
    imagePath: "assets/images/car2.png",
    totalPrice: 7000 * 1,
    isUserGivenReview: true,
    review:
        "This Car🚗 is Awesome its performance and styling is so nice. I love it❤️",
  ),
  OrderHistory(
    productName: "Accessories 2",
    productPrice: 10,
    buyedProductNo: 2,
    totalPrice: 10 * 2,
    imagePath: "assets/images/a2.png",
    isUserGivenReview: true,
    review:
        "This Car🚗 is Awesome its performance and styling is so nice. I love it❤️",
  ),
];
