import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ur mom"),
        backgroundColor: Colors.green,
      ),
      body: Text("Explore Page uwu"),
    );
  }
}