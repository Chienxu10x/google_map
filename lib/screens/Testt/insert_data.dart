import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {

  final  userNameController = TextEditingController();
  final  userLatController= TextEditingController();
  final  userLongController =TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Locations');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserting data'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Inserting data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Name',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userLatController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lat',
                  hintText: 'Enter Lat',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userLongController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Long',
                  hintText: 'Enter Long',
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Map<String, String> students = {
                    'name': userNameController.text,
                    'lat': userLatController.text,
                    'long': userLongController.text,

                  };

                  dbRef.push().set(students);

                },
                child: const Text('Insert Data'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}