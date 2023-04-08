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
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyAxFq_lZ2qeJR_VgJ14hyoHGhWSwa4PqqU',
    appId: '1:759060619248:web:05d29c1ab9894c6b038735',
    messagingSenderId: '759060619248',
    projectId: 'hungry-students-aba9a',
    authDomain: 'hungry-students-aba9a.firebaseapp.com',
    storageBucket: 'hungry-students-aba9a.appspot.com',
    measurementId: 'G-ZRPDL8JKZH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5CGvctXkmYXcYz7j7PRR08nf4ZJE_TiY',
    appId: '1:759060619248:android:eb75c2bdc4fe07d2038735',
    messagingSenderId: '759060619248',
    projectId: 'hungry-students-aba9a',
    storageBucket: 'hungry-students-aba9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC82vS3duwlQoPCeTwg4P0MgV9vs6qFk7s',
    appId: '1:759060619248:ios:cfc554d45a7ab876038735',
    messagingSenderId: '759060619248',
    projectId: 'hungry-students-aba9a',
    storageBucket: 'hungry-students-aba9a.appspot.com',
    iosClientId: '759060619248-uhbu1j4ta3s9jedg4jnrq7245p2bnpo1.apps.googleusercontent.com',
    iosBundleId: 'com.example.riveAnimation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC82vS3duwlQoPCeTwg4P0MgV9vs6qFk7s',
    appId: '1:759060619248:ios:cfc554d45a7ab876038735',
    messagingSenderId: '759060619248',
    projectId: 'hungry-students-aba9a',
    storageBucket: 'hungry-students-aba9a.appspot.com',
    iosClientId: '759060619248-uhbu1j4ta3s9jedg4jnrq7245p2bnpo1.apps.googleusercontent.com',
    iosBundleId: 'com.example.riveAnimation',
  );
}
