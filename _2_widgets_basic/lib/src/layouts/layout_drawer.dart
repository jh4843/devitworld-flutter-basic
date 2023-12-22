import 'package:_2_widgets_basic/utils/route/route_path.dart';
import 'package:flutter/material.dart';

class LayoutDrawer extends StatelessWidget {
  const LayoutDrawer({
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
            title: const Text('Row View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.layoutRow);
            },
          ),
          ListTile(
            title: const Text('Column View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.layoutCol);
            },
          ),
          ListTile(
            title: const Text('Container'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.layoutContainer);
            },
          ),
          ListTile(
            title: const Text('Expanded'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.layoutExpanded);
            },
          ),
          ListTile(
            title: const Text('Flexible'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.layoutFlexible);
            },
          ),
          ListTile(
            title: const Text('Grid View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.layoutGridView);
            },
          ),
          ListTile(
            title: const Text('List View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.layoutListView);
            },
          ),
          ListTile(
            title: const Text('Padding'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.layoutPadding);
            },
          ),
          ListTile(
            title: const Text('Single Child Scroll View'),
            onTap: () {
              Navigator.pushNamed(
                  context, RoutePath.layoutSingleChildScrollView);
            },
          ),
          ListTile(
            title: const Text('Sized Box'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.layoutSizedBox);
            },
          ),
          ListTile(
            title: const Text('Stack Positioned'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.layoutStackPositionedView);
            },
          ),
          ListTile(
            title: const Text('Wrap'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.layoutWrapView);
            },
          ),
        ],
      ),
    );
  }
}
