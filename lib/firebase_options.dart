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
    apiKey: 'AIzaSyD13r_3cWXL1nqHUP-wyNMkOppxLa5RxJ4',
    appId: '1:262254007287:web:69515b2308a78a8b7714f2',
    messagingSenderId: '262254007287',
    projectId: 'metareg',
    authDomain: 'metareg.firebaseapp.com',
    storageBucket: 'metareg.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4oJFT7siHhKh2u3Ms4ywIa4CfDCyatpM',
    appId: '1:262254007287:android:dc0c81a20c224b9a7714f2',
    messagingSenderId: '262254007287',
    projectId: 'metareg',
    storageBucket: 'metareg.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsZV1u_LazlJgbRa9Iubq1_md8YaZgjaw',
    appId: '1:262254007287:ios:763c2527b1c786d67714f2',
    messagingSenderId: '262254007287',
    projectId: 'metareg',
    storageBucket: 'metareg.appspot.com',
    iosClientId: '262254007287-ac77vredcrth8k89ddhm8cbjg4big8s5.apps.googleusercontent.com',
    iosBundleId: 'com.example.metamorphosis',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsZV1u_LazlJgbRa9Iubq1_md8YaZgjaw',
    appId: '1:262254007287:ios:763c2527b1c786d67714f2',
    messagingSenderId: '262254007287',
    projectId: 'metareg',
    storageBucket: 'metareg.appspot.com',
    iosClientId: '262254007287-ac77vredcrth8k89ddhm8cbjg4big8s5.apps.googleusercontent.com',
    iosBundleId: 'com.example.metamorphosis',
  );
}
