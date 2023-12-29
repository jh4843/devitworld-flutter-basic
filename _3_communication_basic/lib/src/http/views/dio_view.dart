import 'package:_3_communication_basic/src/http/http_drawer.dart';
import 'package:_3_communication_basic/utils/route/route_floating_buttons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyDioView extends StatefulWidget {
  const MyDioView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDioView> createState() => _MyDioViewState();
}

class _MyDioViewState extends State<MyDioView> {
  Dio dio = Dio();
  String _userInfo = 'Loading data...';

  // Dio Setup (Add Interceptors)
  void setupDio() {
    // display request and response data in console
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request Sent: ${options.uri}');
        return handler.next(options); // continue
      },
      onResponse: (response, handler) {
        print('Response Received: ${response.data}');
        return handler.next(response); // continue
      },
      onError: (DioException e, handler) {
        print('Error: ${e.message}');
        return handler.next(e); // continue
      },
    ));
  }

  // Function to get user information from server
  Future<void> fetchData() async {
    try {
      var response =
          await dio.get('https://jsonplaceholder.typicode.com/users/1');
      setState(() {
        // display name, email, and company name
        _userInfo =
            'Name: ${response.data['name']}\nEmail: ${response.data['email']}\nCompany: ${response.data['company']['name']}';
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
    setupDio();
    fetchData(); // load data when widget is created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio HTTP Example'),
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
