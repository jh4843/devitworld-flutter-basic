import 'package:_4_database/src/sqlite/index.dart';
import 'package:flutter/material.dart';

abstract class RoutePath {
  // sqlite
  static const String sqlite = '/sqlite';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      // http
      case RoutePath.sqlite:
        page = const MySqliteView();
        break;
      default:
        page = const Text("Page not found!");
        break;
    }

    return MaterialPageRoute(
      builder: (context) => page,
      settings: settings,
    );
  }
}
