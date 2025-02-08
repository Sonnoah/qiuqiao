import 'package:firebase_core/firebase_core.dart';
import 'package:qiuqiao/components/nav.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 255, 255, 255)
          ),
        )
      ),
      home: const Nav(),
    );
  }
}
