import 'package:flutter/material.dart';
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
        backgroundColor: Colors.blue,
        title: const Text("Homepage"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExplorePage()),
                );
              },
              child: const Text(
                "Explore",
                style: TextStyle(fontsize: 40, fontFamily: "Passion One",),),
              //DESIGN ELEMENTS
              style: ElevatedButton.stylefrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                elevation: 20,
                shadowColor: Colors.black,
              )
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddMemoryPage()),
                );
              },
              child: const Text("My Gallery"),
              //DESIGN ELEMENTS
              backgroundColor: Colors.white,
            )
          ]
        ),
        backgroundColor: Color(0xffBF8D8D),
      )
    );
  }
}
