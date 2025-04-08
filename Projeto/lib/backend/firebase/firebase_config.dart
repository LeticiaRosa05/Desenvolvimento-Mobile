import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAoIkHj3ISON0J_sF7-ngfmZ8AAHF32Ez4",
            authDomain: "listlink2-8ed9b.firebaseapp.com",
            projectId: "listlink2-8ed9b",
            storageBucket: "listlink2-8ed9b.firebasestorage.app",
            messagingSenderId: "97907131043",
            appId: "1:97907131043:web:3b91e53a61ec97689eb516"));
  } else {
    await Firebase.initializeApp();
  }
}
