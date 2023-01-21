import 'package:flutter/material.dart';

class MyGalleryPage extends StatefulWidget {
  const MyGalleryPage({super.key});

  @override
  State<MyGalleryPage> createState() => MyGalleryPageState();
}

class MyGalleryPageState extends State<MyGalleryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ur mom"),
        backgroundColor: Colors.green,
      ),
      body: Text("My Gallery"),
    );
  }
}