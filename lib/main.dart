import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping_page/routes/route.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/screens/screens.dart';

import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  Get.put(CartController());
  Get.put(AuthController());
  Get.put(VariationController());
  Get.put(OrderIdController());
  Get.put(AddressController());
  Get.put(NavController());
  Get.put(NetworkController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authController = AuthController.to;
  final networkController = NetworkController.to;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modcrew',
      theme: Customtheme.lightTheme,
      onGenerateRoute: AppRouter.generatedRoute,
      initialRoute: RouteName.home,
    );
  }
}
