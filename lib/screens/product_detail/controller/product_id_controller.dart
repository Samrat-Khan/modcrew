import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_page/env/apiRoutes.dart';

class ProductIdController extends GetxController {
  RxString productId = ''.obs;
  static ProductIdController get to => Get.find<ProductIdController>();
  setProductId({required String id}) {
    productId.value = id;
    update();
  }

  clearProductId() {
    productId.value = '';
    update();
  }

  getSingleProduct() async {
    var res = await http.get(
      Uri.parse(
        env_singleProduct(id: productId.value),
      ),
    );
    Map<String, dynamic> jsonData = jsonDecode(res.body)["data"];
    return jsonData;
  }
}
