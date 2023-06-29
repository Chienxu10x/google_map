import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:demo1/screens/fetch_data.dart';
import 'package:demo1/screens/ggmap.dart';
import 'package:demo1/screens/home_view.dart';
import 'package:demo1/screens/Testt/insert_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Firebase'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            const SizedBox(


              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                MaterialButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapSample()));
                },
                child: const Text('MAP'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 100,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InsertData()));
                  },
                  child: const Text('Insert Data'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 100,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const FetchData()));
                  },
                  child: const Text('Fetch Data'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 100,
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 */



