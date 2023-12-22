import 'package:_2_widgets_basic/src/layouts/layout_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyWrapView extends StatelessWidget {
  const MyWrapView({super.key});

  final String _title = 'Wrap Widget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: const LayoutDrawer(),
      body: const Wrap(
        spacing: 8.0,
        alignment: WrapAlignment.end,
        children: [
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text('AH', style: TextStyle(fontSize: 10)),
            ),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text('ML', style: TextStyle(fontSize: 10)),
            ),
            label: Text('Lafayette'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              child: Text('HM', style: TextStyle(fontSize: 10)),
            ),
            label: Text('Mulligan'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text('JL', style: TextStyle(fontSize: 10)),
            ),
            label: Text('Laurens'),
          ),
        ],
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
