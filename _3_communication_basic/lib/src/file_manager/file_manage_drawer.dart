import 'package:_3_communication_basic/utils/route/route_path.dart';
import 'package:flutter/material.dart';

class FileMangerDrawer extends StatelessWidget {
  const FileMangerDrawer({
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
            title: const Text('(file manager) Local File View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.fileMangerLocal);
            },
          ),
          ListTile(
            title: const Text('(file manager) Network File View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.fileMangerNetwork);
            },
          ),
        ],
      ),
    );
  }
}
