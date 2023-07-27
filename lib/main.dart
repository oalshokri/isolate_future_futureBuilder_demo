import 'package:flutter/material.dart';
import 'package:future_in_dart_demo/future_builder.dart';
import 'package:future_in_dart_demo/future_demo_1.dart';
import 'isolate_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: IsolateDemo(),
      // home: FutureDemo(),
      home: FutureBuilderDemo(),
    );
  }
}
