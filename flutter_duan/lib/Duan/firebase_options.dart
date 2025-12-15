import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD8co9IvkAEm1OTKfESl3z2j7bAgzQIgK0',
    appId: '1:53343101252:web:0eaf19681ef3a9ee2f3711',
    messagingSenderId: '53343101252',
    projectId: 'myflutter-c271b',
    authDomain: 'myflutter-c271b.firebaseapp.com',
    storageBucket: 'myflutter-c271b.firebasestorage.app',
    measurementId: 'G-2QQDJJX37X',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD8co9IvkAEm1OTKfESl3z2j7bAgzQIgK0',
    appId: '1:53343101252:web:79679b5b00dc47352f3711',
    messagingSenderId: '53343101252',
    projectId: 'myflutter-c271b',
    authDomain: 'myflutter-c271b.firebaseapp.com',
    storageBucket: 'myflutter-c271b.firebasestorage.app',
    measurementId: 'G-LHFTY7G5RV',
  );
}
