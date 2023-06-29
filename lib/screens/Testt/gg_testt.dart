/*import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class HomePageTest extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageTest> {
  final textcontroller = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref();
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  double latitude = 0;
  double longitude = 0;
  var myList = [];
  List<LatLng> list = [];

  void initState() {
    super.initState();
    setState(() {
      firebaseRead();
    });
  }

  void firebaseRead() {
    databaseRef.child('Locations').onValue.listen((Event event) {
      myList = event.snapshot.value;
      setState(() {
        for (int x = 0; x < myList.length; x++) {
          double latitude = myList[x]['lat'];
          double longitude = myList[x]['long'];
          LatLng location = new LatLng(latitude, longitude);
          if (list.contains(location)) {
            list.clear();
            list.add(location);
          } else {
            list.add(location);
          }

          //Passing a dynamic marker id as the index here.
          addMarker(list[x], x);
        }
      });
    });
    //print(list);
  }

//Adding Index here as an argument
  void addMarker(loc, index) {
    //Making this markerId dynamic
    final MarkerId markerId = MarkerId('Marker $index');

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(loc.latitude, loc.longitude),
      infoWindow: InfoWindow(title: 'test'),
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
      //print(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Demo"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set.of(markers.values),
        initialCameraPosition:
        CameraPosition(target: LatLng(6.9271, 79.8612), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          firebaseRead();
        },
        label: const Text('Refresh'),
        icon: const Icon(Icons.refresh),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}*/
