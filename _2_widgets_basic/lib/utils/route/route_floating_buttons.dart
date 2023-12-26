import 'package:_2_widgets_basic/utils/route/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class RouteFAB extends StatelessWidget {
  const RouteFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.menu,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.view_comfortable),
          label: 'Layout',
          onTap: () => Navigator.pushNamed(context, RoutePath.layoutRow),
        ),
        SpeedDialChild(
          child: const Icon(Icons.drive_file_rename_outline_rounded),
          label: 'Input',
          onTap: () => Navigator.pushNamed(context, RoutePath.inputTextField),
        ),
        SpeedDialChild(
          child: const Icon(Icons.perm_media),
          label: 'Assets',
          onTap: () => Navigator.pushNamed(context, RoutePath.assetFont),
        )
      ],
    );
  }
}
