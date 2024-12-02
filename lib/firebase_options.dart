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
    apiKey: 'AIzaSyB-lb9CoP5T2U1Y8CtZLuJwGPUa2AJjOfE',
    appId: '1:437248437352:web:a5754555d03fbb91805fdd',
    messagingSenderId: '437248437352',
    projectId: 'library-33a70',
    authDomain: 'library-33a70.firebaseapp.com',
    storageBucket: 'library-33a70.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTjCJiPziVFgxvdBRDirJAsw4M1PeMv5k',
    appId: '1:437248437352:android:850f6292358ae0df805fdd',
    messagingSenderId: '437248437352',
    projectId: 'library-33a70',
    storageBucket: 'library-33a70.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAg-8eN8L6RQB7-OaBgAEXH2bL7aDYZ91E',
    appId: '1:437248437352:ios:8b233cb5341dccdc805fdd',
    messagingSenderId: '437248437352',
    projectId: 'library-33a70',
    storageBucket: 'library-33a70.appspot.com',
    iosBundleId: 'com.example.libraryStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAg-8eN8L6RQB7-OaBgAEXH2bL7aDYZ91E',
    appId: '1:437248437352:ios:8b233cb5341dccdc805fdd',
    messagingSenderId: '437248437352',
    projectId: 'library-33a70',
    storageBucket: 'library-33a70.appspot.com',
    iosBundleId: 'com.example.libraryStore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB-lb9CoP5T2U1Y8CtZLuJwGPUa2AJjOfE',
    appId: '1:437248437352:web:2633198c16305a51805fdd',
    messagingSenderId: '437248437352',
    projectId: 'library-33a70',
    authDomain: 'library-33a70.firebaseapp.com',
    storageBucket: 'library-33a70.appspot.com',
  );
}
