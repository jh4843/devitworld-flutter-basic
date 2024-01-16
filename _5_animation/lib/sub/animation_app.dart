import 'package:flutter/material.dart';

import '../model/person.dart';
import './second_page.dart';

class AnimationApp extends StatefulWidget {
  const AnimationApp({super.key});

  @override
  State<AnimationApp> createState() => _AnimationAppState();
}

class _AnimationAppState extends State<AnimationApp> {
  List<Person> people = List.empty(growable: true);
  int current = 0;

  Color _weightColor = Colors.blue;

  double _opacity = 1; // 1: visible, 0: invisible

  @override
  void initState() {
    people.add(Person("John", 170, 60));
    people.add(Person("Mary", 149, 88));
    people.add(Person("Jane", 160, 50));
    people.add(Person("James", 180, 20));
    people.add(Person("Didi", 188, 30));
    people.add(Person("Jenny", 150, 10));

    super.initState();
  }

  void _changeWeightColor(double weightValue) {
    if (weightValue < 40) {
      _weightColor = Colors.blueAccent;
    } else if (weightValue < 60) {
      _weightColor = Colors.indigo;
    } else if (weightValue < 80) {
      _weightColor = Colors.indigo;
    } else {
      _weightColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Animation App"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 2),
                child: SizedBox(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        child: Text('name: ${people[current].name}'),
                      ),
                      AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.bounceIn,
                        color: Colors.amber,
                        width: 50,
                        height: people[current].height,
                        child: Text(
                          'height: ${people[current].height}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInCubic,
                        color: _weightColor,
                        width: 50,
                        height: people[current].weight,
                        child: Text(
                          'weight: ${people[current].weight}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.linear,
                        color: Colors.pinkAccent,
                        width: 50,
                        height: people[current].bmi,
                        child: Text(
                          'bmi: ${people[current].bmi.toString().substring(0, 2)}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (current < people.length - 1) {
                          current++;
                        }
                        _changeWeightColor(people[current].weight);
                      });
                    },
                    child: const Text("Next"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (current > 0) {
                          current--;
                        }
                        _changeWeightColor(people[current].weight);
                      });
                    },
                    child: const Text("Previous"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _opacity == 1 ? _opacity = 0 : _opacity = 1;
                      });
                    },
                    child: _opacity == 1
                        ? const Text("Disappear")
                        : const Text("Appear"),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondPage()));
                },
                child: const SizedBox(
                  width: 200,
                  child: Row(
                    children: <Widget>[
                      Hero(tag: 'detail', child: Icon(Icons.cake)),
                      Text('Move Second Page')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
