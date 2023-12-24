import 'package:_2_widgets_basic/src/inputs/input_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyRadioView extends StatefulWidget {
  const MyRadioView({super.key});

  @override
  State<MyRadioView> createState() => _MyRadioViewState();
}

class _MyRadioViewState extends State<MyRadioView> {
  final String _title = '(Input) Radio Widget';

  int _selectedRadioValue = 1;

  void _setSelectedRadioValue(int? value) {
    setState(() {
      _selectedRadioValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: const InputDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('Option 1'),
              leading: Radio(
                value: 1,
                groupValue: _selectedRadioValue,
                onChanged: _setSelectedRadioValue,
              ),
            ),
            ListTile(
              title: const Text('Option 2'),
              leading: Radio(
                value: 2,
                groupValue: _selectedRadioValue,
                onChanged: _setSelectedRadioValue,
              ),
            ),
            ListTile(
              title: const Text('Option 3'),
              leading: Radio(
                value: 3,
                groupValue: _selectedRadioValue,
                onChanged: _setSelectedRadioValue,
              ),
            ),
            // Display the selected option
            Text('Selected Option: $_selectedRadioValue'),
          ],
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
