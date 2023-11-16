import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'add_Simptom.dart';

class disease extends StatefulWidget {
  const disease({super.key});

  @override
  _diseaseState createState() => _diseaseState();
}

class _diseaseState extends State<disease> {
  late Query _ref;
  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .ref()
        .child('disease')
        .orderByChild('simptom');
  }

  Widget _buildSimptomItem({required Map simptom}) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        height: 100,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.sick,
                  color: Theme.of(context).primaryColor,
                  size: 29,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(simptom['simptom'],
                    style: TextStyle(
                        fontSize: 16, color: Theme.of(context).primaryColor)),
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Disease'),
        ),
        body: SizedBox(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map simptom = snapshot.value as Map;
              return _buildSimptomItem(simptom: simptom);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const addSimptom();
              }));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )));
  }
}
