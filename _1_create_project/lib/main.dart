import 'package:_1_create_project/navigator/page_a_basic.dart';
import 'package:_1_create_project/navigator/page_b_named.dart';
import 'package:_1_create_project/navigator/page_c_arg.dart';
import 'package:_1_create_project/navigator/page_d_result.dart';
import 'package:_1_create_project/navigator/page_e_go_router.dart';
import 'package:_1_create_project/navigator/page_f_go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './sub/statefull_sample_page.dart';
import './sub/stateless_sample_page.dart';

final _router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: 'Start Project')),
  GoRoute(path: '/e', builder: (context, state) => const PageE()),
  GoRoute(
    path: '/f/:argText',
    builder: (context, state) =>
        PageF(argText: state.pathParameters['argText']!),
  ),
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //routerConfig: _router,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Start Project'),
        '/a': (context) => const PageA(),
        '/b': (context) => const PageB(),
        '/c': (context) => const PageC(argText: 'from /c route'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const MyStatelessPage();
                  }),
                );
              },
              child: const Text('Go to Stateless Sample Page'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const MyStatefulPage();
                  }),
                );
              },
              child: const Text('Go to Stateful Sample Page'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const PageA();
                  }),
                );
              },
              child: const Text('Go to Page A'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // go to '/b' path
                Navigator.pushNamed(context, '/b');
              },
              child: const Text('Go to Page B'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const PageC(argText: "Route with argument");
                    },
                  ),
                );
              },
              child: const Text('Go to Page C'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageD()),
                );

                AlertDialog dlg = AlertDialog(
                  title: const Text('Result'),
                  content: Text('$result'),
                );

                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (BuildContext context) => dlg,
                );
              },
              child: const Text('Go to Page D'),
            ),
            // const SizedBox(height: 8),
            // ElevatedButton(
            //   onPressed: () => context.go('/e'),
            //   child: const Text('Go to Page E'),
            // ),
            // const SizedBox(height: 8),
            // ElevatedButton(
            //   onPressed: () => context.go('/f/123'),
            //   child: const Text('Go to Page F'),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
