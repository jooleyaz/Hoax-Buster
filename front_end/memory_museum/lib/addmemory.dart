import 'dart:async';
import 'dart:io';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';

import 'home.dart';

class AddMemoryPage extends StatefulWidget {
  const AddMemoryPage({super.key});

  @override
  State<AddMemoryPage> createState() => AddMemoryPageState();
}

class AddMemoryPageState extends State<AddMemoryPage> {
  String? _imagePath;
  var files;
 
  void getFiles() async { //asyn function to get list of files
      List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
      var root = storageInfo[0].rootDir; //storageInfo[1] for SD card, geting the root directory
      var fm = FileManager(root: Directory(root)); //
      files = await fm.filesTree( 
      //set fm.dirsTree() for directory/folder tree list
        excludedPaths: ["/storage/emulated/0/Android"],
        extensions: ["png"] //optional, to filter files, remove to list all,
        //remove this if your are grabbing folder list
      );
      setState(() {}); //update the UI

  @override
  void initState() {
    getFiles();
    super.initState();
  }

  Future<void> getImage() async {
    bool isCameraGranted = await Permission.camera.request().isGranted;
    if (!isCameraGranted) {
      isCameraGranted =
          await Permission.camera.request() == PermissionStatus.granted;
    }

    if (!isCameraGranted) {
      // Have not permission to camera
      return;
    }

// Generate filepath for saving
    String imagePath = join("assets/images/memories",
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.png");

    try {
      //Make sure to await the call to detectEdge.
      bool success = await EdgeDetection.detectEdge(
        imagePath,
        canUseGallery: true,
        androidScanTitle: 'Scanning', // use custom localizations for android
        androidCropTitle: 'Crop',
        androidCropBlackWhiteTitle: 'Black White',
        androidCropReset: 'Reset',
      );
    } catch (error) {
      print(error);
    }

    if (!mounted) return;

    setState(() {
      _imagePath = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: getImage,
                child: const Text('Scan'),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Cropped image path:'),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
              child: Text(
                _imagePath.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Visibility(
              visible: _imagePath != null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(
                  File(_imagePath ?? ''),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 3,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(files[index].path.split('/').last),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
