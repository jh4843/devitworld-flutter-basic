import 'package:_3_communication_basic/utils/route/route_path.dart';
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
          child: const Icon(Icons.http),
          label: 'Http',
          onTap: () => Navigator.pushNamed(context, RoutePath.httpHttp),
        )
      ],
    );
  }
}
