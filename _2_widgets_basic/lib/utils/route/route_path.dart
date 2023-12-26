import 'package:_2_widgets_basic/src/assets/index.dart';
import 'package:_2_widgets_basic/src/inputs/index.dart';
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

  // input
  static const String input = '/input';
  static const String inputTextField = '$input/textfield';
  static const String inputCombobox = '$input/combobox';
  static const String inputRadio = '$input/radio';
  static const String inputSlider = '$input/slider';

  // assets
  static const String asset = '/asset';
  static const String assetFont = '$asset/font';
  static const String assetIcon = '$asset/icon';
  static const String assetImage = '$asset/image';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      // layout
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
      // input
      case RoutePath.inputTextField:
        page = const MyTextFieldView();
        break;
      case RoutePath.inputCombobox:
        page = const MyComboboxView();
        break;
      case RoutePath.inputRadio:
        page = const MyRadioView();
        break;
      case RoutePath.inputSlider:
        page = const MySliderView();
        break;
      case RoutePath.assetFont:
        page = const MyFontsView();
        break;
      case RoutePath.assetIcon:
        page = const MyIconsView();
        break;
      case RoutePath.assetImage:
        page = const MyImagesView();
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
