import 'package:_2_widgets_basic/utils/route/route_path.dart';
import 'package:flutter/material.dart';

class AssetDrawer extends StatelessWidget {
  const AssetDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: const EdgeInsets.only(top: 20.0),
        children: [
          ListTile(
            title: const Text('(Asset) Font View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.assetFont);
            },
          ),
          ListTile(
            title: const Text('(Asset) Icon View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.assetIcon);
            },
          ),
          ListTile(
            title: const Text('(Asset) Image View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.assetImage);
            },
          ),
        ],
      ),
    );
  }
}
