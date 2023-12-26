import 'package:_2_widgets_basic/src/assets/asset_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIconsView extends StatelessWidget {
  const MyIconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Assets'),
      ),
      drawer: const AssetDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.home,
              size: 50,
            ),
            Icon(
              CupertinoIcons.heart_solid,
              size: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
