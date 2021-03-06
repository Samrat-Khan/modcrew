const String baseUrl = 'https://modcrew-dev.herokuapp.com/api/v1';
const String env_PaymentApi = "$baseUrl/v1/payments/pay";
const String env_GetProducts = "$baseUrl/products";
const String env_SignIn = '$baseUrl/auth/login';
const String env_SignUp = '$baseUrl/auth/register';
const String env_GetUser = '$baseUrl/auth/me';
const String env_Cart = '$baseUrl/cart';
// ignore: non_constant_identifier_names
String env_SearchProduct({required String prodName}) =>
    "$baseUrl/products/search?keyword=$prodName";
const String env_order = '$baseUrl/orders';
// ignore: non_constant_identifier_names
String env_razor_pay_order({required String orderId}) =>
    "$baseUrl/orders/$orderId/pay";
// ignore: non_constant_identifier_names
String env_orderStaus({required String orderId}) => '$baseUrl/orders/$orderId';

const String env_uploadAddress = '$baseUrl/address';
const String env_placeOrders = '$baseUrl/auth/me/orders';
const String env_wishlistCreate = '$baseUrl/wishlist';
// ignore: non_constant_identifier_names
String env_singleProduct({required String id}) => '$baseUrl/products/$id';
const String env_forgotPassword = '$baseUrl/auth/forgot-password';
// ignore: non_constant_identifier_names
String env_addReview({required String productId}) =>
    '$baseUrl/products/$productId/reviews';
