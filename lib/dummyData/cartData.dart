class CartData {
  final double price;
  final String productName;
  final String imagePath;

  CartData({
    required this.price,
    required this.productName,
    required this.imagePath,
  });
}

final List<CartData> cartData = [
  CartData(
    price: 1200,
    productName: "Lamborgini Car",
    imagePath: "assets/images/car1.png",
  ),
  CartData(
    price: 200,
    productName: "Superman Toy Set",
    imagePath: "assets/images/car4.png",
  ),
  CartData(
    price: 50,
    productName: "Batman toolkit",
    imagePath: "assets/images/car2.png",
  ),
  CartData(
    price: 1200,
    productName: "Lamborgini Car",
    imagePath: "assets/images/car1.png",
  ),
];
