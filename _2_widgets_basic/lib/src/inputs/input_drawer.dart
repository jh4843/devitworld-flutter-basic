import 'package:_2_widgets_basic/utils/route/route_path.dart';
import 'package:flutter/material.dart';

class InputDrawer extends StatelessWidget {
  const InputDrawer({
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
            title: const Text('(Input) Text Field View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.inputTextField);
            },
          ),
          ListTile(
            title: const Text('(Input) Combobox View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.inputCombobox);
            },
          ),
          ListTile(
            title: const Text('(Input) Radio View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.inputRadio);
            },
          ),
          ListTile(
            title: const Text('(Input) Slider View'),
            onTap: () {
              Navigator.pushNamed(context, RoutePath.inputSlider);
            },
          ),
        ],
      ),
    );
  }
}
