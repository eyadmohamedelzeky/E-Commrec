// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCIE-4tlVPq7ehnqeUVfktPNsFzxB-Qj6E',
    appId: '1:559626064233:web:2e93a7e3f1e204562cadf8',
    messagingSenderId: '559626064233',
    projectId: 'e-commerce-383db',
    authDomain: 'e-commerce-383db.firebaseapp.com',
    databaseURL: 'https://e-commerce-383db-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-383db.appspot.com',
    measurementId: 'G-QQQ8GCKGQZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZqBDz8IjvHq9JzyZ3WaTHu82spZW0Ojs',
    appId: '1:559626064233:android:7d166f0d11a651102cadf8',
    messagingSenderId: '559626064233',
    projectId: 'e-commerce-383db',
    databaseURL: 'https://e-commerce-383db-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-383db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYh84dR2S5JoCTwBUjWBE6UkJTghj-Pns',
    appId: '1:559626064233:ios:945146fb4921e35f2cadf8',
    messagingSenderId: '559626064233',
    projectId: 'e-commerce-383db',
    databaseURL: 'https://e-commerce-383db-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-383db.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYh84dR2S5JoCTwBUjWBE6UkJTghj-Pns',
    appId: '1:559626064233:ios:945146fb4921e35f2cadf8',
    messagingSenderId: '559626064233',
    projectId: 'e-commerce-383db',
    databaseURL: 'https://e-commerce-383db-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-383db.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCIE-4tlVPq7ehnqeUVfktPNsFzxB-Qj6E',
    appId: '1:559626064233:web:5e6ff9c23f6945f62cadf8',
    messagingSenderId: '559626064233',
    projectId: 'e-commerce-383db',
    authDomain: 'e-commerce-383db.firebaseapp.com',
    databaseURL: 'https://e-commerce-383db-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-383db.appspot.com',
    measurementId: 'G-QLH6S9GS1J',
  );
}