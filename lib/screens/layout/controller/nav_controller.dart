import 'package:get/get.dart';

class NavController extends GetxController {
  RxList isSelected = [true, false, false, false, false].obs;
  RxInt selectedIndex = 0.obs;
  static NavController get to => Get.find<NavController>();

  setIndex({required int i}) => selectedIndex.value = i;
}
