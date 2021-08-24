import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var networkState = 0.obs;
  static NetworkController get to => Get.find<NetworkController>();
  @override
  void onInit() {
    checkConnection();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      networkState.value = 0;
      update();
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      networkState.value = 1;
      update();
    }
  }
}
