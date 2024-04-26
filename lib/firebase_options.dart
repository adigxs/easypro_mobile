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
    apiKey: 'AIzaSyAwZQAGNY7KJvE5GVWMSm3vO5kJZAvCTfM',
    appId: '1:795590654565:web:a3512439970561b408a48c',
    messagingSenderId: '795590654565',
    projectId: 'easy-pro-237',
    authDomain: 'easy-pro-237.firebaseapp.com',
    storageBucket: 'easy-pro-237.appspot.com',
    measurementId: 'G-2N38N7H19C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBN18OPkRmTOHq3k54oWNQg1wAG8429SR4',
    appId: '1:795590654565:android:a9e545213260e83c08a48c',
    messagingSenderId: '795590654565',
    projectId: 'easy-pro-237',
    storageBucket: 'easy-pro-237.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfFbo5HbVMowpotxTOB134E7Agboi3UvI',
    appId: '1:795590654565:ios:15a42d1a0929d18d08a48c',
    messagingSenderId: '795590654565',
    projectId: 'easy-pro-237',
    storageBucket: 'easy-pro-237.appspot.com',
    iosBundleId: 'com.example.easyPro237',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfFbo5HbVMowpotxTOB134E7Agboi3UvI',
    appId: '1:795590654565:ios:fe833c59d3833a4e08a48c',
    messagingSenderId: '795590654565',
    projectId: 'easy-pro-237',
    storageBucket: 'easy-pro-237.appspot.com',
    iosBundleId: 'com.example.easyPro237.RunnerTests',
  );
}