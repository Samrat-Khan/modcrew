import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../screens.dart';

class AuthController extends GetxController {
  final SignInSignUp signInSignUp = SignInSignUp();
  RxString authToken = ''.obs;
  var userData = RxList<UserDataModel>().obs;

  static AuthController get to => Get.find<AuthController>();
  getAuthToken({required String token}) {
    // authToken.value = token;
    authToken.update((token) {
      authToken.value = token!;
    });
  }

  addUserData({required UserDataModel userDataModel}) {
    userData.value.add(userDataModel);
  }

  clearAuthToken() {
    authToken.value = '';
  }

  @override
  void onInit() {
    // collectUserInfo();
    super.onInit();
  }

  collectUserInfo() async {
    Map<String, dynamic> userData = await signInSignUp.getUserData(token: " ");
    if (!userData["success"]) {
      clearAuthToken();
    } else {
      addUserData(
        userDataModel: UserDataModel.fromJson(userData["data"]),
      );
    }
  }
}
