/*import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Locations');

  Set<Marker> markers = {};

  void addMarker(Map location) {
    Marker marker = Marker(
      markerId: MarkerId(location['key']),
      position: LatLng(
        double.parse(location['lat']),
        double.parse(location['long']),
      ),
      infoWindow: InfoWindow(
        title: location['name'],
      ),
    );
    markers.add(marker);
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
            addMarker(location); // Thêm Marker cho mỗi vị trí

            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(double.parse(location['lat']), double.parse(location['long'])),
                zoom: 12.0,
              ),
              markers: markers,
            );
          },
        ),
      ),
    );
  }
}*/
