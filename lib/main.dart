import 'package:dictionary/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,
      ),
      home: Home(),
    );
  }
}
