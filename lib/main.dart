import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'greengrocer_app',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // ignore: prefer_const_constructors
      home: HomeScreen(),
    );
  }
}
