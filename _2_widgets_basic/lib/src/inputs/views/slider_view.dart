import 'package:_2_widgets_basic/src/inputs/input_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MySliderView extends StatefulWidget {
  const MySliderView({super.key});

  @override
  State<MySliderView> createState() => _MySliderViewState();
}

class _MySliderViewState extends State<MySliderView> {
  final String _title = '(Input) Slider Widget';

  double _currentSliderValue = 20; // initial value

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
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            Text('Current value: ${_currentSliderValue.round()}'),
          ],
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
