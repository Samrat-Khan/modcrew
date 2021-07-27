import 'package:get/get.dart';

class NavChangeController extends GetxController {
  var index = 0.obs;
  static NavChangeController get to => Get.find<NavChangeController>();
  setIndex({required int currentIndex}) {
    index.value = currentIndex;
  }
}
