import 'package:flutter/material.dart';

import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/screens/search/views/search_view.dart';

class AppRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeScreen(),
        );
      case '/fashion':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ShopScreen(
            pageIndex: 0,
          ),
        );
      case '/collectibles':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ShopScreen(
            pageIndex: 1,
          ),
        );

      case '/aboutus':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AboutUs(),
        );
      case '/contactus':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ContactUs(),
        );

      case '/login':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SignUpLogIn(),
        );
      case '/signup':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SignUpLogIn(initIndex: 1),
        );
      case '/cart':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CartPage(),
        );
      case '/account':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => UserAccount(),
        );
      case '/search':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SearchPage(
            productName: args == null ? "" : args as String,
          ),
        );
      case '/checkout':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CheckOut(),
        );
      case '/webPayment':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => WebPayment(
            orderId: args == null ? "" : args as String,
          ),
        );
      case '/orderConfrim':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OrderConfirm(
            orderId: args as String,
            // orderId: "order_DaZlswtdcn9UNV",
          ),
        );

      case '/sizechart':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SizeChart(),
        );
      case '/noNetwork':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => NoInternetPage(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
