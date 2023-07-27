import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void isolateFunction(int finalNum) {
  int count = 0;
  for (int i = 0; i < finalNum; i++) {
    count++;
    if (count % 100 == 0) {
      print('isolate: $count');
    }
  }
}

int computeFunction(int finalNum) {
  int count = 0;
  for (int i = 0; i < finalNum; i++) {
    count++;
    if (count % 100 == 0) {
      print('isolate: $count');
    }
  }
  return count;
}

class IsolateDemo extends StatefulWidget {
  const IsolateDemo({super.key});

  @override
  State<IsolateDemo> createState() => _IsolateDemoState();
}

class _IsolateDemoState extends State<IsolateDemo> {
  int counter = 0;
  @override
  void initState() {
    Isolate.spawn(isolateFunction, 1000);
    super.initState();
  }

  Future<void> runCompute() async {
    counter = await compute(computeFunction, 2000);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter'),
            ElevatedButton(
              onPressed: () async {
                counter++;
                setState(() {});
              },
              child: const Text('ADD'),
            ),
            ElevatedButton(
              onPressed: runCompute,
              child: const Text('ADD in Isolate'),
            )
          ],
        ),
      ),
    );
  }
}
