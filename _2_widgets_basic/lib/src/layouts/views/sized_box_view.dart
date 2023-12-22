import 'package:_2_widgets_basic/src/layouts/layout_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MySizedBoxView extends StatelessWidget {
  const MySizedBoxView({super.key});

  final String _title = 'Sized Box Widget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: const LayoutDrawer(),
      body: SizedBox(
        width: 100,
        height: 100,
        child: Container(
          width: 1000,
          height: 1000,
          color: Colors.red,
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
