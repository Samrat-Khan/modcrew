import 'package:flutter/material.dart';

import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/screens/search/search.dart';

class AppRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(settings.name);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Home(),
        );
      case '/shop':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Shop(),
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
      case '/aboutus':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AboutUs(),
        );
      case '/contact':
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
            productName: args as String,
          ),
        );
      case '/checkout':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CheckOut(
            totaPrice: args as String,
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
      case '/initScreen':
        return MaterialPageRoute(
          builder: (_) => InitScreen(),
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
