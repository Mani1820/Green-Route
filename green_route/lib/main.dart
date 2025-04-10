import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_route/Screen/starting_screen.dart';
import 'package:green_route/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StartingScreen(),
      
    );
  }
}
