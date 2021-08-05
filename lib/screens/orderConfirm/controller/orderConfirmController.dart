import 'package:get/get.dart';

class OrderIdController extends GetxController {
  RxString orderId = ''.obs;
  static OrderIdController get to => Get.find<OrderIdController>();
  setOrderId({required String id}) => orderId.value = id;
}
