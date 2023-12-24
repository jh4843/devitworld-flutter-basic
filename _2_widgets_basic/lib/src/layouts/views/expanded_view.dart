import 'package:_2_widgets_basic/src/layouts/layout_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyExpandedView extends StatelessWidget {
  const MyExpandedView({super.key});

  final String _title = '(Layout) Expanded Widget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: const LayoutDrawer(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
