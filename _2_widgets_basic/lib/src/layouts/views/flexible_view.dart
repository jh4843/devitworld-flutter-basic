import 'package:_2_widgets_basic/src/layouts/layout_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyFlexibleView extends StatelessWidget {
  const MyFlexibleView({super.key});

  final String _title = 'Flexible Widget';

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
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              color: Colors.red,
              height: 100,
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Container(
              color: Colors.green,
              height: 100,
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              color: Colors.blue,
              height: 100,
            ),
          ),
        ],
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
