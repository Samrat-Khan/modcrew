import 'package:get/get.dart';
import 'package:shopping_page/screens/screens.dart';

class CartController extends GetxController {
  //Cart HTTP Service
  final CartHTTPService httpService = CartHTTPService();
  //Controller
  static CartController get to => Get.find<CartController>();
  final authController = Get.put(AuthController());
  //Varible Init
  var cartList = RxList<CartModel>().obs;
  RxDouble subTotal = 0.0.obs;
  var getCartList = RxList<GetCartItem>().obs;
  var postCartList = RxList<PostItem>().obs;
  RxInt itemCount = 1.obs;

  //Opeartions
  addItemToCart({required CartModel cartModel}) async {
    //Adding value to CartModel
    cartList.value.add(cartModel);
    findSubTotal();
    //Adding value to PostItem
    // for (int i = 0; i < cartList.value.length; i++) {
    //   var data = cartList.value[i];

    //   postCartList.value.add(
    //     PostItem(
    //         productId: data.productId, sku: data.sku, units: data.productUnits),
    //   );
    // }
  }

  removieItemFromCart({required int index}) {
    cartList.value.removeAt(index);
    findSubTotal();
  }

  deleteCart() {
    cartList.value.clear();
  }

  //Controlling Product Count Item
  incrementItemCount() {
    itemCount.value++;
  }

  deccrementItemCount() {
    if (itemCount.value >= 0) {
      itemCount.value--;
    }
  }

  findSubTotal() {
    subTotal.value = cartList.value.fold(
        0, (previousValue, element) => previousValue + element.productPrice);
  }
}
