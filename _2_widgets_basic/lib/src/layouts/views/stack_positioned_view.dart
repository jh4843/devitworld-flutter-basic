import 'package:_2_widgets_basic/src/layouts/layout_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyStackPositionedView extends StatelessWidget {
  const MyStackPositionedView({super.key});

  final String _title = '(Layout) StackPositioned Widget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: const LayoutDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 200,
            height: 200,
          ),
          const Positioned(
            top: 30.0,
            right: 10.0,
            child: Text(
              'On top of image',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
