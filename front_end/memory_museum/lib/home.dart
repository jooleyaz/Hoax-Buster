import 'package:flutter/material.dart';
import 'package:memory_museum/explore.dart';
import 'package:memory_museum/mygallery.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Homepage"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExplorePage()),
              );
            },
            child: const Text("Explore"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyGalleryPage()),
              );
            },
            child: const Text("My Gallery"),
          )
        ]
      ),
    );
  }
}
