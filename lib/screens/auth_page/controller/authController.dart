import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens.dart';

class AuthController extends GetxController {
  final SignInSignUp signInSignUp = SignInSignUp();
  RxString authToken = ''.obs;
  var userData = RxList<UserDataModel>().obs;

  static AuthController get to => Get.find<AuthController>();
  getAuthToken({required String token}) {
    // authToken.value = token;
    authToken.value = token;
    storeAuthToken(tokenValue: token);
  }

  addUserData({required UserDataModel userDataModel}) {
    userData.value.add(userDataModel);
    update();
  }

  // clearAuthToken() {
  //   authToken.value = '';
  // }
//check
  @override
  void onInit() {
    collectUserInfo();
    super.onInit();
  }

  collectUserInfo() async {
    String tokeData = await retriveAuthToken();

    if (tokeData.isEmpty) {
      authToken.value = '';
    } else {
      authToken.value = tokeData;
      Map<String, dynamic> userData =
          await signInSignUp.getUserData(token: tokeData);
      if (!userData["success"]) {
        clearAuthToken();
      } else {
        addUserData(
          userDataModel: UserDataModel.fromJson(userData["data"]),
        );
      }
    }
  }

  storeAuthToken({required String tokenValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", tokenValue);
  }

  retriveAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? "";
  }

  clearAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }
}
