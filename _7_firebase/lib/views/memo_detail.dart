import 'package:_7_firebase/models/memo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
