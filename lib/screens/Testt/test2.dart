import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';



class MapSample1 extends StatefulWidget {
  const MapSample1({Key? key}) : super(key: key);

  @override
  State<MapSample1> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample1> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  Set<Marker> markers = {};


  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


  Uint8List? markerImage;


  List<String> images = [
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
  ];

  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLang = <LatLng>[
    LatLng(21.251440311373333, 105.75290834364233),
    LatLng(21.251440311373333, 106.75290834364233),
    LatLng(21.251440311373333, 107.75290834364233),
    LatLng(21.251440311373333, 108.75290834364233),

  ];

  Future<Uint8List> getByteFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List() , targetHeight: width);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return (await frameInfo.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();

  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.251440311373333, 105.75290834364233),
    zoom: 14.4746,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {

    for(int i = 0; i< images.length ; i++){

      final Uint8List markerIcon = await getByteFromAssets(images[i], 100);
      _markers.add(
        Marker(markerId: MarkerId(i.toString()),
            position: _latLang[i],
            icon: BitmapDescriptor.fromBytes(markerIcon),
            infoWindow: InfoWindow(
                title: 'marker' + i.toString()
            )
        ),
      );
      setState(() {
      });
    }
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
                setState(() {
                  markers.add(
                    Marker(
                      markerId: MarkerId(location.toString()),
                      position: location,
                      infoWindow: InfoWindow(
                        title: titleController.text,
                      ),
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Xóa tất cả các marker
          setState(() {
            markers.clear();
          });
        },
        child: Icon(Icons.delete),
      ),

      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),*/
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}