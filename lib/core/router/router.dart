import 'package:flutter/material.dart';

import '../../presentation/pages/pages.dart';


class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case ProductListPage.routeName:
        return MaterialPageRoute(
          builder: (context) => ProductListPage(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}