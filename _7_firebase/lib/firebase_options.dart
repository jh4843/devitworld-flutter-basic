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
    apiKey: 'AIzaSyC6S9jHmJBZ-_Z8tCvEnuI5OHXKcd7lTLE',
    appId: '1:560327441927:web:22db9a0687c6f4a2ce74a2',
    messagingSenderId: '560327441927',
    projectId: 'devitworld-tutorial',
    authDomain: 'devitworld-tutorial.firebaseapp.com',
    storageBucket: 'devitworld-tutorial.appspot.com',
    measurementId: 'G-3GH909EQM1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFbJ4OQ9Xn98l_6mGJfvwTTdh04PwWQPY',
    appId: '1:560327441927:android:1dfe940becf9bf12ce74a2',
    messagingSenderId: '560327441927',
    projectId: 'devitworld-tutorial',
    storageBucket: 'devitworld-tutorial.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHVWLX78_aPgdRI6nI5lGz9Bsar3gyUEM',
    appId: '1:560327441927:ios:04174072e33b2f0dce74a2',
    messagingSenderId: '560327441927',
    projectId: 'devitworld-tutorial',
    storageBucket: 'devitworld-tutorial.appspot.com',
    iosBundleId: 'com.example.7Firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHVWLX78_aPgdRI6nI5lGz9Bsar3gyUEM',
    appId: '1:560327441927:ios:d44f466aa8e0616ece74a2',
    messagingSenderId: '560327441927',
    projectId: 'devitworld-tutorial',
    storageBucket: 'devitworld-tutorial.appspot.com',
    iosBundleId: 'com.example.7Firebase.RunnerTests',
  );
}