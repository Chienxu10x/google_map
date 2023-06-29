// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFHacwJ9cPB-rIJIy183SNps38uTa6l4o',
    appId: '1:435356572090:android:08e827502dc01074a86583',
    messagingSenderId: '435356572090',
    projectId: 'demo2-8f849',
    databaseURL: 'https://demo2-8f849-default-rtdb.firebaseio.com',
    storageBucket: 'demo2-8f849.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBZhYqkJnKg5fpqIxPdwTA4KZ0pRGsHc4',
    appId: '1:435356572090:ios:5a7dfbef0278e50ca86583',
    messagingSenderId: '435356572090',
    projectId: 'demo2-8f849',
    databaseURL: 'https://demo2-8f849-default-rtdb.firebaseio.com',
    storageBucket: 'demo2-8f849.appspot.com',
    iosClientId: '435356572090-6v0opk8t3mdpk7g4uj2ni2d3q1mbs39s.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo1',
  );
}