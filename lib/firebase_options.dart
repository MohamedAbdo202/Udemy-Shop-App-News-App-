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
    apiKey: 'AIzaSyDYRki6TppxhqjZSJXRspOcX02HwkaWcEg',
    appId: '1:269279333257:web:3cf8995b8a79b770f86f58',
    messagingSenderId: '269279333257',
    projectId: 'grad1-c3a5e',
    authDomain: 'grad1-c3a5e.firebaseapp.com',
    storageBucket: 'grad1-c3a5e.appspot.com',
    measurementId: 'G-4PCZQMECL5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZ5cY8YIYwMGTVwCyHEJEXydqOAgleFrs',
    appId: '1:269279333257:android:4ae367605b665dd4f86f58',
    messagingSenderId: '269279333257',
    projectId: 'grad1-c3a5e',
    storageBucket: 'grad1-c3a5e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCr7OVWAbXVuFlB6sPw_fP7A9k_HoN2RuE',
    appId: '1:269279333257:ios:78be54dd5fe6923ff86f58',
    messagingSenderId: '269279333257',
    projectId: 'grad1-c3a5e',
    storageBucket: 'grad1-c3a5e.appspot.com',
    iosClientId: '269279333257-9375tfdmn36aro6eiisee3b5dm6mqbds.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutttter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCr7OVWAbXVuFlB6sPw_fP7A9k_HoN2RuE',
    appId: '1:269279333257:ios:78be54dd5fe6923ff86f58',
    messagingSenderId: '269279333257',
    projectId: 'grad1-c3a5e',
    storageBucket: 'grad1-c3a5e.appspot.com',
    iosClientId: '269279333257-9375tfdmn36aro6eiisee3b5dm6mqbds.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutttter',
  );
}
