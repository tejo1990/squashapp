import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDe057YtIFwFDLBekO08ccu-cneSbLorNc",
            authDomain: "shsquash-33abe.firebaseapp.com",
            projectId: "shsquash-33abe",
            storageBucket: "shsquash-33abe.appspot.com",
            messagingSenderId: "250297510378",
            appId: "1:250297510378:web:f4e2ddf77c988bf9f7aa93",
            measurementId: "G-S6WZBEDG3R"));
  } else {
    await Firebase.initializeApp();
  }
}
