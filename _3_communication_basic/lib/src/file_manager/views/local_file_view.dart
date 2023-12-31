import 'dart:io'; // for File

import 'package:_3_communication_basic/src/file_manager/file_manage_drawer.dart';
import 'package:_3_communication_basic/utils/route/route_floating_buttons.dart';
import 'package:file_picker/file_picker.dart'; // for FilePicker
import 'package:flutter/material.dart';

class MyLocalFileView extends StatefulWidget {
  const MyLocalFileView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLocalFileView> createState() => _MyLocalFileViewState();
}

class _MyLocalFileViewState extends State<MyLocalFileView> {
  File? imgFile;
  bool isImageLoading = false;

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // select only images
    );

    if (result != null) {
      setState(() {
        isImageLoading = true;

        imgFile =
            File(result.files.single.path!); // Make the selected image file
        print('File Path: ${imgFile!.path}');
      });
    } else {
      // If the user cancels the selection
      print("No image selected");
    }

    setState(() {
      isImageLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local File Manager'),
      ),
      drawer: const FileMangerDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (imgFile != null)
              Image.file(imgFile!) // Display the image file on the screen
            else
              isImageLoading
                  ? const CircularProgressIndicator()
                  : const Text('You have not yet picked an image'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                pickImage(); // Open the file selector and select an image by file_picker
              },
              child: const Text('Select Image with file_picker'),
            ),
          ],
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
