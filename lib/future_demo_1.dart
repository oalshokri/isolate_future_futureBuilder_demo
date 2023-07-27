import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureDemo extends StatefulWidget {
  const FutureDemo({super.key});

  @override
  State<FutureDemo> createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageUrl == null ? SizedBox() : Image.network(imageUrl!),
            ElevatedButton(
              onPressed: () async {
                final myFuture = http.get(
                  Uri.parse(
                    'https://random.imagecdn.app/v1/image?category=buildings&format=json',
                  ),
                );
                myFuture.then((resp) {
                  imageUrl = jsonDecode(resp.body)['url'];
                  setState(() {});
                });
              },
              child: const Text('Download Image'),
            ),
          ],
        ),
      ),
    );
  }
}
