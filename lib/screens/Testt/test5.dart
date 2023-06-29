import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Goo extends StatefulWidget {
  const Goo({super.key});

  @override
  State<Goo> createState() => _GooState();
}

class _GooState extends State<Goo> {
  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            GoogleMap(
              onMapCreated: (GoogleMapController googleMapController){
                setState(() {
                  mapController = googleMapController;
                });

              },
              initialCameraPosition: CameraPosition(
                zoom: 15.0,
                target: LatLng(21.251440311373333, 105.75290834364233)
              ),
              mapType: MapType.normal,
            )
          ],
        ),
      ),
    );
  }
}


