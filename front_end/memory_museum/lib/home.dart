import 'package:flutter/material.dart';
import 'package:memory_museum/add_new.dart';
import 'package:memory_museum/addmemory.dart';
import 'package:memory_museum/explore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff360000),
          title: const Text("Homepage"),
        ),
        body: Center(
          child: Column(children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExplorePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                fixedSize: const Size(300, 80),
                textStyle: const TextStyle(
                  fontSize: 40,
                  fontFamily: "Lexend-Regular",
                ),
                backgroundColor: Colors.white,
                elevation: 20,
                shadowColor: Colors.black,
                alignment: Alignment.center,
              ),
              child: const Text("Go to explore page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNewPage()),
                );
              },
              child: const Text("My Gallery"),
            )
          ]),
        ));
  }
}
