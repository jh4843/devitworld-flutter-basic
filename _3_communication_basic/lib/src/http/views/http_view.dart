import 'dart:convert';

import 'package:_3_communication_basic/src/http/http_drawer.dart';
import 'package:_3_communication_basic/utils/route/route_floating_buttons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHttpView extends StatefulWidget {
  const MyHttpView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHttpView> createState() => _MyHttpViewState();
}

class _MyHttpViewState extends State<MyHttpView> {
  String _userInfo = '';

  // Function to get user information from server
  Future<void> fetchData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');
    try {
      var response = await http.get(url);
      var data = jsonDecode(response.body);
      setState(() {
        // display name, email, and company name
        _userInfo =
            'Name: ${data['name']}\nEmail: ${data['email']}\nCompany: ${data['company']['name']}';
      });
    } catch (e) {
      setState(() {
        _userInfo = 'Failed to get User Information: $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // load data when widget is created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HTTP Request Example',
        ),
      ),
      drawer: const HttpDrawer(),
      body: Center(
        child: Text(
          _userInfo,
          style: const TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
