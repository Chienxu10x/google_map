import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_location/search_map_location.dart';
import 'package:search_map_location/utils/google_search/geo_location.dart';
import 'package:search_map_location/utils/google_search/place.dart';



class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  late GoogleMapController googleMapController;
  int currentMapTypeIndex = 0;
  List<MapType> mapTypes = [
    MapType.normal,
    MapType.satellite,
    MapType.terrain,
  ];

  Uint8List? markerImage;

  List<String> images = [
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
    'images/gas.jpg',
  ];
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLang = <LatLng>[
    LatLng(21.251440311373333, 105.75290834364233),
    LatLng(21.09353942808898, 106.00341096043165),
    LatLng(21.11596000302602, 106.07756867732057),
    LatLng(21.11596000302602, 106.07756867732057),
    LatLng(21.107632756211895, 105.98281159462918),
    LatLng(21.103148660551252, 105.7864309739789),
    LatLng(21.008951400854265, 105.69648040997474),
    LatLng(21.008951400854265, 105.69648040997474),
    LatLng(20.856761764297776, 106.00066441431099),





  ];

  Future<Uint8List> getByteFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return (await frameInfo.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer.asUint8List();
  }

   final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(21.251440311373333, 105.75290834364233),
    zoom: 10.4746,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();

  }

  loadData() async {
    for (int i = 0; i < images.length; i++) {
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
      setState(() {});
    }
  }
  void toggleMapType() {
    setState(() {
      currentMapTypeIndex = (currentMapTypeIndex + 1) % mapTypes.length;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(

              mapType: mapTypes[currentMapTypeIndex],
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: _kGooglePlex,
              markers: Set<Marker>.from(_markers),
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  googleMapController = controller;
                });
                _controller.complete(controller);
              },

            ), floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, bottom: 16.0),
          child: FloatingActionButton(
            onPressed: toggleMapType,
            child: Icon(Icons.layers),
          ),
        ),

    ),
    );
  }
}


