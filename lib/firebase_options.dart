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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZl3Y_UyAEGwYtIvZKdLubID88QTcdnLQ',
    appId: '1:128714119722:android:bca1d076ef4feb19b40153',
    messagingSenderId: '128714119722',
    projectId: 'temp-bd813',
    storageBucket: 'temp-bd813.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcoohqD_PljSmHlWZyWzsujDI6mRY5SjM',
    appId: '1:128714119722:ios:4f1f2da74ea74681b40153',
    messagingSenderId: '128714119722',
    projectId: 'temp-bd813',
    storageBucket: 'temp-bd813.appspot.com',
    iosBundleId: 'com.example.lab',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDcoohqD_PljSmHlWZyWzsujDI6mRY5SjM',
    appId: '1:128714119722:ios:a836d46933d470c6b40153',
    messagingSenderId: '128714119722',
    projectId: 'temp-bd813',
    storageBucket: 'temp-bd813.appspot.com',
    iosBundleId: 'com.example.lab.RunnerTests',
  );
}