import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FutureBuilderDemo extends StatefulWidget {
  const FutureBuilderDemo({super.key});

  @override
  State<FutureBuilderDemo> createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  late Future<String?> fetchedImage;

  Future<String?> _fetchImage() async {
    final myFuture = await http.get(
      Uri.parse(
        'https://random.imagecdn.app/v1/image?category=buildings&format=json',
      ),
    );
    if (myFuture.statusCode == 200) {
      return jsonDecode(myFuture.body)['url'];
      // return null;
      // return '';
    }
    return Future.error('Something Went Wrong');
  }

  @override
  void initState() {
    fetchedImage = _fetchImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            fetchedImage = _fetchImage();
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: FutureBuilder<String?>(
        // future: _fetchImage(),
        future: fetchedImage,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return snapshot.data == ''
                ? const Text('no data')
                : Image.network(snapshot.data,
                    height: double.infinity, fit: BoxFit.cover);
          }
          return const Text('no data yet');
        },
      ),
    );
  }
}
