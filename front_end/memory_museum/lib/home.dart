import 'package:flutter/material.dart';
import 'package:memory_museum/add_new.dart';
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
        backgroundColor: const Color(0xff360000),
        body: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Image.asset("assets/AR(9).png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExplorePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  fixedSize: const Size(300, 80),
                  backgroundColor: const Color.fromARGB(255, 239, 223, 223),
                  elevation: 20,
                  shadowColor: Colors.black,
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  foregroundColor: Colors.black,
                ),
                child: const Text(
                  "EXPLORE MODE",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Lexend-Regular",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddNewPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  fixedSize: const Size(300, 80),
                  backgroundColor: const Color.fromARGB(255, 239, 223, 223),
                  elevation: 20,
                  shadowColor: Colors.black,
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  foregroundColor: Colors.black,
                ),
                child: const Text(
                  "ADD ARTIFACT",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Lexend-Regular",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
