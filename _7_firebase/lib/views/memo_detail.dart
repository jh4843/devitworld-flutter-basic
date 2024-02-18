import 'dart:io';

import 'package:_7_firebase/models/memo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MemoDetailPage extends StatefulWidget {
  const MemoDetailPage(this.reference, this.memo, {Key? key}) : super(key: key);
  final DatabaseReference reference;
  final Memo memo;

  @override
  State<MemoDetailPage> createState() => _MemoDetailPageState();
}

class _MemoDetailPageState extends State<MemoDetailPage> {
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.memo.title);
    contentController = TextEditingController(text: widget.memo.content);
  }

  Future<void> saveMemoToFileAndUpload() async {
    final dateTime = DateTime.now();
    final fileName = '${dateTime.toIso8601String()}_memo.txt';
    final localFile =
        await _writeMemoToLocalFile(fileName, widget.memo.content);

    try {
      await FirebaseStorage.instance.ref('memos/$fileName').putFile(localFile);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Save memo as file and upload success!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occured: $e')),
      );
    }
  }

  Future<File> _writeMemoToLocalFile(String fileName, String content) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');

    // Write the file (File Name and Content)
    final fileContent = 'Title: $fileName\n\nContents: $content';
    return file.writeAsString(fileContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.memo.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    labelText: 'Title', fillColor: Colors.blueAccent),
              ),
              Expanded(
                  child: TextField(
                controller: contentController,
                keyboardType: TextInputType.multiline,
                maxLines: 100,
                decoration: const InputDecoration(labelText: 'Contents'),
              )),
              MaterialButton(
                onPressed: () {
                  Memo memo = Memo(titleController!.value.text,
                      contentController!.value.text, widget.memo.createTime);

                  widget.reference
                      .child(widget.memo.key!)
                      .set(memo.toJson())
                      .then((_) {
                    Navigator.of(context).pop(memo);
                  });
                },
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveMemoToFileAndUpload();
        },
        child: const Icon(Icons.save_alt),
      ),
    );
  }
}
