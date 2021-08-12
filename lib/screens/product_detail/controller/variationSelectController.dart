import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get to => Get.find<VariationController>();
  RxBool isNeedWaring = false.obs;

  setWaring({required bool value}) => isNeedWaring.value = value;
}
