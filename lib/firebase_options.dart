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
    apiKey: 'AIzaSyCuYaLI69-Xo1rA-L0Bc75fGYmsQAUjmLs',
    appId: '1:1008185412104:web:7a328ccf138dbc11751fbd',
    messagingSenderId: '1008185412104',
    projectId: 'gprojuridico',
    authDomain: 'gprojuridico.firebaseapp.com',
    storageBucket: 'gprojuridico.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjk3JTUMS-e38AITVzmUYSmRAWus-Dkhk',
    appId: '1:1008185412104:android:7b56949686c9f48f751fbd',
    messagingSenderId: '1008185412104',
    projectId: 'gprojuridico',
    storageBucket: 'gprojuridico.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmifVKJ9p-RBpVTjAb7EGaV6KZfrurYZY',
    appId: '1:1008185412104:ios:c80bfc7f8d0a0398751fbd',
    messagingSenderId: '1008185412104',
    projectId: 'gprojuridico',
    storageBucket: 'gprojuridico.appspot.com',
    iosClientId: '1008185412104-l7bhgn521ogf4kijq2cj7aqbhjbqbhrv.apps.googleusercontent.com',
    iosBundleId: 'com.example.npj',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmifVKJ9p-RBpVTjAb7EGaV6KZfrurYZY',
    appId: '1:1008185412104:ios:160aeb886fa66819751fbd',
    messagingSenderId: '1008185412104',
    projectId: 'gprojuridico',
    storageBucket: 'gprojuridico.appspot.com',
    iosClientId: '1008185412104-ldfnv2u3amhu6m3jnq9bi6m0j018ddet.apps.googleusercontent.com',
    iosBundleId: 'com.example.npj.RunnerTests',
  );
}
