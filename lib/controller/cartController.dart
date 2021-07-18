import 'package:get/get.dart';
import 'package:shopping_page/models/models.dart';

class CartController extends GetxController {
  var cartList = RxList<CartModel>().obs;
  RxDouble price = 1.0.obs;
  RxInt itemCount = 1.obs;
  var totalPrice = 0.0.obs;
  static CartController get to => Get.find<CartController>();
  // Cart List Controller
  addItemToCart({required CartModel product}) {
    cartList.value.add(product);
    cartItemsTotalPrice();
  }

  removeItemFromCart({required int index}) {
    cartList.value.removeAt(index);
    cartItemsTotalPrice();
  }

  updateItemToCart({required String id, required int price}) {
    // var updatePlace = cartList.value.firstWhere((element) => element["id"] == id);
    // if (updatePlace != null) updatePlace["price"] = price;
  }

  deleteCart() => cartList.value.clear();

  //Price Controller
  updatePrice({required int item, required double priceX}) {
    price.value = item * priceX;
  }

  incrementItemCount() {
    itemCount++;
  }

  deccrementItemCount() {
    itemCount--;
  }

  cartItemsTotalPrice() {
    totalPrice.value = cartList.value.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.productQuentity * element.productPrice));
  }
}
