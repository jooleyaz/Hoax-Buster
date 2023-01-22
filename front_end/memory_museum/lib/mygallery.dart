import 'package:flutter/material.dart';

class MyGalleryPage extends StatefulWidget {
  const MyGalleryPage({super.key});

  @override
  State<MyGalleryPage> createState() => MyGalleryPageState();
}

class MyGalleryPageState extends State<MyGalleryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        ElevatedButton(onPressed: () {},
        child: Image.asset("assets/images/memories/uwu.png")),
        ElevatedButton(onPressed: () {},
        child: Image.asset("assets/images/memories/uwu.png")),
        ElevatedButton(onPressed: () {},
        child: Image.asset("assets/images/memories/uwu.png")),
        ElevatedButton(onPressed: () {},
        child: Image.asset("assets/images/memories/uwu.png")),
        ElevatedButton(onPressed: () {},
        child: Image.asset("assets/images/memories/uwu.png")),
        ElevatedButton(onPressed: () {},
        child: Image.asset("assets/images/memories/uwu.png"))
      ],
    );
  }
}
