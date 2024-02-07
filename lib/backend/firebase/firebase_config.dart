import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBkKSMsVGPdR5g9k_EClkTL7_ql1H1cJis",
            authDomain: "hamburgueria-arcade-c64e8.firebaseapp.com",
            projectId: "hamburgueria-arcade-c64e8",
            storageBucket: "hamburgueria-arcade-c64e8.appspot.com",
            messagingSenderId: "317473292481",
            appId: "1:317473292481:web:b45f100dbb717798d35440"));
  } else {
    await Firebase.initializeApp();
  }
}
