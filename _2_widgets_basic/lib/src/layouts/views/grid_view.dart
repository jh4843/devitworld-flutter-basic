import 'package:_2_widgets_basic/src/layouts/layout_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  final String _title = '(Layout) Grid Widget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: const LayoutDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
      floatingActionButton: const RouteFAB(),
    );
  }

  static count(
      {required int crossAxisCount, required List<Container> children}) {}
}
