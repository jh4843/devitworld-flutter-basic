import 'package:_2_widgets_basic/src/inputs/input_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyComboboxView extends StatefulWidget {
  const MyComboboxView({super.key});

  @override
  State<MyComboboxView> createState() => _MyComboboxViewState();
}

class _MyComboboxViewState extends State<MyComboboxView> {
  final String _title = '(Input) Combobox Widget';

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: const InputDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                // Update Check State
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text(isChecked ? 'Checked' : 'Unchecked'),
          ],
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
