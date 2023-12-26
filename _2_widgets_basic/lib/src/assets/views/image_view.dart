import 'package:_2_widgets_basic/src/assets/asset_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyImagesView extends StatelessWidget {
  const MyImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Assets'),
      ),
      drawer: const AssetDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/facebook.png', width: 50, height: 50),
            const SizedBox(height: 20),
            Image.asset('assets/images/flutter.png', width: 50, height: 50),
            const SizedBox(height: 20),
            Image.asset('assets/images/google.png', width: 50, height: 50),
            const SizedBox(height: 20),
            Image.asset('assets/images/instagram.png', width: 50, height: 50),
          ],
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
