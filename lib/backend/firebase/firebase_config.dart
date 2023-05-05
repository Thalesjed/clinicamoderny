import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCbRh-21WwkA--1JRuXGIVnhJmwtvg6e0o",
            authDomain: "saudeok-moderny.firebaseapp.com",
            projectId: "saudeok-moderny",
            storageBucket: "saudeok-moderny.appspot.com",
            messagingSenderId: "687627055783",
            appId: "1:687627055783:web:74f22e5f4de69006e3a182",
            measurementId: "G-1NCDD04TK5"));
  } else {
    await Firebase.initializeApp();
  }
}
