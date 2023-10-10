import 'package:flutter/material.dart';
import 'package:src_viewer/display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Social Responsible Computing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF228C4C)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: DisplayPage()
    );
  }
}
