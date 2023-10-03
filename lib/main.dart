import 'package:flutter/material.dart';
import 'package:sias/screens/login_screen.dart';
import 'package:sias/screens/signup_screen.dart';
import 'package:sias/screens/splash2_screen..dart';
import 'package:sias/screens/splash_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(Sias());
}
class Sias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'She is a Survivor',
      home: SplashScreen(),
    );
  }
}
