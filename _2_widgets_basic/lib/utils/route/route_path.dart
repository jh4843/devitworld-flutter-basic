import 'package:_2_widgets_basic/src/layouts/index.dart';
import 'package:flutter/material.dart';

abstract class RoutePath {
  // layout
  static const String layout = '/layout';
  static const String layoutRow = '$layout/row';
  static const String layoutCol = '$layout/col';
  static const String layoutContainer = '$layout/container';
  static const String layoutExpanded = '$layout/expanded';
  static const String layoutFlexible = '$layout/flexible';
  static const String layoutGridView = '$layout/gridview';
  static const String layoutListView = '$layout/listview';
  static const String layoutPadding = '$layout/padding';
  static const String layoutSingleChildScrollView =
      '$layout/singlechildscrollview';
  static const String layoutSizedBox = '$layout/sizedbox';
  static const String layoutStackPositionedView = '$layout/stackpositionedview';
  static const String layoutWrapView = '$layout/wrapview';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      case RoutePath.layoutRow:
        page = const MyRowView();
        break;
      case RoutePath.layoutCol:
        page = const MyColView();
        break;
      case RoutePath.layoutContainer:
        page = const MyContainerView();
        break;
      case RoutePath.layoutExpanded:
        page = const MyExpandedView();
        break;
      case RoutePath.layoutFlexible:
        page = const MyFlexibleView();
        break;
      case RoutePath.layoutGridView:
        page = const MyGridView();
        break;
      case RoutePath.layoutListView:
        page = const MyListView();
        break;
      case RoutePath.layoutPadding:
        page = const MyPaddingView();
        break;
      case RoutePath.layoutSingleChildScrollView:
        page = const MySingleChildScrollView();
        break;
      case RoutePath.layoutSizedBox:
        page = const MySizedBoxView();
        break;
      case RoutePath.layoutStackPositionedView:
        page = const MyStackPositionedView();
        break;
      case RoutePath.layoutWrapView:
        page = const MyWrapView();
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
