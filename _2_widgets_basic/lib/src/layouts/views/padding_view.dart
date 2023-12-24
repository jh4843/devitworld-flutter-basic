import 'package:_2_widgets_basic/src/layouts/layout_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyPaddingView extends StatelessWidget {
  const MyPaddingView({super.key});

  final String _title = '(Layout) Padding Widget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: const LayoutDrawer(),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              color: Colors.red,
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              color: Colors.green,
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.blue,
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
