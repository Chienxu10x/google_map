import 'dart:async';
import 'dart:ui' as ui;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';



class MapSample2 extends StatefulWidget {
  const MapSample2({Key? key}) : super(key: key);

  @override
  State<MapSample2> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample2> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  Set<Marker> markers = {};



  late DatabaseReference _markerRef;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.251440311373333, 105.75290834364233),
    zoom: 10,
  );


  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((value) {
      // Connect to Firebase Realtime Database
      _markerRef = FirebaseDatabase.instance.reference().child('Locations');
      _markerRef.onChildAdded.listen((DatabaseEvent event) {
      // Lấy dữ liệu marker từ sự kiện
      Map<String, dynamic>? markerData = event.snapshot.value as Map<String, dynamic>?;

      if (markerData != null) {
        // Lấy giá trị title và kiểm tra null trước khi tạo Marker
        String title = markerData['title'] as String? ?? '';

        // Tạo một đối tượng Marker từ dữ liệu
        Marker marker = Marker(
          markerId: MarkerId(event.snapshot.key ?? ''),
          position: LatLng(
            markerData['latitude'] as double? ?? 0.0,
            markerData['longitude'] as double? ?? 0.0,
          ),
          infoWindow: InfoWindow(
            title: title,
          ),
        );

        // Thêm marker vào set markers
        setState(() {
          markers.add(marker);
        });
      }
    });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,
        onTap: (LatLng location) {
          _showAddMarkerDialog(location);
        },
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, bottom: 16.0),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                markers.clear();
              });
              // Xử lý sự kiện khi nhấn nút
            },
            child: Icon(Icons.delete),
          ),
        ),
      ),

    );
  }
  void _showAddMarkerDialog(LatLng location) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController titleController = TextEditingController();
        return AlertDialog(
          title: Text('Add Marker'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Marker Title',
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                // Lưu marker vào CSDL
                _saveMarkerToDatabase(titleController.text, location);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _saveMarkerToDatabase(String title, LatLng location) {
    // Create a new marker
    Marker marker = Marker(
      markerId: MarkerId(location.toString()),
      position: location,
      infoWindow: InfoWindow(
        title: title,
      ),
    );

    // Save the marker to the database
    _markerRef.push().set({
      'title': marker.infoWindow.title,
      'latitude': marker.position.latitude,
      'longitude': marker.position.longitude,
    }).then((value) {
      // Add the marker to the markers set
      setState(() {
        markers.add(marker);
      });
    });
  }

}