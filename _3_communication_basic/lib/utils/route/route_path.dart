import 'package:_3_communication_basic/src/file_manager/index.dart';
import 'package:_3_communication_basic/src/http/index.dart';
import 'package:flutter/material.dart';

abstract class RoutePath {
  // http
  static const String http = '/http';
  static const String httpHttp = '$http/http';
  static const String httpDio = '$http/dio';

  // file manager
  static const String fileManger = '/file-manager';
  static const String fileMangerLocal = '$fileManger/local';
  static const String fileMangerNetwork = '$fileManger/network';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      // http
      case RoutePath.httpHttp:
        page = const MyHttpView();
        break;
      case RoutePath.httpDio:
        page = const MyDioView();
        break;
      case RoutePath.fileMangerLocal:
        page = const MyLocalFileView();
        break;
      case RoutePath.fileMangerNetwork:
        page = const MyNetworkFileView();
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
