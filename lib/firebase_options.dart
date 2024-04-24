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
      return web;
    }
    switch (defaultTargetPlatform) {
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

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyD8I2MTQuIxIn-BEOyHqrW4ay6UHdv_mmE",
      authDomain: "juridico-especializado.firebaseapp.com",
      databaseURL: "https://juridico-especializado-default-rtdb.firebaseio.com",
      projectId: "juridico-especializado",
      storageBucket: "juridico-especializado.appspot.com",
      messagingSenderId: "240002468968",
      appId: "1:240002468968:web:c684a279e141922f2d7fdd",
      measurementId: "G-N9C7SG8G7C"
  );
  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyD8I2MTQuIxIn-BEOyHqrW4ay6UHdv_mmE",
      authDomain: "juridico-especializado.firebaseapp.com",
      databaseURL: "https://juridico-especializado-default-rtdb.firebaseio.com",
      projectId: "juridico-especializado",
      storageBucket: "juridico-especializado.appspot.com",
      messagingSenderId: "240002468968",
      appId: "1:240002468968:web:c684a279e141922f2d7fdd",
      measurementId: "G-N9C7SG8G7C"
  );

}