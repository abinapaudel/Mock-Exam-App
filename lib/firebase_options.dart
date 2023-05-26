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
    apiKey: 'AIzaSyDe14lrDDzEsHz0w5F8xjP0mmMykHt-XwQ',
    appId: '1:1044642364414:web:44cb1e7ca5f3f82cce1eaf',
    messagingSenderId: '1044642364414',
    projectId: 'mock-exam-2934d',
    authDomain: 'mock-exam-2934d.firebaseapp.com',
    storageBucket: 'mock-exam-2934d.appspot.com',
    measurementId: 'G-GXMKK74DZD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7otDn0yG9yWEHeFcwjtJHCbf8cwiTBaE',
    appId: '1:1044642364414:android:35e204a29f5ca504ce1eaf',
    messagingSenderId: '1044642364414',
    projectId: 'mock-exam-2934d',
    storageBucket: 'mock-exam-2934d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwyTtrm8M6ZP1s_UiqIsr5OYvdm8Z_1gs',
    appId: '1:1044642364414:ios:abc888d41783310fce1eaf',
    messagingSenderId: '1044642364414',
    projectId: 'mock-exam-2934d',
    storageBucket: 'mock-exam-2934d.appspot.com',
    iosClientId: '1044642364414-74m90s29g3e5enk3bb3rifu6pashkdti.apps.googleusercontent.com',
    iosBundleId: 'com.example.apiWithProvider',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwyTtrm8M6ZP1s_UiqIsr5OYvdm8Z_1gs',
    appId: '1:1044642364414:ios:abc888d41783310fce1eaf',
    messagingSenderId: '1044642364414',
    projectId: 'mock-exam-2934d',
    storageBucket: 'mock-exam-2934d.appspot.com',
    iosClientId: '1044642364414-74m90s29g3e5enk3bb3rifu6pashkdti.apps.googleusercontent.com',
    iosBundleId: 'com.example.apiWithProvider',
  );
}
