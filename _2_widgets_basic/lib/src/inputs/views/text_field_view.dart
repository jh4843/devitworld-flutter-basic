import 'package:_2_widgets_basic/src/inputs/input_drawer.dart';
import 'package:_2_widgets_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';

class MyTextFieldView extends StatefulWidget {
  const MyTextFieldView({super.key});

  @override
  State<MyTextFieldView> createState() => _MyTextFieldViewState();
}

class _MyTextFieldViewState extends State<MyTextFieldView> {
  final String _title = '(Input) Text Field Widget';

  final myController = TextEditingController();
  String _textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: const InputDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Put your text here',
              ),
              keyboardType: TextInputType.text,
              obscureText: false,
              onChanged: (text) {
                print("text field is changed: $text");
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // update the text displayed
                setState(() {
                  _textFieldValue = myController.text;
                });
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              _textFieldValue,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
