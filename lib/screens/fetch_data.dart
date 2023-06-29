import 'package:demo1/screens/Testt/ssss/test4.dart';
import 'package:demo1/screens/update_record.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Locations');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Locations');


  Widget listItem({required Map location}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Colors.lightBlueAccent,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
              location['latitude'].toString(),
              style: TextStyle(fontSize: 20),
            ),
              const SizedBox(
                height: 5,
              ),
              Text(
                location['longitude'].toString(),
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                location['title'],
                style: TextStyle(fontSize: 20),
              ),
            ],

          ),
          const SizedBox(width: 100,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateRecord(
                    locationKey: location['key'],
                  )));
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.yellow[700],
                ),

              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  reference.child(location['key']).remove();
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red[700],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetching data'),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
              Map location = snapshot.value as Map;
              location['key'] = snapshot.key;
              return listItem(location: location);
            },
          ),
        )
    );
  }
}

