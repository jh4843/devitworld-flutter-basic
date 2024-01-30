import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../models/memo.dart';

class MemoAddPage extends StatefulWidget {
  final DatabaseReference reference;

  const MemoAddPage(this.reference, {super.key});

  @override
  State<StatefulWidget> createState() => _MemoAddPage();
}

class _MemoAddPage extends State<MemoAddPage> {
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Memo'),
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
                  widget.reference
                      .push()
                      .set(Memo(
                              titleController!.value.text,
                              contentController!.value.text,
                              DateTime.now().toIso8601String())
                          .toJson())
                      .then((_) {
                    Navigator.of(context).pop();
                  });
                },
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
                child: const Text('Store'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
