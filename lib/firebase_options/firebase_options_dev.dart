// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_dev.dart';
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
      // ignore: no_default_cases
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCycMttLSEZtE9fm82t2DCO8ySLfVO3K_E',
    appId: '1:562732892645:android:788e2c305501446f036f0c',
    messagingSenderId: '562732892645',
    projectId: 'good-wallet-dev',
    storageBucket: 'good-wallet-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWcOUb8qLJeT-jbc0XRdsqvmYQey4z4fQ',
    appId: '1:562732892645:ios:7eea0415645c4e77036f0c',
    messagingSenderId: '562732892645',
    projectId: 'good-wallet-dev',
    storageBucket: 'good-wallet-dev.appspot.com',
    androidClientId: '562732892645-788k7jqqhctuqbd8lduhefo4a656u06s.apps.googleusercontent.com',
    iosClientId: '562732892645-un4pvbsafvtbrmivg68hs0b43k6014na.apps.googleusercontent.com',
    iosBundleId: 'com.chuffy.goodwallet.dev',
  );
}
