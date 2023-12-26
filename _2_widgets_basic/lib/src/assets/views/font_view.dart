import 'package:_2_widgets_basic/src/assets/asset_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyFontsView extends StatelessWidget {
  const MyFontsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Fonts'),
      ),
      drawer: const AssetDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Roboto Font - Regular',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
              ),
            ),
            Text(
              'Roboto Font - Italic',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontStyle: FontStyle.italic,
                fontSize: 24,
              ),
            ),
            Text(
              'Roboto Font - Bold',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
