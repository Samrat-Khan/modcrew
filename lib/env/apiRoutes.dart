const String baseUrl = 'https://modcrew.herokuapp.com/api/v1';
const String env_PaymentApi =
    "https://454c51d50d41.ngrok.io/api/v1/payments/pay";
const String env_GetProducts = "$baseUrl/products";
const String env_SignIn = '$baseUrl/auth/login';
const String env_SignUp = '$baseUrl/auth/register';
const String env_GetUser = '$baseUrl/auth/me';
const String env_Cart = '$baseUrl/cart';
String env_SearchProduct({required String prodName}) =>
    "$baseUrl/products/search?keyword=$prodName";
const String env_order = '$baseUrl/order';
String env_razor_pay_order({required String orderId}) =>
    "$baseUrl/$orderId/pay";
