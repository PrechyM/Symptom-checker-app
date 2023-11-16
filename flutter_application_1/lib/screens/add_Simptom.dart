import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class addSimptom extends StatefulWidget {
  const addSimptom({super.key});

  @override
  _addSimptomState createState() => _addSimptomState();
}

class _addSimptomState extends State<addSimptom> {
  late TextEditingController _nameController;
  late DatabaseReference _ref;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Disease');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save Simptom'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter Simptom',
                prefixIcon: Icon(
                  Icons.sick,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter Simptom#2',
                prefixIcon: Icon(
                  Icons.sick,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter Simptom#3',
                prefixIcon: Icon(
                  Icons.sick,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                child: const Text(
                  'Save Simptom',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  saveSimptom();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveSimptom() {
    String simptom = _nameController.text;

    Map<String, String> disease = {
      'simptom': simptom,
    };

    _ref.push().set(disease).then((value) {
      Navigator.pop(context);
    });
  }
}
