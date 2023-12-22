import 'package:_2_widgets_basic/src/layouts/layout_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyContainerView extends StatelessWidget {
  const MyContainerView({super.key});

  final String _title = 'Container Widget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: const LayoutDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.blue,
        width: 200,
        height: 200,
        child: const Text(
          'Hello World',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
