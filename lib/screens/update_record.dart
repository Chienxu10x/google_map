import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateRecord extends StatefulWidget {

  const UpdateRecord({Key? key, required this.locationKey}) : super(key: key);

  final String locationKey;

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {

  final  userTitleController = TextEditingController();
  final  userLatController= TextEditingController();
  final  userLongController= TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Locations');
    getLocationData();
  }

  void getLocationData() async {
    DataSnapshot snapshot = await dbRef.child(widget.locationKey).get();

    Map location = snapshot.value as Map;
    userLatController.text = location['latitude'].toString();
    userLongController.text = location['longitude'].toString();
    userTitleController.text = location['title'].toString();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updating record'),
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Updating data in Firebase Realtime Database',
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
                controller: userLatController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'latitude',
                  hintText: 'Enter latitude',
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
                  labelText: 'longitude',
                  hintText: 'Enter longitude',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userTitleController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'title',
                  hintText: 'Enter name',
                ),
              ),

              MaterialButton(
                onPressed: () {
                  Map<String, String> locations = {
                    'latitude': userLatController.text,
                    'longitude': userLongController.text,
                    'title': userTitleController.text,
                  };

                  dbRef.child(widget.locationKey).update(locations)
                      .then((value) => {
                    Navigator.pop(context)
                  });
                },
                child: const Text('Update Data'),
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