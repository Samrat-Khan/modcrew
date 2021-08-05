import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/screens/cart/controller/cartController.dart';
import 'package:shopping_page/controller/navChanagingController.dart';
import 'package:shopping_page/routes/route.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/screens/newTemplate/newTemplate.dart';
import 'package:url_strategy/url_strategy.dart';

import 'widgets/orderTack/orderTrack.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  Get.put(CartController());
  Get.put(AuthController());
  Get.put(NavChangeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modcrew',
      theme: Customtheme.lightTheme,
      onGenerateRoute: AppRouter.generatedRoute,
      initialRoute: RouteName.home,
      // home: OrderTrack(),
    );
  }
}

// class JWTToekn extends StatelessWidget {
//   const JWTToekn({Key? key}) : super(key: key);

//   getToken() async {
//     var body = {
//       "firstName": "Samradt",
//       "lastName": "Khddan",
//       "email": "wwesadsamu@gmail.com",
//       "password": "samratddkhan8^^",
//       "age": 20,
//       "number": 9046207533,
//     };
//     var encodeBody = jsonEncode(body);

//     var res = await http.post(
//       Uri.parse(SIGN_UP),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: encodeBody,
//     );
//     print("JWT ${res.body}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TextButton(
//           onPressed: () {
//             getToken();
//           },
//           child: Text("Get JWT"),
//         ),
//       ),
//     );
//   }
// }
