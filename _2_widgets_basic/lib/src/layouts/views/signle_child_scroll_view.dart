import 'package:_2_widgets_basic/src/layouts/layout_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MySingleChildScrollView extends StatelessWidget {
  const MySingleChildScrollView({super.key});

  final String _title = '(Layout) Single Child Scroll Widget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: const LayoutDrawer(),
      body: SingleChildScrollView(
        // 스크롤 방향을 vertical로 설정 (기본값)
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(
            50,
            (index) => Container(
              height: 50,
              color: index % 2 == 0 ? Colors.yellow : Colors.pink,
              child: Center(
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
