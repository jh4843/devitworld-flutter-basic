import 'package:_3_communication_basic/utils/route/route_path.dart';
import 'package:flutter/material.dart';
// route

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Communication Basic Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutePath.httpHttp,
      onGenerateRoute: RoutePath.onGenerateRoute,
    );
  }
}
