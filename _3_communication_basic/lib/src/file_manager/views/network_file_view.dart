import 'dart:io'; // for File

import 'package:_3_communication_basic/src/file_manager/file_manage_drawer.dart';
import 'package:_3_communication_basic/utils/route/route_floating_buttons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart'; // to use getTemporaryDirectory

class MyNetworkFileView extends StatefulWidget {
  const MyNetworkFileView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyNetworkFileView> createState() => _MyNetworkFileViewState();
}

class _MyNetworkFileViewState extends State<MyNetworkFileView> {
  File? downloadedImage;
  bool isImageLoading = false;

  // function to download and save image
  Future<void> downloadAndSaveImage(String url, String fileName) async {
    try {
      if (downloadedImage != null) {
        downloadedImage!.delete();
        downloadedImage = null;
      }

      // get temporary directory of device
      final dir = await getTemporaryDirectory();

      // download image from given url
      Dio dio = Dio();

      setState(() {
        isImageLoading = true;
      });

      Response response = await dio.get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      final File file = File('${dir.path}/$fileName');
      file.writeAsBytesSync(response.data);

      setState(() {
        isImageLoading = false;
        downloadedImage = file;
      });
    } catch (e) {
      setState(() {
        isImageLoading = false;
      });
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network File Manager'),
      ),
      drawer: const FileMangerDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (downloadedImage != null)
              Image.file(
                  downloadedImage!) // Display the image file on the screen
            else
              isImageLoading
                  ? const CircularProgressIndicator()
                  : const Text('You have not yet downloaded any files'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                downloadAndSaveImage(
                    'https://firebasestorage.googleapis.com/v0/b/denv-funcs.appspot.com/o/devitworld_logo.png?alt=media&token=8642c35a-7664-4af7-9dfd-b166e2bdb6a6',
                    'devitworld.png');
              },
              child: const Text('Download Image'),
            ),
          ],
        ),
      ),
      floatingActionButton: const RouteFAB(),
    );
  }
}
