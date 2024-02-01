// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'memoAdd.dart';
// import 'memoDetail.dart';
import 'package:_7_firebase/views/memo_detail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../models/memo.dart';
import 'memo_add_page.dart';

class MemoPage extends StatefulWidget {
  const MemoPage({super.key});

  @override
  State<StatefulWidget> createState() => _MemoPage();
}

class _MemoPage extends State<MemoPage> {
  FirebaseDatabase? _database;
  DatabaseReference? reference;
  final String _databaseURL =
      'https://devitworld-tutorial-default-rtdb.firebaseio.com/';
  List<Memo> memos = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    final firebaseApp = Firebase.app();
    _database = FirebaseDatabase.instanceFor(
        app: firebaseApp, databaseURL: _databaseURL);

    reference = _database!.ref().child('memo');

    reference!.onChildAdded.listen(
      (event) {
        print(event.snapshot.value.toString());
        setState(
          () {
            memos.add(Memo.fromSnapshot(event.snapshot));
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo App'),
      ),
      body: Container(
        child: Center(
          child: memos.isEmpty
              ? const CircularProgressIndicator()
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      child: GridTile(
                        header: Text(memos[index].title),
                        footer: Text(
                          memos[index].createTime.substring(0, 10),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: SizedBox(
                            child: GestureDetector(
                              onTap: () async {
                                Memo? memo = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MemoDetailPage(
                                      reference!,
                                      memos[index],
                                    ),
                                  ),
                                );

                                if (memo != null) {
                                  setState(() {
                                    memos[index] = memo;
                                  });
                                }
                              },
                              onLongPress: () {},
                              child: Text(memos[index].content),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: memos.length,
                ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MemoAddPage(reference!)));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
